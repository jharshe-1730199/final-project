# The User Interface for our IMDB Dataset
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
      "Movie Ratings by Runtime",
      sidebarPanel(
        radioButtons("sliders", "How many runtimes would you like to compare?", c("one", "two")),
        conditionalPanel(
          condition = "input.sliders == 'one'",
          sliderInput("runtime1","Movie Runtime:",
                      min = 44, max = 220, value = 150)
        ),
        conditionalPanel(
          condition = "input.sliders == 'two'",
          sliderInput("runtime2","Movie Runtime:",
                      min = 44, max = 220, value = 150),
          sliderInput("runtime3","Movie Runtime:",
                      min = 44, max = 220, value = 150)
        )
      ),
 
      mainPanel(
        conditionalPanel(
          condition = "input.sliders == 'one'",
          plotOutput("movieRuntime1")
        ),
        conditionalPanel(
          condition = "input.sliders == 'two'",
          plotOutput("movieRuntime2"),
          plotOutput("movieRuntime3")
        )
      )
    ),
    
    tabPanel(
      "Movie Ratings by Release year",
      sidebarPanel(
        sliderInput("year","Year of Release:",
                    min = 1911, max = 2019, value = 2000)
      ),
      mainPanel(
        plotOutput("movieYear")
      )
    ),

    tabPanel(
      "Ratings overtime by Genre",
      sidebarLayout(
        position = "right",
        
        # All the genres that a user can choose
        sidebarPanel(
          checkboxGroupInput("Genre", "Choose a genre", choices = c("Action","Adventure","Animation","Biography",
                                                                    "Comedy","Crime","Documentary","Drama","Family",
                                                                    "Fantasy","Film-Noir","History","Horror","Musical","Mystery",
                                                                    "Romance","Sci-Fi","Sport","Thriller","War","Western")
          )
        ),
        mainPanel(
          plotOutput("genreRate") # Scatter plot
        )

      )
    ),
    
    tabPanel(
      "Top Rated Movies",
      
      sidebarLayout(
        position = "right",
        
        sidebarPanel(
          selectInput("Year", "Choose a year", choices = c(2019:1911)),
          
          selectInput("movieGenre", "Choose a genre", choices = c("Action","Adventure","Animation","Biography",
                                                             "Comedy","Crime","Documentary","Drama","Family",
                                                             "Fantasy","Film-Noir","History","Horror","Musical","Mystery",
                                                             "Romance","Sci-Fi","Sport","Thriller","War","Western"))
          
        ),
        mainPanel(
          tableOutput("top5") # Table
        )
      )
    )
  )
)