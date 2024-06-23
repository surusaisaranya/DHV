library(ggplot2)
library(ggmosaic)

data <- data.frame(
  Year = factor(c(2019, 2020, 2022, 2023, 2024)),
  Job_Sector = c('IT', 'Government Job', 'Customer care', 'Bank', 'Games'),
  Job_Seekers_Rate = c(95, 97, 98, 82, 74),
  Selection_Rate = c(25, 12, 45, 20, 35)
)

pie_plot <- ggplot(data, aes(x = "", y = Job_Seekers_Rate, fill = Job_Sector)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste0(Job_Seekers_Rate, "%")), position = position_stack(vjust = 0.5), color = "white") +
  labs(title = "Pie Plot of Job Seekers Rate by Job Sector", x = NULL, y = "Job Seekers Rate", fill = "Job Sector") +
  theme_minimal()

print(pie_plot)

mosaic_plot <- ggplot(data) +
  geom_mosaic(aes(weight = Job_Seekers_Rate, x = product(Year), fill = Job_Sector)) +
  labs(title = "Mosaic Plot of Job Seekers Rate by Year and Job Sector", x = "Year", y = "Job Seekers Rate", fill = "Job Sector") +
  theme_minimal()

print(mosaic_plot)

ggplot(data, aes(x = Jobseekerrate, y = Selectionrate, label = JobSector)) +
  geom_point(size = 4, color = "blue") +
  geom_text(vjust = -1) +
  labs(title = "Funnel Plot for Job Selections",
       x = "Job Seekers Rate (%)",
       y = "Selection Rate (%)") +
  theme_minimal()


print(funnel_plot)
