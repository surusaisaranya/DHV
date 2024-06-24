# Required libraries
library(scatterplot3d)
library(plot3D)
library(akima)  # for interpolation

# Given data
locations <- c("A", "B", "C", "D", "E")
temperature <- c(15, 20, 18, 12, 17)   # in °C
humidity <- c(65, 70, 68, 60, 72)      # in %
co2_levels <- c(400, 450, 420, 380, 430)  # in ppm

# Task 1: CO2 levels variation with temperature and humidity
scatterplot3d(temperature, humidity, co2_levels, color="blue",
              xlab="Temperature (°C)", ylab="Humidity (%)", zlab="CO2 Levels (ppm)",
              main="CO2 Levels Variation with Temperature and Humidity")

# Task 2: 3D scatter plot of temperature, humidity, and CO2 levels
scatter3D(temperature, humidity, co2_levels, colvar=co2_levels,
          col=rainbow(length(locations)), pch=19, cex=2,
          xlab="Temperature (°C)", ylab="Humidity (%)", zlab="CO2 Levels (ppm)",
          main="Relationship between Temperature, Humidity, and CO2 Levels")

# Task 3: Spatial pattern in the 3D plot of temperature, humidity, and CO2 levels among locations
text3D(temperature, humidity, co2_levels, locations, adj = 0.5, cex=0.7)

# Task 4: 3D surface plot of CO2 levels with temperature and humidity
x <- seq(min(temperature), max(temperature), length.out=20)
y <- seq(min(humidity), max(humidity), length.out=20)
xyz <- expand.grid(x=x, y=y)
xyz$z <- interp(xyz$x, xyz$y, co2_levels, duplicate="mean")$z

scatter3D(xyz$x, xyz$y, xyz$z, colvar=xyz$z,
          col=rainbow(100), pch=19, cex=2,
          xlab="Temperature (°C)", ylab="Humidity (%)", zlab="CO2 Levels (ppm)",
          main="CO2 Levels Surface Plot")

# Task 5: Compare 3D plots of CO2 levels against temperature and humidity separately
par(mfrow=c(1, 2))

# Plot 1: CO2 Levels vs Temperature
scatter3D(temperature, rep(0, length(locations)), co2_levels, colvar=co2_levels,
          col=rainbow(length(locations)), pch=19, cex=2,
          xlab="Temperature (°C)", ylab="CO2 Levels (ppm)", zlab="",
          main="CO2 Levels vs Temperature")

# Plot 2: CO2 Levels vs Humidity
scatter3D(humidity, rep(0, length(locations)), co2_levels, colvar=co2_levels,
          col=rainbow(length(locations)), pch=19, cex=2,
          xlab="Humidity (%)", ylab="CO2 Levels (ppm)", zlab="",
          main="CO2 Levels vs Humidity")
