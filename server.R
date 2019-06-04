# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
library(dplyr)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    
    output$movieYear <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(data = movies %>% 
                         filter(input$year == year))
    })
    output$movieRuntime <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(data = movies %>% 
                         filter(input$runtime == runtime))
    })
    output$movieAge <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(data = movies %>% 
                         filter(input$age == average_age))
    })
  
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = year, y = averageRating)) +
        geom_point(data = movies %>%
                          filter(toString(input$Genre) == genres)) +
        xlim(1911, 2019) +
        ylim(1, 10)
    )
    
  }
)
