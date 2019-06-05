# The User Interface for our IMDB Dataset
library(shiny)
movies <- read.csv("data/movies.csv")


shinyUI(
  fluidPage(
  includeCSS("styles.css"),
  #NavbarPage for tabs
  navbarPage(
    "IMDB Data Report",
    #Info Home Page
    tabPanel(
      "Home",
      titlePanel("The Movie Report"),
      mainPanel(
        h4("Preview", align = "center"),
        p("Movies are the heart of the American entertainment industry! Whether they are enjoyed
          in the theater during opening weekend or in the comfort of your own home, there is no doubt
          that movies are loved by all. With a range of genres, there is something out there for everyone.
          However, everyone has their own opinions on how much they enjoyed a particular movie. This app has
          been created by movie-lovers for movie-lovers!"),
        p("We decided to focus our research on movie ratings with regard to year, runtime, and genre. With the
          use of histograms, a scatterplot, and  a table, users will be able to interact to view
          movie ratings versus various other elements, and manipulate elements on their own."),
        h4("About the Data", align = "center"),
        p("We are analyzing data sets from the IMDb database. We used datasets with a range of information
          that included movie titles, runtime, genres, actor information, ratings, & number of votes. We ended
          up cleaning up the raw data files to just include relevant information regarding our questions since
          the file size was too big. We removed movies with below 1000 votes for rating accuracy, and removed
          actors in said movies. Also, any movies with missing data were removed. Finally, we renamed the column
          names for easier manipulation and removed excess data frames and duplicate files for RAM saving. In the
          end the data was compressed into a usable size for group work, about 2.4mb."),
        h4("Credits", align = "center"),
        em("This Shiny App was created collaboratively by: Keagan Anderson, Jacinta Harshe, Kyle Kusche, and Ronak Patel."),
        h4("Sources", align = "center"),
        a("https://www.imdb.com/interfaces/"),
        a("https://datasets.imdbws.com")
      )
    ),
    
    #First Plot
    tabPanel(
      "Movie Ratings by Runtime",
      sidebarPanel(
        radioButtons("sliders", "How many runtimes would you like to compare?", c("one", "two")),
        #One Plot only
        conditionalPanel(
          condition = "input.sliders == 'one'",
          sliderInput("runtime1","Movie Runtime:",
                      min = 44, max = 220, value = 150)
        ),
        #2 Plots in case you want to compare 2 Runtimes
        conditionalPanel(
          condition = "input.sliders == 'two'",
          sliderInput("runtime2","Movie Runtime:",
                      min = 44, max = 220, value = 150),
          sliderInput("runtime3","Movie Runtime:",
                      min = 44, max = 220, value = 150)
        )
      ),
      mainPanel(
        h3("Critical Question: Do longer movies receive higher ratings due to more content?"),
        #Plot associated with solo slider
        conditionalPanel(
          condition = "input.sliders == 'one'",
          plotOutput("movieRuntime1")
        ),
        #Plots associated with dual sliders
        conditionalPanel(
          condition = "input.sliders == 'two'",
          plotOutput("movieRuntime2"),
          plotOutput("movieRuntime3")
        ),
        h4("Description: "),
        p("This plot allows the user to select one or two runtimes of interest on
          sliders and see a histogram of average rating on x-axis and frequency of movies with
          that rating on the y-axis. If the user chooses to compare two runtimes, another graph will
          appear below the first, so that the user can clearly view the differences."),
        h4("Conclusion:"),
        p("After playing with this plot, you may notice that the movie rating of roughly
          7.5 seems to be a constant in the majority of movie runtimes. This may be attributed
          to the fact that we only chose to analyze movies with over 1000 votes. Typically, people
          only vote on a particular subject if they have a strong feeling towards it. So it seems
          that the people who opt to rate movies typically like them a lot, then those who dislike
          them a lot bring the average rating down to the mid-high range. To answer the question, there
          seems to be no strong correlation between a longer runtime and a higher rating. There are no
          large outliers to note.")
      )
    ),
    
    # 2nd Plot Page
    tabPanel(
      "Movie Ratings by Release Year",
      sidebarPanel(
        sliderInput("year","Year of Release:",
                    min = 1911, max = 2019, value = 2000)
      ),
      # Plot dependent on year chosen
      mainPanel(
        h3("Critical Question: Do movies released at a later date receive more movie ratings?"),
        plotOutput("movieYear"),
        h4("Description:"),
        p("This plot allows the user to select a year of interest on a slider and view a histogram
         of average rating on x-axis and frequency of movies with rating on y-axis. The ranges of each
         will change depending on the number of movies released and rated that year."),
        h4("Conclusion:"),
        p("After playing with this plot, it looks as if, yes, movies released at a later date receive
         more movie ratings. For nearly every year up until the mid-1930s, there are less than 10 movie
         raters per average rating. In contrast, each year more movies receive more ratings. More
         than 100 ratings each year have been noted in the past 10 years. This can be attributed to the fact
         that more technology has been introduced in the latter half of the 20th century. Access to computers
         in the home has become a norm, which likely accounts for the influx in movie ratings for more recent
         years. However, one should note that the actual ratings the movies are given do not seem affected by
         release year. There seems to be a stable trend of 6-8 rating from the early 1900s to today.")
      )
    ),
    
    #3rd Plot page
    tabPanel(
      "Movie Ratings by Genre",
    
      sidebarLayout(
        position = "right",
                sidebarPanel(
          checkboxGroupInput("Genre", "Choose a genre", choices = c("Action","Adventure","Animation","Biography",
                                                                    "Comedy","Crime","Documentary","Drama","Family",
                                                                    "Fantasy","Film-Noir","History","Horror","Musical","Mystery",
                                                                    "Romance","Sci-Fi","Sport","Thriller","War","Western")
          )
        ),
        mainPanel(
        h4("Critical Question: Does classifying drama as an additional genre to a movie lead to higher ratings?"),
        plotOutput("genreRate"), # Scatter plot
        h4("Description:"),
        p("This plot allows a user to select a range of genres from a checkbox.
          If the user selects one genre, it will pull data only from movies classified as that
          single genre. If the user selects multiple genres, it will pull data only from movies
          that are classified as all of the selected genres. The data displayed is comparing year
          and average movie rating."),
        h4("Conclusion:"),
        p("After playing with this plot, there are lots of different trends that can be depicted
          depending on what the user decides to toggle. In terms of our question, by looking at genres
          on their own versus genres + drama in regard to higher ratings, these are the findings:"),
        h6("Action, Drama - Y"),
        h6("Adventure, Drama - Y"),
        h6("Animation, Drama - Y"),
        h6("Biography, Drama - N"),
        h6("Comedy, Drama - Y"),
        h6("Crime, Drama - Y"),
        h6("Documentary, Drama - N"),
        h6("Family, Drama - Y"),
        h6("Fantasy, Drama - Y"),
        h6("History, Drama - Y"),
        h6("Horror, Drama - Y"),
        h6("Musical, Drama - N"),
        h6("Mystery, Drama - Y"),
        h6("Romance, Drama - Y"),
        h6("Sci-Fi - Drama - Y"),
        h6("Thriller, Drama - Y"),
        h6("War, Drama - Y"),
        h6("Western, Drama - Y"),
        p("Seeing that a vast majority of the genres improve in rating when classified as drama in addition
          to just their single genre, one might say that classifying, or adding elements of drama to a film
          will lead to higher ratings. This is expected, seeing that drama often keeps the audience engaged
          and entertained throughout the entirety of the movie. As for those where the addition of drama did
          not increase their average rating, it is important to understand appropriateness. It makes sense that
          adding drama to a documentary or biography may be out of place, and therefore have no impact on ratings.")
        )
      )
    ),
    
    # 4th Plot Page
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
          tableOutput("top5"), # Table
          br(),
          h4("Description: "),
          p("This table allows a user to first select a year of interest and then select a genre of interest.
            The table will then display the movie title, year, runtime, genre(s) and average rating of the 
            top rated movie of that year. There are no patterns to depict or recognize due to the nature oft
            this table.")
        )
      )
    )
  )
  )
)