library(shiny)
library(plotly)
library(ggplot2)
library(DBI)
library(RSQLite)
library(dplyr)
library(shinydashboard)
library(DT)

#Expensive and can be shared so run once.
# Set up our DB connection
con = dbConnect(SQLite(), dbname="vaers.db")

# Get the VAERS info on people who died for our map
q <- dbSendQuery(con, 'select count(*) as deaths, STATE, year from REPORT where died = "Y" group by state, year')

# Stuff it in a df
ded <- dbFetch(q, n = -1)

q2 <- dbSendQuery(con, 'select VAERS_ID as id, STATE, year, AGE_YRS, SEX, numdays from REPORT where died = "Y"')

# Stuff it in a df
demo <- dbFetch(q2, n = -1)

q3 <- dbSendQuery(con, 'select vax.VAX_TYPE as type, vax.VAX_MANU as mfg, vax.VAX_LOT as lot, vax.VAX_ROUTE as rt, 
                    vax.VAX_SITE as site, vax.VAX_NAME as name, report.year as year from REPORT join VAX on 
                    vax.VAERS_ID = report.VAERS_ID where report.DIED = "Y"' )
vax <- dbFetch(q3, n = -1)

q4 <- dbSendQuery(con, 'select count(*) as deaths,  year from REPORT  where died = "Y" group by  year ')

all <-  dbFetch(q4, n = -1)


ui <- dashboardPage(
    
  dashboardHeader(
    title = "VAERS - In Search of Death",
    titleWidth = 300
  ),
  
  dashboardSidebar(
      sidebarMenu(
        menuItem("Overall", tabName = "over" , icon = icon("signal")),
        menuItem("Geographic", tabName = "geo", icon = icon("map-marker")),
        menuItem("Demographic", icon = icon("users"), tabName = "demo"),
        menuItem("Manufacturer", icon = icon("industry"), tabName = "man"),
        menuItem("Vaccine", icon = icon("medkit"), tabName = "vax"),
        menuItem("About", icon = icon("book"), tabName = "about"),
        sliderInput("year_sel", label = "Select Year", min = 2008, max = 2018, value = 2008, 
                    sep = "", step = 1 ) 
        
      )
      
    ),
    dashboardBody(
      tabItems(
        
        tabItem(tabName = "over",
                plotlyOutput("over", height = "500px")
        ),
        tabItem(tabName = "geo",
           plotlyOutput("geo", height = "500px"),
           textOutput("click"),
           
           plotlyOutput("geo_time", height = "500px")
           
        ),
  
        tabItem(tabName = "demo",
           plotlyOutput("demo", height = "500px")
            ),
            
        tabItem(tabName = "man",
            plotlyOutput("vax_man", height = "500px")
            ),
        tabItem(tabName = "vax",
            plotlyOutput("vax_name", height = "500px")
             ),
        tabItem(tabName = "about",
                h3("VAERS - In Search of Death"),
                h4("Mike Lape"),
                h4("This project was made using publicly available data from"),
                a(href="https://vaers.hhs.gov", "Vaccine Adverse Events Reporting System (VAERS)"),
                h4("Project sourcecode is availabe on"),
                a(href="https://github.com/achtungmike/hc_db/blob/master/project/vaers/app.R", "GitHub")
        )
        )
       
    )
)
    


server <- function(input, output) {
  

  # Simple line plot for all trend line
  #pl <- ggplot(data = all, aes(x = year, y = deaths))
  
  pl <- plot_ly(all, x = ~year, y = ~deaths, type = 'scatter', mode = 'lines+markers')%>%
    layout(title = "Trend in Deaths Reported to VAERS",
           xaxis = list(title = "Year"),
           yaxis = list (title = "Deaths"))
  
  
  output$over<- renderPlotly({
    pl
  })
  # The year from the slider input
  yr <- reactive({input$year_sel})


  
  # We are going to have a simple plot across the bottom that just tracks all the states over time
  # so we need to have data by state by year
  ded$year <- as.integer(ded$year)
  
  
  # We have some deaths with no state attribute, lets sum those and kick out
  state_unk <- ded[which(ded$STATE == ""),]
  ded <- ded[which(ded$STATE != ""),]
  
  
  # filter on year
  yr_state_unk <- reactive({state_unk[which(state_unk$year == yr()),]})
  yr_ded <- reactive({ded[which(ded$year == yr()),]})
  

  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)
  # specify some map projection/options
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  geo_p <- reactive({plot_geo(yr_ded(), locationmode = 'USA-states') %>%
    add_trace(
      z = ~deaths, locations = ~STATE,
      color = ~deaths, colors = rev('RdYlBu')
    ) %>%
    colorbar(title = "Reported Deaths") %>%
    layout(
      title = paste("VAERS Reported Deaths for ", yr()),
      height = 500,
      geo = g
    )})
  

  # renderPlotly() also understands ggplot2 objects!
  output$geo <- renderPlotly({
    geo_p()
  })

  output$click <- renderPrint({
    d <- event_data("plotly_click")
    if (is.null(d)) "Click on a state to view trend data for that state!" 
    
    else
    {
      st <- yr_ded()[(d$pointNumber+1),2]
      ded$deaths <- as.integer(ded$deaths)
      ded$year <- as.integer(ded$year)
      
      # Limit to state
      ded_st <- ded[ded$STATE == st,]
      
      geo_time_plot <- ggplot(ded_st, aes(x = year, y = deaths, colour = STATE )) + 
        geom_line() + 
        ylab(label=paste("Number of Deaths in ", st)) + xlab("Year") + 
        scale_x_continuous(breaks = c(2008:2018), limits = c(2008, 2018))+ 
        ggtitle(paste("VAERS Reported Deaths in ", st))
      output$geo_time <- renderPlotly({
        geo_time_plot
      })
    }
  })
  
 

  observeEvent(input$year_sel, {
    print("Before")
    output$geo_time <- renderPlotly({
      plotly_empty()
    })
  }, ignoreInit = T)

  
  
  
  
  # demographics (age on y-axis, year on x-axis (separate circle for sex, size is count
  # prep data
  demo$SEX <- as.factor(demo$SEX)
  demo$AGE_YRS <- as.double(demo$AGE_YRS)
  demo_dat <- subset.data.frame(demo, select=c('year', 'AGE_YRS', 'SEX'))
  demo_dat <- demo_dat[which(demo_dat$AGE_YRS != ""),]
  # decimal years (lets round those up so we don't have 0 yr olds)
  demo_dat$AGE_YRS <- round(demo_dat$AGE_YRS)
  demo_dat$AGE_YRS <- as.integer(demo_dat$AGE_YRS)
  
  # Change sex from abbr to words for legend:
  demo_dat$SEX <- ifelse(demo_dat$SEX == "F", "Female",
                         ifelse(demo_dat$SEX == "M", "Male", "Unknown"))
  
  
  # Collect data
  demo <- demo_dat %>% group_by(AGE_YRS, year, SEX) %>% summarise(ded = n())
  
  cols <- c('#66c2a5', '#fc8d62', '#8da0cb')
  demo_p <- plot_ly(demo, x = ~AGE_YRS, y = ~year, text = ~ded, type = 'scatter', 
                    size = ~ded, colors = cols, mode = 'markers', 
               marker = list(opacity = .5, sizemode = 'diameter', opacity = 1), color = ~SEX) %>%
    layout(title = 'Vaccine Deaths by Age and Gender Over Time', height = 500,
        xaxis = list(title = 'Age (Years)',
                   gridcolor = 'rgb(0, 0, 0)'),
       yaxis = list(title = 'Year of Vaccine',
                    gridcolor = 'rgb(255, 255, 255)'),
       legend = list(orientation = 'h')
          
       )
                                
      
    
  #Output demo plot
  output$demo <- renderPlotly({
    demo_p
  })
  
  
  
  
  
  
  # Cleanup
  vax$year <- as.integer(vax$year)
  
  # Grab total data
  tot <- vax %>% group_by(year) %>% summarise(deaths = n())
  tot$mfg <- as.factor("TOTAL")
  
  
  # Work on vax data
  #interesting - would like to show changes over time with these guys too.
  # We need to limit by top 6 otherwise this will get crazy
  
  
  # Manufactures
  #Filter to only top 6 manufacturers
  tmp_vax <- vax %>% group_by(mfg) %>% summarise(deaths = n()) %>% arrange(desc(deaths)) %>% head()
  vax_manu <- vax %>% filter(mfg %in% tmp_vax$mfg) %>% group_by(mfg, year) %>% summarise(deaths = n())
  
  # Slap in the total data
  vax_manu$mfg <- as.factor(vax_manu$mfg)
  vax_manu <- rbind.data.frame(vax_manu, tot)
  
  
  # Name of vaccine
  #15 here
  tot$mfg <- NULL
  tot$name <- "TOTAL"
  tmp_vax <- vax %>% group_by(name) %>% summarise(deaths = n()) %>% arrange(desc(deaths)) %>% head(10)
  vax_name <- vax %>% filter(name %in% tmp_vax$name) %>% group_by(name, year) %>% summarise(deaths = n())
  
  vax_name$name <- as.factor(vax_name$name)
  vax_name <- rbind.data.frame(vax_name, tot)
   

  
  # Let's get dynamical!
  mfg_dat <- reactive({vax_manu[vax_manu$year <= yr(),]})
  name_dat <- reactive({vax_name[vax_name$year <= yr(),]})
  
  # not really interesting
  #vax_rt <- vax %>% group_by(rt) %>% summarise(n = n())
  #vax_type <- vax %>% group_by(type, year) %>% summarise(n = n())
  #vax_site <- vax %>% group_by(site) %>% summarise(n = n())
  
  
  vax_man_plot <- reactive({ ggplot(mfg_dat(), aes(x = year, y = deaths, colour = mfg), colo) + 
                geom_line() + ylab(label="Number of Deaths") + geom_point() +
                xlab("Year") + 
                scale_x_continuous(breaks = c(2008:2018), limits = c(2008, 2018))+ 
                ggtitle("VAERS Reported Deaths by Manufacturer") 
                
                })
  

  
  
  vax_name_plot <- reactive({ ggplot(name_dat(), aes(x = year, y = deaths, colour = name)) + 
                 geom_line() + ylab(label="Number of Deaths") + geom_point() +
                 xlab("Year") + 
                  scale_x_continuous(breaks = c(2008:2018), limits = c(2008, 2018))+ 
                  ggtitle("VAERS Reported Deaths by Name of Vaccine") 
                  
             })
    output$vax_man <- renderPlotly({
    vax_man_plot()
  })
  
     output$vax_name <- renderPlotly({
     vax_name_plot()
   })

}

shinyApp(ui, server)
