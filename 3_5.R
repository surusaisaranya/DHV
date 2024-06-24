# Required libraries
library(scatterplot3d)
library(plot3D)

# Given data
students <- c("A", "B", "C", "D", "E")
math_scores <- c(85, 72, 90, 78, 88)
science_scores <- c(78, 85, 80, 75, 82)
attendance <- c(95, 92, 98, 85, 93)

# Task 1: Science scores variation with math scores and attendance
scatterplot3d(math_scores, attendance, science_scores, color="blue",
              xlab="Math Score", ylab="Attendance (%)", zlab="Science Score",
              main="Science Scores vs Math Score and Attendance")

# Task 2: 3D scatter plot of math score, science score, and attendance
scatter3D(math_scores, attendance, science_scores, colvar=science_scores,
          col=rainbow(length(students)), pch=19, cex=2,
          xlab="Math Score", ylab="Attendance (%)", zlab="Science Score",
          main="Relationship between Math Score, Science Score, and Attendance")

# Task 3: Correlation between attendance, math scores, and science scores
cor(math_scores, science_scores)  # Correlation between Math Score and Science Score
cor(attendance, science_scores)   # Correlation between Attendance and Science Score
cor(math_scores, attendance)      # Correlation between Math Score and Attendance

# Task 4: 3D surface plot of science scores with math scores and attendance
x <- seq(min(math_scores), max(math_scores), length.out=20)
y <- seq(min(attendance), max(attendance), length.out=20)
xyz <- expand.grid(x=x, y=y)
xyz$z <- interp(xyz$x, xyz$y, science_scores, duplicate="mean")$z

scatter3D(xyz$x, xyz$y, xyz$z, colvar=xyz$z,
          col=rainbow(100), pch=19, cex=2,
          xlab="Math Score", ylab="Attendance (%)", zlab="Science Score",
          main="Science Score Surface Plot")

# Task 5: Compare 3D plots of science scores against math scores and attendance separately
par(mfrow=c(1, 2))

# Plot 1: Science Scores vs Math Scores
scatter3D(math_scores, rep(0, length(students)), science_scores, colvar=science_scores,
          col=rainbow(length(students)), pch=19, cex=2,
          xlab="Math Score", ylab="Science Score", zlab="",
          main="Science Scores vs Math Scores")

# Plot 2: Science Scores vs Attendance
scatter3D(attendance, rep(0, length(students)), science_scores, colvar=science_scores,
          col=rainbow(length(students)), pch=19, cex=2,
          xlab="Attendance (%)", ylab="Science Score", zlab="",
          main="Science Scores vs Attendance")
