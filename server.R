# The Server output for our IMDB Dataset
library(shiny)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    output$genreRate <- renderPlot 
  
  }
)