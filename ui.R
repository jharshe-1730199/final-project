# The User Interface for our IMDB Dataset
# 1. User chooses the year of interest and sees a BARPLOT of 
#   genres on x-axis and average rating on y-axis
#
# 2. User chooses the genre of interest and sees a SCATTERPLOT
#    of a year vs average Rating
#
# 3. User chooses the average actor age on a slider and sees a HISTOGRAM
#   of average rating on x-axis and frequency on y-axis.
#
# 4. User chooses the runtime of interest and sees a HISTOGRAM of
#   of average rating on x-axis and frequency on y-axis.

library(shiny)
movies <- read.csv("data/movies.csv")

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
      #  p("This app is made by movie lovers for movie lovers! Here you can learn about.....YADAYADAYDADA"),
        plotOutput("genreRate"), # Scatter plot
        plotOutput("yearRate"),  # Barplot 
        plotOutput(outputId = "distPlot") # Histogram
      )
    )
  )
)