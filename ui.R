# The User Interface for our IMDB Dataset
# 1. User chooses the year of interest and sees a BARPLOT of 
#   genres on x-axis and average rating on y-axis

# 2. User chooses the genre of interest and sees a SCATTERPLOT
#    of a year vs average Rating
# grepl(genres, "string of single genre")

library(shiny)
movies <- read.csv("data/movies.csv")
shinyUI(
  navbarPage(
    "IMDB Data",
    tabPanel(
      "Home",
      mainPanel(
        
      )
    ),
    
    tabPanel(
      "1st Plot"
    ),
    
    tabPanel(
      "2nd Plot"
    ),
    
    tabPanel(
      "3rd Plot"
    ),
    
    tabPanel(
      "Ratings ScatterPlot",
    
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
        #  p("This app is made by movie lovers for movie lovers! Here you can learn about.....YADAYADAYDADA"),
          plotOutput("genreRate") # Scatter plot
        #  plotOutput("yearRate")  # Barplot 
        )
      )
    )
  )
)