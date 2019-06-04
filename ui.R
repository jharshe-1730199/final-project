# The User Interface for our IMDB Dataset

library(shiny)
movies <- read.csv("data/movies.csv")

shinyUI(
  fluidPage(
    titlePanel("IMDB Data"),
    
    sidebarLayout(
      position = "right",
      
      sidebarPanel(
        "Sidebar panel"
      ),
      
      mainPanel(
        p("This app is made by movie lovers for movie lovers! Here you can learn about.....YADAYADAYDADA")
      )
    )
  )
)