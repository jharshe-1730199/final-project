# The User Interface for our IMDB Dataset
library(shiny)
movies <- read.csv("data/movies.csv")

shinyUI(
  navbarPage(
    "IMDB Data Report",
    tabPanel(
      "Home",
      titlePanel("Home"),
      mainPanel(
        h4("Preview", align = "center"),
        p("Movies are the heart of the American entertainment industry. Whether they are enjoyed
          in the theater during opening weekend or in the comfort of your own home, there is no doubt
          that movies are loved by all. With a range of genres, there is something out there for everyone.
          However, everyone has their own opinions on how much they enjoyed a particular movie. This app has
          been created by movie-lovers for movie-lovers!"),
        p("We decided to focus our research on movie ratings with regard to year, average actor, runtime,
          and genre. With the use of histograms and a scatterplot, users will be able to interact to view
          movie ratings versus various other elements."),
        h4("Source", align = "center"),
        p("We are analyzing data sets from the IMDb database. We used datasets with a range of information
          that included movie titles, runtime, genres, actor information,  ratings, & number of votes. We ended
          up cleaning up the raw data files to just include relevant information regarding our questions since
          the file size was too big. We removed movies with below 1000 votes for rating accuracy, and removed
          actors in said movies. Also, any movies with missing data were removed. Finally, we renamed the column
          names for easier manipulation and removed excess data frames and duplicate files for RAM saving. In the
          end the data was compressed into a usable size for group work, about 2.4mb."),
        h4("Credits", align = "center"),
        em("This Shiny App was created collaboratively by: Keegan Anderson, Jacinta Harshe, Kyle Kusche, and Ronak Patel.")
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
        h3("Critical Question: "),
        conditionalPanel(
          condition = "input.sliders == 'one'",
          plotOutput("movieRuntime1")
        ),
        conditionalPanel(
          condition = "input.sliders == 'two'",
          plotOutput("movieRuntime2"),
          plotOutput("movieRuntime3")
        ),
        h4("Description:"),
        p("This plot allows the user to select one or two runtimes of interest on
          sliders and see a histogram of average rating on x-axis and number of movies with
          rating  on y-axis. If the user chooses to compare two runtimes, another graph will
          appear below the first, so that the user can clearly view the differences."),
        p("After playing with this plot, you may notice that the movie rating of roughly
          7.5 seems to be a constant in the majority of movie runtimes. This may be attributed
          to the fact that we only chose to analyze movies with over 1000 votes. Typically, people
          only vote on a particular subject if they have a strong feeling towards it. So it seems
          that the people who opt to rate movies typically like them a lot, then those who dislike
          them a lot bring the average rating down to the mid-high range")
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
        h4("Critical Question: "),
        plotOutput("genreRate"), # Scatter plot
        h4("Description:"),
        p("This plot allows a user to select a range of genres from a checkbox.
          If the user selects one genre, it will pull data only from movies classified as that
          single genre. If the user selects multiple genres, it will pull data only from movies
          that are classified as all of the selected genres. The data displayed is comparing year
          and average movie rating."),
        p("After playing with this plot, you may notice that by selecting more genres, typically
          less data is available. This can be attributed to the fact that some movies are more specifically
          categorized than others. ")
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