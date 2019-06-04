# The User Interface for our IMDB Dataset
# 1. User chooses the year of interest and sees a barplot of 
#   genres on x-axis and average rating on y-axis

# 2. User chooses the genre of interest and sees a scatterplot
#    of a year vs average Rating
# grepl(genres, "string of single genre")
# GET KEAGAN TO GO THROUGH GENRES ON THE CSV TO MAKE SURE I HAVE ALL THE OPTIONS AVAILABLE

library(shiny)
movies <- read.csv("data/movies.csv")

shinyUI(
  fluidPage(
    titlePanel("IMDB Data"),
    
    sidebarLayout(
      position = "right",
      
      # All the genres that a user can choose
      sidebarPanel(
        selectInput("Genre", "Choose a genre", choices = c("Action","Adventure","Sci-Fi","Drama",
                                                         "Horror","Thriller","Mystery","Crime",
                                                         "Biography","Comedy","Animation","Fantasy",
                                                         "Action","War","Romance","Family","History",
                                                         "Musical"))
      ),
      
      # All the release years that a user can choose
      sidebarPanel(
        selectInput("Year", "Choose a year", choices = c(1911:2019))
      )
      
      mainPanel(
        p("This app is made by movie lovers for movie lovers! Here you can learn about.....YADAYADAYDADA"),
        plotOutput("genreRate") # Scatter plot
        plotOutput("yearRate")  # Barplot 
      )
    )
  )
)