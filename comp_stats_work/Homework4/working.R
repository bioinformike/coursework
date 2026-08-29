rhom_area <- function(n)
{
  #library(ggplot2)
  # Think of rhombus in square
  # Get the area of the square, and multiply by fraction of points that
  # fall within rhombus from all points that fall into square.
  # Long Diag = 4
  # Short Diag = 2
  SHORT = 2
  LONG = 4
  
  # Define R as long diag / 2
  R = 4/2
  
  
  # Generate our x,y df between -2 and 2 to cover square surrounding
  # this rhombus.  Generate rows equal to the handed in sample size, n.
  df = data.frame(x = runif(n, -2, 2), y = runif(n, -2, 2))
  
  df$withinRhombus = with(df, ((2*abs(x) + 1*abs(y)) < R))
  ggplot(data = df, aes(x = x, y = y)) + geom_point(aes(color = withinRhombus))
  
  # Determine if a point falls within rhombus
  # (2 * abs(df$x) + 1 * abs(df$y)) < R
  # 
  # Sum up the number of points in our df that fall within rhombus
  # sum(2*abs(df$x) + 1*abs(df$y) < R))
  #
  # Divide by n to get the ratio of points within rhombus to total points,
  # which is our ratio to transform area of square to area of rhombus.
  #thetaHat = ((sum(2*abs(df$x) + 1*abs(df$y) < R)) / n)
  
  # Calculate that area
  #areaHat = thetaHat * (2*SHORT)^2
  
  #return(list(areaHat = areaHat, N = n))
}

