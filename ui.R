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
  navbarPage(
    "IMDB Data",
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

      )
    )
