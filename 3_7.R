# Install required packages if not already installed
if (!require("plotly")) install.packages("plotly")

# Load the required packages
library(plotly)

# Product performance data
data <- data.frame(
  Product = c("A", "B", "C", "D", "E"),
  Price = c(50, 70, 60, 45, 55),
  UnitsSold = c(1000, 800, 1200, 1500, 900),
  CustomerRatings = c(4.2, 4.0, 4.5, 3.8, 4.3)
)

# 1. Customer ratings variation
print(data)

# 2. 3D Scatter Plot
scatter_plot <- plot_ly(data, x = ~UnitsSold, y = ~CustomerRatings, z = ~Price, 
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis'))

# 3. Check for correlation
cor_matrix <- cor(data[, c("UnitsSold", "Price", "CustomerRatings")])
print(cor_matrix)

# 4. 3D Surface Plot
surface_plot <- plot_ly(data, x = ~UnitsSold, y = ~Price, z = ~CustomerRatings, 
                        type = 'mesh3d')

# Display plots
scatter_plot <- scatter_plot %>% layout(scene = list(
  xaxis = list(title = 'Units Sold'),
  yaxis = list(title = 'Customer Ratings (out of 5)'),
  zaxis = list(title = 'Price ($)')
))

surface_plot <- surface_plot %>% layout(scene = list(
  xaxis = list(title = 'Units Sold'),
  yaxis = list(title = 'Price ($)'),
  zaxis = list(title = 'Customer Ratings (out of 5)')
))

print(scatter_plot)
print(surface_plot)

# 5. Compare 3D plots
# Generating individual scatter plots
scatter_plot_units_sold <- plot_ly(data, x = ~UnitsSold, y = ~CustomerRatings, 
                                   type = 'scatter', mode = 'markers', 
                                   marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis'))

scatter_plot_price <- plot_ly(data, x = ~Price, y = ~CustomerRatings, 
                              type = 'scatter', mode = 'markers', 
                              marker = list(size = 5, color = ~CustomerRatings, colorscale = 'Viridis'))

# Layout for comparison plots
scatter_plot_units_sold <- scatter_plot_units_sold %>% layout(xaxis = list(title = 'Units Sold'), 
                                                              yaxis = list(title = 'Customer Ratings (out of 5)'))
scatter_plot_price <- scatter_plot_price %>% layout(xaxis = list(title = 'Price ($)'), 
                                                    yaxis = list(title = 'Customer Ratings (out of 5)'))

print(scatter_plot_units_sold)
print(scatter_plot_price)
