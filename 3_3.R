# Required libraries
library(scatterplot3d)
library(plot3D)
library(akima)  # for interpolation

# Given data
products <- c("A", "B", "C", "D", "E")
prices <- c(50, 70, 60, 45, 55)            # in $
ratings <- c(4.2, 3.8, 4.0, 4.5, 3.9)       # out of 5
age_groups <- factor(c("25-35", "35-45", "18-25", "45-55", "25-35"))

# Task 1: Product ratings variation with price and age group
scatterplot3d(prices, age_groups, ratings, color="blue",
              xlab="Price ($)", ylab="Age Group", zlab="Rating (out of 5)",
              main="Product Ratings Variation with Price and Age Group")

# Task 2: 3D scatter plot of price, rating, and age group
scatter3D(prices, as.numeric(age_groups), ratings, colvar=ratings,
          col=rainbow(length(products)), pch=19, cex=2,
          xlab="Price ($)", ylab="Age Group", zlab="Rating (out of 5)",
          main="Relationship between Price, Rating, and Age Group")

# Task 3: Correlation between age group, product price, and ratings
anova_lm <- aov(ratings ~ prices + age_groups)
summary(anova_lm)

# Task 4: 3D surface plot of ratings with price and age group
x <- seq(min(prices), max(prices), length.out=20)
y <- unique(age_groups)
xyz <- expand.grid(x=x, y=y)
ratings_interp <- c(4.2, 3.8, 4.0, 4.5, 3.9)  # Use actual ratings data for interpolation
xyz$z <- interp(x, as.numeric(factor(y)), ratings_interp, duplicate="mean")$z

scatter3D(xyz$x, as.numeric(factor(xyz$y)), xyz$z, colvar=xyz$z,
          col=rainbow(100), pch=19, cex=2,
          xlab="Price ($)", ylab="Age Group", zlab="Rating (out of 5)",
          main="Product Ratings Surface Plot")

# Task 5: Compare 3D plots of ratings against price and age group separately
par(mfrow=c(1, 2))

# Plot 1: Ratings vs Price
scatter3D(prices, rep(1, length(products)), ratings, colvar=ratings,
          col=rainbow(length(products)), pch=19, cex=2,
          xlab="Price ($)", ylab="Rating (out of 5)", zlab="",
          main="Ratings vs Price")

# Plot 2: Ratings vs Age Group
scatter3D(rep(1, length(products)), as.numeric(age_groups), ratings, colvar=ratings,
          col=rainbow(length(products)), pch=19, cex=2,
          xlab="", ylab="Age Group", zlab="Rating (out of 5)",
          main="Ratings vs Age Group")
