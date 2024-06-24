1
# Install and load necessary packages
install.packages("scatterplot3d")
library(scatterplot3d)

# Financial Market Data
dates <- c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')
stock_price <- c(100, 102, 98, 105, 108)
volume_traded <- c(2.5, 3.0, 2.2, 2.8, 3.5)
market_cap <- c(500, 510, 490, 525, 540)

# Numerical indices for dates
dates_indices <- 1:length(dates)

# Plotting Stock Price vs Volume Traded
scatterplot3d(stock_price, dates_indices, volume_traded, color = "blue", pch = 16,
              xlab = "Stock Price ($)", ylab = "Date Index", zlab = "Volume Traded (millions)",
              main = "Stock Price vs Volume Traded")
legend("topright", legend = dates, pch = 16, col = "blue")

# Plotting Stock Price vs Market Cap
scatterplot3d(stock_price, dates_indices, market_cap, color = "red", pch = 16,
              xlab = "Stock Price ($)", ylab = "Date Index", zlab = "Market Cap ($)",
              main = "Stock Price vs Market Cap")
legend("topright", legend = dates, pch = 16, col = "red")
2
# Install and load scatterplot3d package if not already installed
install.packages("scatterplot3d")
library(scatterplot3d)

# Financial Market Data
dates <- c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')
stock_price <- c(100, 102, 98, 105, 108)
volume_traded <- c(2.5, 3.0, 2.2, 2.8, 3.5)
market_cap <- c(500, 510, 490, 525, 540)

# Creating a 3D scatter plot
scatterplot3d(volume_traded, market_cap, stock_price, color = "blue", pch = 16,
              xlab = "Volume Traded (millions)", ylab = "Market Cap ($)", zlab = "Stock Price ($)",
              main = "3D Scatter Plot: Volume Traded, Market Cap, and Stock Price")

# Adding a legend
legend("topright", legend = dates, pch = 16, col = "blue")
3
install.packages("plot3D")
library(plot3D)
# Load the data into a data frame (replace with your actual data loading code)
financial_data <- data.frame(
  Stock_Price = c(100, 102, 98, 105, 108),
  Volume_Traded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  Market_Cap = c(500, 510, 490, 525, 540)
)

# Create 3D scatter plot
scatter3D(x = financial_data$Stock_Price,
          y = financial_data$Volume_Traded,
          z = financial_data$Market_Cap,
          col = "blue",
          pch = 16,      # Use solid circles for points
          main = "Financial Market Data",
          xlab = "Stock Price ($)",
          ylab = "Volume Traded (millions)",
          zlab = "Market Cap ($)")
4
# Sample data
data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Stock_Price = c(100, 102, 98, 105, 108),
  Volume_Traded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  Market_Cap = c(500, 510, 490, 525, 540)
)
library(rgl)
# Convert data to numeric for plotting
data$Stock_Price <- as.numeric(data$Stock_Price)
data$Volume_Traded <- as.numeric(data$Volume_Traded)
data$Market_Cap <- as.numeric(data$Market_Cap)

# Create 3D surface plot
plot3d(data$Stock_Price, data$Volume_Traded, data$Market_Cap,
       xlab = "Stock Price ($)",
       ylab = "Volume Traded (millions)",
       zlab = "Market Cap ($)",
       type = "surface",
       col = "blue",  # Color of the surface
       theta = 30,    # Angle of view
       phi = 30,      # Angle of view
       main = "Market Capitalization vs Stock Price and Volume Traded"
)
# Install and load plot3D package if not already installed
# install.packages("plot3D")
library(plot3D)

# Create static 3D scatter plot
scatter3D(data$Stock_Price, data$Volume_Traded, data$Market_Cap,
          xlab = "Stock Price ($)",
          ylab = "Volume Traded (millions)",
          zlab = "Market Cap ($)",
          color = "blue",  # Point color
          pch = 16,        # Point shape
          main = "Market Capitalization vs Stock Price and Volume Traded"
)
5
# Convert Date to numeric (days since January 1, 1970)
df$Date_numeric <- as.numeric(df$Date)
scatter3D(x = df$Volume_Traded, y = df$Stock_Price, z = df$Date_numeric,
          xlab = "Volume Traded (millions)", ylab = "Stock Price ($)", zlab = "Date (numeric)",
          color = "blue", pch = 16)
scatter3D(x = df$Market_Cap, y = df$Stock_Price, z = df$Date_numeric,
          xlab = "Market Cap ($)", ylab = "Stock Price ($)", zlab = "Date (numeric)",
          color = "red", pch = 16)
