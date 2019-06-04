# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
library(dplyr)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = movies$year, y = movies$averageRating)) +
        geom_point()
    )
  
    output$distPlot <- renderPlot(
      x    <- movies$average_age = integer(average_age),
      bins <- seq(min(x), max(x), length.out = input$bins + 1),
      
      hist(x, breaks = bins, col = "#75AADB", border = "white",
           xlab = "Average rating",
           main = "Histogram of average movie ratings based on average actor age"
      )
    )  
      ggplot(movies, aes(x = year, y = averageRating)) +
        geom_point(data = movies %>%
                          filter(toString(input$Genre) == genres)) +
        xlim(1911, 2019) +
        ylim(1, 10)
  }
)