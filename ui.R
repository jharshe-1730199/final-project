# The User Interface for our IMDB Dataset
# 1. User chooses the year of interest and sees a BARPLOT of 
#   genres on x-axis and average rating on y-axis

# 2. User chooses the genre of interest and sees a SCATTERPLOT
#    of a year vs average Rating
# grepl(genres, "string of single genre")
<<<<<<< HEAD

# GET KEAGAN TO GO THROUGH GENRES ON THE CSV TO MAKE SURE I HAVE ALL THE OPTIONS AVAILABLE
=======
>>>>>>> master

library(shiny)
movies <- read.csv("data/movies.csv", stringsAsFactors = FALSE)


shinyUI(
  fluidPage(
    titlePanel("IMDB Data"),
    
    sidebarLayout(
      position = "right",
      
      # All the genres that a user can choose
      sidebarPanel(
        selectInput("Genre", "Choose a genre", choices = c("Action","Adventure","Animation","Biography",
                                                         "Comedy","Crime","Documentary","Drama","Family",
                                                         "Fantasy","History","Horror","Musical","Mystery",
                                                         "Romance","Sci-Fi","Thriller","War","Western",
                                                         "Action,Adventure","Action,Comedy","Action,Sci-Fi",
                                                         "Comedy,Drama","Drama,Romance","Documentary,Horror",
                                                         "Horror,Romance","Horror,Thriller","Musical,Romance"
                                                         )
        )
      ),
      
      mainPanel(
        plotOutput("genreRate") # Scatter plot
      )
    )
  )
)