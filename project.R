# Install required packages if not already installed
if (!require("plotly")) install.packages("plotly")
if (!require("ggplot2")) install.packages("ggplot2")

# Load necessary packages
library(plotly)
library(ggplot2)

# 1. Load Data
# Simulated data (replace with your actual dataset)
data <- data.frame(
  CustomerID = 1:30,
  Age = c(35, 28, 42, 25, 38, 45, 23, 34, 40, 30, 29, 50, 32, 47, 36, 27, 41, 33, 39, 26, 48, 31, 44, 37, 43, 24, 46, 49, 21, 22),
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female"),
  PurchaseAmount = c(100, 80, 120, 90, 110, 150, 60, 130, 95, 85, 70, 160, 75, 140, 115, 65, 125, 135, 105, 95, 145, 90, 120, 125, 130, 85, 155, 140, 50, 60),
  MembershipLevel = c("Gold", "Silver", "Bronze", "Bronze", "Silver", "Gold", "Silver", "Gold", "Bronze", "Silver", "Bronze", "Gold", "Silver", "Bronze", "Gold", "Silver", "Bronze", "Gold", "Silver", "Bronze", "Gold", "Silver", "Bronze", "Gold", "Silver", "Bronze", "Gold", "Silver", "Bronze", "Silver")
)

# 2. Data Cleaning
# Check for missing values
sum(is.na(data))

# 3. Data Processing
# No specific processing needed for this example

# 4. EDA Analysis
# Summary statistics
summary(data)

# Distribution of categorical variables
table(data$Gender)
table(data$MembershipLevel)

# Relationships between variables
cor(data[, c("Age", "PurchaseAmount")])

# Grouped summaries
aggregate(PurchaseAmount ~ MembershipLevel, data = data, FUN = mean)

# 5. Visualization - 15 plots

# Scatter plots
scatter_age_purchase <- ggplot(data, aes(x = Age, y = PurchaseAmount)) +
  geom_point() +
  labs(title = "Age vs Purchase Amount")

scatter_membership_purchase <- ggplot(data, aes(x = MembershipLevel, y = PurchaseAmount)) +
  geom_point(position = position_jitter(w = 0.1, h = 0)) +
  labs(title = "Purchase Amount by Membership Level")

# Bar plots
bar_gender_purchase <- ggplot(data, aes(x = Gender, y = PurchaseAmount, fill = Gender)) +
  geom_bar(stat = "identity") +
  labs(title = "Purchase Amount by Gender")

bar_membership_count <- ggplot(data, aes(x = MembershipLevel, fill = MembershipLevel)) +
  geom_bar() +
  labs(title = "Count of Customers by Membership Level")

# Box plots
boxplot_age_gender <- ggplot(data, aes(x = Gender, y = Age, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Age Distribution by Gender")

boxplot_purchase_membership <- ggplot(data, aes(x = MembershipLevel, y = PurchaseAmount, fill = MembershipLevel)) +
  geom_boxplot() +
  labs(title = "Purchase Amount Distribution by Membership Level")

# Violin plots
violin_age_gender <- ggplot(data, aes(x = Gender, y = Age, fill = Gender)) +
  geom_violin() +
  labs(title = "Age Distribution by Gender")

violin_purchase_membership <- ggplot(data, aes(x = MembershipLevel, y = PurchaseAmount, fill = MembershipLevel)) +
  geom_violin() +
  labs(title = "Purchase Amount Distribution by Membership Level")

# 3D Scatter plot: Age vs PurchaseAmount vs MembershipLevel
scatter3d <- plot_ly(data, x = ~Age, y = ~PurchaseAmount, z = ~MembershipLevel, 
                     color = ~MembershipLevel, colors = c("#440154", "#29788E", "#22A784"),
                     marker = list(size = 5), type = 'scatter3d', mode = 'markers')

# 3D Surface plot: Age vs PurchaseAmount vs MembershipLevel
surface3d <- plot_ly(data, x = ~Age, y = ~MembershipLevel, z = ~PurchaseAmount, 
                     colorscale = 'Viridis', type = 'surface')

# Display all plots
subplot(
  scatter_age_purchase, scatter_membership_purchase, bar_gender_purchase,
  bar_membership_count, boxplot_age_gender, boxplot_purchase_membership,
  violin_age_gender, violin_purchase_membership, scatter3d, surface3d,
  nrows = 5
)
