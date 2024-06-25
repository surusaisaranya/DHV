# Install required packages if not already installed
if (!require("plotly")) install.packages("plotly")

# Load the required packages
library(plotly)

# Healthcare data
data <- data.frame(
  Patient = c("A", "B", "C", "D", "E"),
  Age = c(45, 55, 60, 50, 65),
  BloodPressure = c("120/80", "130/85", "140/90", "125/82", "150/95"),
  CholesterolLevel = c(180, 200, 220, 190, 240)
)

# 1. Cholesterol level variation
print(data)

# Extract systolic and diastolic pressure from BloodPressure column
# Assuming BloodPressure format is consistent (systolic/diastolic)
data$Systolic <- as.numeric(sapply(strsplit(data$BloodPressure, "/"), `[`, 1))
data$Diastolic <- as.numeric(sapply(strsplit(data$BloodPressure, "/"), `[`, 2))

# 2. 3D Scatter Plot
scatter_plot <- plot_ly(data, x = ~Age, y = ~Systolic, z = ~CholesterolLevel, 
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis'))

# 3. Check for correlation
cor_matrix <- cor(data[, c("Age", "Systolic", "CholesterolLevel")])
print(cor_matrix)

# 4. 3D Surface Plot
surface_plot <- plot_ly(data, x = ~Age, y = ~Systolic, z = ~CholesterolLevel, 
                        type = 'mesh3d')

# Display plots
scatter_plot <- scatter_plot %>% layout(scene = list(
  xaxis = list(title = 'Age'),
  yaxis = list(title = 'Systolic Blood Pressure (mmHg)'),
  zaxis = list(title = 'Cholesterol Level (mg/dL)')
))

surface_plot <- surface_plot %>% layout(scene = list(
  xaxis = list(title = 'Age'),
  yaxis = list(title = 'Systolic Blood Pressure (mmHg)'),
  zaxis = list(title = 'Cholesterol Level (mg/dL)')
))

print(scatter_plot)
print(surface_plot)

# 5. Compare 3D plots
# Generating individual scatter plots
scatter_plot_age <- plot_ly(data, x = ~Age, y = ~CholesterolLevel, 
                            type = 'scatter', mode = 'markers', 
                            marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis'))

scatter_plot_blood_pressure <- plot_ly(data, x = ~Systolic, y = ~CholesterolLevel, 
                                       type = 'scatter', mode = 'markers', 
                                       marker = list(size = 5, color = ~CholesterolLevel, colorscale = 'Viridis'))

# Layout for comparison plots
scatter_plot_age <- scatter_plot_age %>% layout(xaxis = list(title = 'Age'), 
                                                yaxis = list(title = 'Cholesterol Level (mg/dL)'))
scatter_plot_blood_pressure <- scatter_plot_blood_pressure %>% layout(xaxis = list(title = 'Systolic Blood Pressure (mmHg)'), 
                                                                      yaxis = list(title = 'Cholesterol Level (mg/dL)'))

print(scatter_plot_age)
print(scatter_plot_blood_pressure)
