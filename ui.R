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
    "IMDB Data Report",
    tabPanel(
      "Home",
      mainPanel(
      )
    ),
    
    tabPanel(
      "1st Plot",
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
      "2nd Plot",
      sidebarPanel(
        sliderInput("year","Year of Release:",
                    min = 1911, max = 2019, value = 2000)
      ),
      mainPanel(
        plotOutput("movieYear")
      )
    ),

    tabPanel(
      "3rd Plot",
      sidebarPanel(
        sliderInput("age","Average Actor Age:",
                    min = 5, max = 95.5, value = 40)
      ),
      mainPanel(
       plotOutput("movieAge")
      )
    ),
    
    tabPanel(
      "Ratings ScatterPlot",
    
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

        #  p("This app is made by movie lovers for movie lovers! Here you can learn about.....YADAYADAYDADA"),
        #plotOutput("genreRate") # Scatter plot
        #  plotOutput("yearRate")  # Barplot 
 plotOutput("genreRate") # Scatter plot
        )

      )
    )
  )
)