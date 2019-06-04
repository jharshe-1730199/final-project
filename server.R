# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
library(dplyr)
library(randomcoloR)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    
    output$movieYear <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(data = movies %>% 
                         filter(input$year == year))
    })
    output$movieRuntime1 <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#4b2e83", data = movies %>% 
                         filter(input$runtime1 == runtime)) +
        xlim(1, 10)
    })
    output$movieRuntime2 <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#4b2e83", data = movies %>% 
                         filter(input$runtime2 == runtime)) +
        xlim(1, 10)
    })
    output$movieRuntime3 <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#b7a57a", data = movies %>% 
                         filter(input$runtime3 == runtime)) +
        xlim(1, 10)
    })
    output$movieAge <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram( data = movies %>% 
                         filter(input$age == average_age))
    })
  
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = year, y = averageRating, size = numVotes)) +
        geom_point(data = movies %>%
<<<<<<< HEAD
                          filter(gsub(" ", "", toString(input$Genre)) == genres)) +
        xlim(1911, 2019) +
        ylim(1, 10)
=======
                             filter(toString(input$Genre) == genres)) +
         xlim(1911, 2019) +
         ylim(1, 10)
>>>>>>> 000b0619b2d6e733641f600564dabc4d3ebfa2a5
    )
  }
)
