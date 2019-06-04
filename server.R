# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
movies <- read.csv("data/movies.csv", stringsAsFactors = FALSE)

shinyServer(
  function(input, output) {
    
    output$yearRate <- renderPlot({
      ggplot(movies, aes(x=averageRating, fill=genres, color=genres)) +
      geom_histogram(position="identity")
    })
  
  }
)