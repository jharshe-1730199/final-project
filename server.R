# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = movies$year, y = movies$averageRating)) +
        geom_point()
        
      
    )
  
  }
)