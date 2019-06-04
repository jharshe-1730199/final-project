# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
movies <- read.csv("data/movies.csv")

shinyServer(
  function(input, output) {
    
    sortGenres <- reactive({
      mov <- movies %>% filter(grepl(movies$genres, input$Genre))
      mov
    })
    
    output$genreOutput <- renderPlot({
      # ggplot(movies, aes(year, averageRating)) + 
      # geom_bar(data = movies, aes(fill=type), color="coral1")
      p <- ggplot(sortGenres(), aes(year, averageRating))
      p + geom_bar(stat = "identity", aes(fill = year))
    })
    
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = movies$year, y = movies$averageRating)) +
        geom_point()
        
      
    )
  
  }
)