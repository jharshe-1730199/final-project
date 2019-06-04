
# This file is only to cut down the file size of the IMDb data files so that they can be pushed to 
# Github. The IMDb database files were 340mb in their raw form and before use in our app, they had to be cut down.
# It is also not meant to be run in our applet as the original data files were too big to be sourced.

library(dplyr)
library(magrittr)
library(data.table)
##FILTERING TITLES
# Filters title dataset to movies only, and only relevant IDs and information. 
# Also renames them for easier manipulation
titles <- data.table::fread('data/title.basics.tsv.gz')
titles <- titles %>% filter(titleType=='movie') %>% 
  select(tconst, primaryTitle, startYear, runtimeMinutes, genres)
colnames(titles) <- c('tconst', 'title', 'year', 'runtime', 'genres')

## FILTERING NAMES and PRINCIPAL CAST
names <- data.table::fread('data/name.basics.tsv.gz')
names <- names %>% select('nconst', 'birthYear')
principals <- data.table::fread('data/title.principals.tsv.gz')

# Filtering out only actors, and only taking the 
# title ID and their name ID to be joined with the names and age data
principals <- principals %>% filter(category=='actor') %>%
  select('tconst', 'nconst')

# Calculating ages of actors, removing unwanted columns
actors <- inner_join(principals, names, by='nconst')
rm(principals, names)
# Select necessary columns, remove empty birthYears
actors <- actors %>% filter(birthYear!="\\N")

##FILTERING Ratings for movies with more than 1000 ratings for accuracy
ratings <- data.table::fread('data/title.ratings (1).tsv.gz')
ratings <- ratings %>% filter(numVotes > 1000)

#JOINING data and calculating age of actor when the movie came out. 
joined <- inner_join(actors, titles, by="tconst") %>% inner_join(ratings, by="tconst")

# Remove excess dataframes for RAM saving
rm(actors, titles, ratings)

# Calculating average crew member age
joined$age <- as.numeric(joined$year) - as.numeric(joined$birthYear)
average_crew_age <- aggregate(joined[, 10], list(joined$tconst), mean)
colnames(average_crew_age) <- c('tconst', 'average_age')
#Joining with set of movie titles
joined <- select(joined, -c('nconst', 'birthYear', 'age')) %>% 
  inner_join(average_crew_age, joined, by='tconst')
# Remove duplicate entries
joined <- joined[!duplicated(joined$tconst), ]

write.csv(joined, 'data/movies.csv')
