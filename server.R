# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
library(dplyr)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = year, y = averageRating)) +
        geom_point(data = movies %>%
                          filter(toString(input$Genre) == genres)) +
        xlim(1911, 2019) +
        ylim(1, 10)
    )
    
  }
)