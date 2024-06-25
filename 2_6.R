library (wordcloud)
library (RColorBrewer)
library (ggplot2)
data <- data.frame (
  Word = c("Apple" , "Orange" ,"Banana" ,"Grape" ,"Cherry") ,
  Frequency = c(15,10,8,12,5)
)

colors <- brewer.pal(8,"Dark2")
#word_cloud
wordcloud(words = data$Word , freq = data$Frequency , min.freq = 1 , scale = c(3, 0.5), colors = colors,random.order = FALSE ,rot.per = 0.35,user.r.layout = FALSE)


#bar_plot
ggplot (data ,aes ( x = Word , y = Frequency)) +
  geom_bar (stat = "identity") +
  labs (title = "Bar_ plot" , x = "Word" , y="Frequency") +
  theme_minimal()

#stacked_bar
ggplot (data , aes(x = Word , y = Frequency , fill = Word)) +
  geom_bar(stat = "identity") +
  ggtitle ("stacked bar plot") +
  xlab ("word") +
  ylab ("Frequency") +
  theme_minimal()


#pie_charts
ggplot (data , (aes (x = "" ,y = Frequency ,fill = Word)) ) +
  geom_bar (stat = 'identity' , width = 1) +
  coord_polar (theta = 'y') +
  geom_text (aes (label = paste0(Word),color = "white"))  +
  theme_minimal()

#histogram

ggplot (data , aes(x = Word , y = Frequency)) +
  geom_bar (stat = "identity" , binwidth = 2 , fill= "yellow" , color = "red") +
  labs (title = "histogram " , x = "Word" , y = "Frequency") +
  theme_minimal()
