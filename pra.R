library (ggplot2)

data <- data.frame (
  ID = c(1,2,3,4,5),
  Score = c(85,92,78,88,90)
)

#violin_plot 
ggplot (data , aes (x = factor (ID ), y = Score)) +
  geom_violin (fill = "purple" , alpha=0.7) +
  labs (title  = " violin plot" , x = "ID" , y = "Score")+
  theme_minimal()


#box_plot
ggplot (data , aes (x = ID, y = Score)) +
  geom_boxplot(fill = "purple" , alpha=0.7) +
  labs (title  = " violin plot" , x = "ID" , y = "Score")+
  theme_minimal()