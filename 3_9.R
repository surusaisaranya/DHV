# Install required packages if not already installed
if (!require("plotly")) install.packages("plotly")

# Load the required packages
library(plotly)

# Productivity data
data <- data.frame(
  Employee = c("A", "B", "C", "D", "E"),
  HoursWorked = c(40, 35, 45, 38, 42),
  TasksCompleted = c(10, 8, 12, 9, 11),
  Efficiency = c(80, 75, 85, 78, 82)
)

# 1. Efficiency variation
print(data)

# 2. 3D Scatter Plot
scatter_plot <- plot_ly(data, x = ~TasksCompleted, y = ~Efficiency, z = ~HoursWorked, 
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis'))

# 3. Check for correlation
cor_matrix <- cor(data[, c("TasksCompleted", "HoursWorked", "Efficiency")])
print(cor_matrix)

# 4. 3D Surface Plot
surface_plot <- plot_ly(data, x = ~TasksCompleted, y = ~HoursWorked, z = ~Efficiency, 
                        type = 'mesh3d')

# Display plots
scatter_plot <- scatter_plot %>% layout(scene = list(
  xaxis = list(title = 'Tasks Completed'),
  yaxis = list(title = 'Efficiency (%)'),
  zaxis = list(title = 'Hours Worked')
))

surface_plot <- surface_plot %>% layout(scene = list(
  xaxis = list(title = 'Tasks Completed'),
  yaxis = list(title = 'Hours Worked'),
  zaxis = list(title = 'Efficiency (%)')
))

print(scatter_plot)
print(surface_plot)

# 5. Compare 3D plots
# Generating individual scatter plots
scatter_plot_tasks <- plot_ly(data, x = ~TasksCompleted, y = ~Efficiency, 
                              type = 'scatter', mode = 'markers', 
                              marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis'))

scatter_plot_hours <- plot_ly(data, x = ~HoursWorked, y = ~Efficiency, 
                              type = 'scatter', mode = 'markers', 
                              marker = list(size = 5, color = ~Efficiency, colorscale = 'Viridis'))

# Layout for comparison plots
scatter_plot_tasks <- scatter_plot_tasks %>% layout(xaxis = list(title = 'Tasks Completed'), 
                                                    yaxis = list(title = 'Efficiency (%)'))
scatter_plot_hours <- scatter_plot_hours %>% layout(xaxis = list(title = 'Hours Worked'), 
                                                    yaxis = list(title = 'Efficiency (%)'))

print(scatter_plot_tasks)
print(scatter_plot_hours)
