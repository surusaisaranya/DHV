# Load necessary libraries
library(ggplot2)
library(scatterplot3d)
library(plotly)
library(akima)

# Define weather data
weather_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  Wind_Speed = c(15, 12, 18, 20, 16)
)

# Task 1: Scatterplot3d for Temperature vs Humidity and Wind Speed
scatterplot3d(weather_data$Humidity, weather_data$Wind_Speed, weather_data$Temperature,
              xlab = "Humidity (%)", ylab = "Wind Speed (km/h)", zlab = "Temperature (°C)",
              color = "blue", pch = 16,
              main = "Temperature vs Humidity and Wind Speed")

# Task 2: 3D Surface Plot
# Create a grid for Humidity and Wind Speed
humidity_seq <- seq(min(weather_data$Humidity), max(weather_data$Humidity), length.out = 100)
wind_speed_seq <- seq(min(weather_data$Wind_Speed), max(weather_data$Wind_Speed), length.out = 100)
grid <- expand.grid(Humidity = humidity_seq, Wind_Speed = wind_speed_seq)

# Fit a linear model
model <- lm(Temperature ~ Humidity + Wind_Speed, data = weather_data)

# Predict temperature on the grid
grid$Temperature <- predict(model, newdata = grid)

# Convert grid to matrix form for plotting
temperature_matrix <- matrix(grid$Temperature, nrow = 100, ncol = 100)

# 3D surface plot using plot_ly
plot_ly(z = ~temperature_matrix, x = ~humidity_seq, y = ~wind_speed_seq, type = 'surface') %>%
  layout(scene = list(
    xaxis = list(title = 'Humidity (%)'),
    yaxis = list(title = 'Wind Speed (km/h)'),
    zaxis = list(title = 'Temperature (°C)')
  ))

# Task 3: Correlation between Temperature, Humidity, and Wind Speed
cor_temp_humidity <- cor(weather_data$Temperature, weather_data$Humidity)
cor_temp_wind_speed <- cor(weather_data$Temperature, weather_data$Wind_Speed)

cat("Correlation between Temperature and Humidity:", cor_temp_humidity, "\n")
cat("Correlation between Temperature and Wind Speed:", cor_temp_wind_speed, "\n")

# Task 4: Plot Temperature vs. Humidity
ggplot(weather_data, aes(x = Humidity, y = Temperature)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  ggtitle("Temperature vs. Humidity") +
  xlab("Humidity (%)") +
  ylab("Temperature (°C)")

# Task 5: Plot Temperature vs. Wind Speed
ggplot(weather_data, aes(x = Wind_Speed, y = Temperature)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  ggtitle("Temperature vs. Wind Speed") +
  xlab("Wind Speed (km/h)") +
  ylab("Temperature (°C)")
