# Install necessary packages
install.packages("wordcloud")
install.packages("RColorBrewer")

# Load the libraries
library(wordcloud)
library(RColorBrewer)
# Sample data
words <- c("Apple", "Orange", "Banana", "Grape", "Cherry")
frequencies <- c(15, 10, 8, 12, 5)

# Create a data frame
word_data <- data.frame(words, frequencies)

# Set up color palette
colors <- brewer.pal(8, "Dark2")

# Create the word cloud
wordcloud(words = word_data$words, freq = word_data$frequencies, 
          min.freq = 1, scale = c(3, 0.5), colors = colors, 
          random.order = FALSE, rot.per = 0.35, 
          use.r.layout = FALSE)
