library(DBI)
library(RSQLite)
library("dplyr")
library(maps)
library(ggplot2)
library(plotly)

setwd("C:/Users/Mike/Desktop/Mike/UC/Spring_2018/BE8093_DB/hw/project/vaers")

con1 = dbConnect(SQLite(), dbname="../vaers.db")
#ded <- dbReadTable(con, "death")
# q <- dbSendQuery(con, 'SELECT * FROM REPORT')
# 
# 
# ded <- dbFetch(q, n = -1)


q <- dbSendQuery(con1, 'select count(*) as deaths, STATE, year from REPORT where died = "Y" group by state, year')


# Stuff it in a df
ded <- dbFetch(q, n = -1)



# We have some deaths with no state attribute, lets sum those and kick out
state_unk <- ded[which(ded$STATE == ""),]
ded <- ded[which(ded$STATE != ""),]


yr = '2010'

# filter on year
yr_state_unk <- state_unk[which(state_unk$year == yr),]
yr_ded <- ded[which(ded$year == yr),]

#df$hover <- with(df, paste(state, '<br>', "Beef", beef, "Dairy", dairy, "<br>",
#                           "Fruits", total.fruits, "Veggies", total.veggies,
#                           "<br>", "Wheat", wheat, "Corn", corn))
# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)
# specify some map projection/options
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

p <- plot_geo(yr_ded, locationmode = 'USA-states') %>%
  add_trace(
    z = ~deaths, locations = ~STATE,
    color = ~deaths, colors = 'YlOrBr'
  ) %>%
  colorbar(title = "Reported Deaths") %>%
  layout(
    title = paste("VAERS Reported Deaths for ", yr),
    geo = g
  )
p






q3 <- dbSendQuery(con1, 'select vax.VAX_TYPE as type, vax.VAX_MANU as mfg, vax.VAX_LOT as lot, vax.VAX_ROUTE as rt, 
                    vax.VAX_SITE as site, vax.VAX_NAME as name, report.year as year from REPORT join VAX on 
                  vax.VAERS_ID = report.VAERS_ID where report.DIED = "Y"' )
vax <- dbFetch(q3, n = -1)


# Cleanup
vax$year <- as.integer(vax$year)

# Grab total data
tot <- vax %>% group_by(year) %>% summarise(deaths = n())
tot$mfg <- as.factor("TOTAL")



# Work on vax data
# Manufactures
#interesting - would like to show changes over time with these guys too.
# We need to limit by top 6 otherwise this will get crazy
tmp_vax <- vax %>% group_by(mfg) %>% summarise(deaths = n()) %>% arrange(desc(deaths)) %>% head()
vax_manu <- vax %>% filter(mfg %in% tmp_vax$mfg) %>% group_by(mfg, year) %>% summarise(deaths = n())

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

yr = 2012

# Let's get dynamical!
mfg_dat <- vax_manu[vax_manu$year <= yr,]
name_dat <- vax_name[vax_name$year <= yr,]



vax_man_plot <-ggplot(mfg_dat, aes(x = year, y = deaths, colour = mfg)) + 
    geom_line() + ylab(label="Number of Deaths") + 
    xlab("Year") + xlim(2008, 2018) +
    scale_fill_brewer(palette="Set1", br) +
    ggtitle("VAERS Reported Deaths by Manufacturer")


