# Install required packages if not already installed
if (!require("plotly")) install.packages("plotly")

# Load the required packages
library(plotly)

# Educational data
data <- data.frame(
  Student = c("A", "B", "C", "D", "E"),
  MathScore = c(85, 72, 90, 78, 88),
  ReadingScore = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# 1. Reading scores variation
print(data)

# 2. 3D Scatter Plot
scatter_plot <- plot_ly(data, x = ~MathScore, y = ~ReadingScore, z = ~Attendance, 
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis'))

# 3. Check for correlation
cor_matrix <- cor(data[, c("MathScore", "ReadingScore", "Attendance")])
print(cor_matrix)

# 4. 3D Surface Plot
surface_plot <- plot_ly(data, x = ~MathScore, y = ~Attendance, z = ~ReadingScore, 
                        type = 'mesh3d')

# Display plots
scatter_plot <- scatter_plot %>% layout(scene = list(
  xaxis = list(title = 'Math Score'),
  yaxis = list(title = 'Reading Score'),
  zaxis = list(title = 'Attendance (%)')
))

surface_plot <- surface_plot %>% layout(scene = list(
  xaxis = list(title = 'Math Score'),
  yaxis = list(title = 'Attendance (%)'),
  zaxis = list(title = 'Reading Score')
))

print(scatter_plot)
print(surface_plot)

# 5. Compare 3D plots
# Generating individual scatter plots
scatter_plot_math <- plot_ly(data, x = ~MathScore, y = ~ReadingScore, 
                             type = 'scatter', mode = 'markers', 
                             marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis'))

scatter_plot_attendance <- plot_ly(data, x = ~Attendance, y = ~ReadingScore, 
                                   type = 'scatter', mode = 'markers', 
                                   marker = list(size = 5, color = ~ReadingScore, colorscale = 'Viridis'))

# Layout for comparison plots
scatter_plot_math <- scatter_plot_math %>% layout(xaxis = list(title = 'Math Score'), 
                                                  yaxis = list(title = 'Reading Score'))
scatter_plot_attendance <- scatter_plot_attendance %>% layout(xaxis = list(title = 'Attendance (%)'), 
                                                              yaxis = list(title = 'Reading Score'))

print(scatter_plot_math)
print(scatter_plot_attendance)
