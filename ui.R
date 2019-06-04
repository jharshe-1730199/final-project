# The User Interface for our IMDB Dataset
# 1. User chooses the year of interest and sees a BARPLOT of 
#   genres on x-axis and average rating on y-axis

# 2. User chooses the genre of interest and sees a SCATTERPLOT
#    of a year vs average Rating
# grepl(genres, "string of single genre")

library(shiny)
movies <- read.csv("data/movies.csv")

shinyUI(
  fluidPage(
    titlePanel("IMDB Data"),
    
    sidebarLayout(
      position = "right",
      
      # All the genres that a user can choose
      sidebarPanel(
        checkboxGroupInput("Genre", "Choose a genre", choices = c("Action","Adventure","Animation","Biography",
                                                         "Comedy","Crime","Documentary","Drama","Family",
                                                         "Fantasy","Film-Noir","History","Horror","Musical","Mystery",
                                                         "Romance","Sci-Fi","Sport","Thriller","War","Western"
                                                         )
        )
      ),

#      sidebarPanel(
#        sliderInput("year","Year of Release:",
#                    min = 1911, max = 2019, value = 2000)
#      ),
#      sidebarPanel(
#        sliderInput("age","Average Actor Age:",
#                    min = 5, max = 95.5, value = 40)
#      ),

      mainPanel(
        plotOutput("genreRate"), # Scatter plot
        plotOutput("movieRuntime"),
        plotOutput("movieYear"),
        plotOutput("movieAge")
      )
    )
  )
)