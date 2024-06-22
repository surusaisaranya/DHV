# Load necessary libraries
library(ggplot2)
# Create a data frame with the given data
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Age = c(25, 30, 28, 35, 40),
  Height = c(175, 180, 170, 165, 185),
  Weight = c(70, 80, 65, 75, 90)
)
# Scatter plot between Age and Weight
ggplot(data, aes(x = Age, y = Weight)) +
  geom_point() +
  ggtitle("Scatter Plot of Age vs Weight") +
  xlab("Age") +
  ylab("Weight")
# Histogram of Height
ggplot(data, aes(x = Height)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black", alpha = 0.7) +
  ggtitle("Histogram of Height") +
  xlab("Height") +
  ylab("Frequency")
# Line chart showing changes in Weight over IDs
ggplot(data, aes(x = ID, y = Weight)) +
  geom_line() +
  geom_point() +
  ggtitle("Line Chart of Weight over IDs") +
  xlab("ID") +
  ylab("Weight")
# Box plot of Age
ggplot(data, aes(y = Age)) +
  geom_boxplot(fill = "orange", color = "black") +
  ggtitle("Box Plot of Age") +
  ylab("Age")
# Density plot of Height
ggplot(data, aes(x = Height)) +
  geom_density(fill = "green", alpha = 0.7) +
  ggtitle("Density Plot of Height") +
  xlab("Height") +
  ylab("Density")
