# Load necessary libraries
library(ggplot2)
library(dplyr)
library(ggmosaic)

# Create a data frame with the given data
data_cat <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Gender = c("Male", "Female", "Male", "Female", "Male"),
  Education = c("Graduate", "Undergrad", "High School", "Graduate", "Undergrad"),
  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer", "Artist")
)

# Bar plot showing the count of each Gender
ggplot(data_cat, aes(x = Gender)) +
  geom_bar(fill = "skyblue", color = "black") +
  ggtitle("Bar Plot of Gender Counts") +
  xlab("Gender") +
  ylab("Count")

# Pie chart representing the distribution of Education levels
education_counts <- data_cat %>% 
  count(Education)

ggplot(education_counts, aes(x = "", y = n, fill = Education)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  ggtitle("Pie Chart of Education Levels") +
  xlab("") +
  ylab("") +
  theme_void()

# Stacked bar plot showing the count of each Occupation by Gender
ggplot(data_cat, aes(x = Occupation, fill = Gender)) +
  geom_bar(position = "stack") +
  ggtitle("Stacked Bar Plot of Occupation by Gender") +
  xlab("Occupation") +
  ylab("Count")

# Mosaic plot to visualize the association between Education and Occupation
ggplot(data_cat) +
  geom_mosaic(aes(x = product(Education), fill = Occupation)) +
  ggtitle("Mosaic Plot of Education and Occupation") +
  xlab("Education") +
  ylab("Occupation")

# Grouped bar plot showing counts of Gender across different Education levels
ggplot(data_cat, aes(x = Education, fill = Gender)) +
  geom_bar(position = "dodge") +
  ggtitle("Grouped Bar Plot of Gender by Education") +
  xlab("Education") +
  ylab("Count")
