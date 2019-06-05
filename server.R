# The Server output for our IMDB Dataset
library(shiny)
library(ggplot2)
library(dplyr)
movies <- read.csv("data/movies.csv")

theme_custom <- function (base_size = 11, base_family = "") 
{
  half_line <- base_size/2
  theme(
    line = element_line(colour = "white", size = 0.5, 
                        linetype = 1, lineend = "butt"), 
    rect = element_rect(fill = "white", colour = "black",
                        size = 0.5, linetype = 1),
    text = element_text(family = base_family, face = "plain",
                        colour = "white", size = base_size,
                        lineheight = 0.9,  hjust = 0.5,
                        vjust = 0.5, angle = 0, 
                        margin = margin(), debug = FALSE), 
    
    axis.line = element_blank(), 
    axis.text = element_text(size = rel(0.8), colour = "grey30"),
    axis.text.x = element_text(margin = margin(t = 0.8*half_line/2), 
                               vjust = 1), 
    axis.text.y = element_text(margin = margin(r = 0.8*half_line/2),
                               hjust = 1),
    axis.ticks = element_line(colour = "grey20"), 
    axis.ticks.length = unit(half_line, "pt"), 
    axis.title.x = element_text(margin = margin(t = 0.8 * half_line,
                                                b = 0.8 * half_line/2)),
    axis.title.y = element_text(angle = 90, 
                                margin = margin(r = 0.8 * half_line,
                                                l = 0.8 * half_line/2)),
    
    legend.background = element_rect(colour = "#252525", fill="#252525"), 
    legend.margin = unit(0.2, "cm"), 
    legend.key = element_rect(fill = "#252525", colour = "#252525"),
    legend.key.size = unit(1.2, "lines"), 
    legend.key.height = NULL,
    legend.key.width = NULL, 
    legend.text = element_text(size = rel(0.8)),
    legend.text.align = NULL,
    legend.title = element_text(hjust = 0), 
    legend.title.align = NULL, 
    legend.position = "right", 
    legend.direction = NULL,
    legend.justification = "center", 
    legend.box.background = , 
    
    panel.background = element_rect(fill = "#252525", colour = "#252525"),
    panel.border = element_blank(), 
    panel.grid.major = element_line(colour = "white"), 
    panel.grid.minor = element_line(colour = "white", size = 0.25), 
    panel.margin = unit(half_line, "pt"), panel.margin.x = NULL, 
    panel.margin.y = NULL, panel.ontop = FALSE, 
    
    strip.background = element_rect(fill = "green", colour = NA),
    strip.text = element_text(colour = "grey10", size = rel(0.8)),
    strip.text.x = element_text(margin = margin(t = half_line,
                                                b = half_line)), 
    strip.text.y = element_text(angle = -90, 
                                margin = margin(l = half_line, 
                                                r = half_line)),
    strip.switch.pad.grid = unit(0.1, "cm"),
    strip.switch.pad.wrap = unit(0.1, "cm"), 
    
    plot.background = element_rect(colour = "#252525", fill = "#252525"), 
    plot.title = element_text(size = rel(1.2), 
                              margin = margin(b = half_line * 1.2)),
    plot.margin = margin(half_line, half_line, half_line, half_line),
    complete = TRUE)
}
theme_set(theme_custom(base_size = 20))
shinyServer(
  function(input, output) {
    
    # Histogram of Average Rating vs Frequency depending on input year given
    output$movieYear <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#a10081", data = movies %>% 
                         filter(input$year == year))
    })
    
    # Histogram of Average Rating vs Frequency depending on runtime given (1st Slider)
    output$movieRuntime1 <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#0ba100", data = movies %>% 
                         filter(input$runtime1 == runtime)) +
        xlim(1, 10)
    })
    
    # Histogram of Average Rating vs Frequency depending on runtime given (2nd Slider)
    output$movieRuntime2 <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#ff8800", data = movies %>% 
                         filter(input$runtime2 == runtime)) +
        xlim(1, 10)
    })
    
    # Histogram of Average Rating vs Frequency depending on runtime given (3rd Slider)
    output$movieRuntime3 <- renderPlot({
      ggplot(movies, aes(x=averageRating)) + 
        geom_histogram(fill = "#dd9200", data = movies %>% 
                         filter(input$runtime3 == runtime)) +
        xlim(1, 10)
    })

    # Scatterplot of Year vs Average rating depending on genre or genres selected
    output$genreRate <- renderPlot(
      ggplot(movies, aes(x = year, y = averageRating, size = numVotes)) +
        geom_point(color = "#ff8800",data = movies %>%
                          filter(gsub(" ", "", toString(input$Genre)) == genres)) +
        xlim(1911, 2019) +
        ylim(1, 10)
    )
    
    # Table of the top rated movie of the given year that includes the given genre
    output$top5 <- renderTable(
      movieFilter <- movies %>%
        filter(year == input$Year) %>% 
        filter(grepl(input$movieGenre, genres)) %>% 
        filter(averageRating == max(averageRating))
    )
  }
)
