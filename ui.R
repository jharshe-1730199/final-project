# The User Interface for our IMDB Dataset

library(shiny)
library(ggplot2)
movies <- read.csv("data/movies.csv")

p <- ggplot(movies, aes(x=average_age, y=averageRating)) + geom_point()
shinyUI(
  fluidPage(
    titlePanel("IMDB Data"),
    
    sidebarLayout(
      position = "right",
      
      sidebarPanel(
        "Sidebar panel"
      ),
      
      mainPanel(
        p("This app is made by movie lovers for movie lovers! Here you can learn about.....YADAYADAYDADA"),
        plotOutput('genreOutput')
      )
    )
  )
)