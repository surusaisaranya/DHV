# Install required packages if not already installed
if (!require("plotly")) install.packages("plotly")

# Load the required packages
library(plotly)

# Sales data by region
data <- data.frame(
  Region = c("North", "South", "East", "West", "Central"),
  Sales = c(250, 300, 280, 270, 260),
  AdvertisingCost = c(1000, 1200, 1100, 1050, 1150),
  CustomerSatisfaction = c(8, 7, 9, 7.5, 8.5)
)

# 1. Customer satisfaction variation
print(data)

# 2. 3D Scatter Plot
scatter_plot <- plot_ly(data, x = ~AdvertisingCost, y = ~Sales, z = ~CustomerSatisfaction, 
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Viridis'))

# 3. Check for correlation
cor_matrix <- cor(data[, c("Sales", "AdvertisingCost", "CustomerSatisfaction")])
print(cor_matrix)

# 4. 3D Surface Plot
surface_plot <- plot_ly(data, x = ~AdvertisingCost, y = ~Sales, z = ~CustomerSatisfaction, 
                        type = 'mesh3d')

# Display plots
scatter_plot <- scatter_plot %>% layout(scene = list(
  xaxis = list(title = 'Advertising Cost ($)'),
  yaxis = list(title = 'Sales ($ thousands)'),
  zaxis = list(title = 'Customer Satisfaction (out of 10)')
))

surface_plot <- surface_plot %>% layout(scene = list(
  xaxis = list(title = 'Advertising Cost ($)'),
  yaxis = list(title = 'Sales ($ thousands)'),
  zaxis = list(title = 'Customer Satisfaction (out of 10)')
))

print(scatter_plot)
print(surface_plot)

# 5. Compare 3D plots
# Generating individual scatter plots
scatter_plot_sales <- plot_ly(data, x = ~Sales, y = ~CustomerSatisfaction, 
                              type = 'scatter', mode = 'markers', 
                              marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Viridis'))

scatter_plot_advertising <- plot_ly(data, x = ~AdvertisingCost, y = ~CustomerSatisfaction, 
                                    type = 'scatter', mode = 'markers', 
                                    marker = list(size = 5, color = ~CustomerSatisfaction, colorscale = 'Viridis'))

# Layout for comparison plots
scatter_plot_sales <- scatter_plot_sales %>% layout(xaxis = list(title = 'Sales ($ thousands)'), 
                                                    yaxis = list(title = 'Customer Satisfaction (out of 10)'))
scatter_plot_advertising <- scatter_plot_advertising %>% layout(xaxis = list(title = 'Advertising Cost ($)'), 
                                                                yaxis = list(title = 'Customer Satisfaction (out of 10)'))

print(scatter_plot_sales)
print(scatter_plot_advertising)
