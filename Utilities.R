## Data collection
library(tidyverse)

## Function to get songs that reached top 3
getTop3Songs <- function(filepath) {
  topsongs <- read.csv(filepath)
  top3songs <- topsongs %>%
    filter(topsongs$No. <= 3)
  return(top3songs)
}

## Function to clean songs title and artist into usable text
songs_clean <- songs %>%
  rename(Artist = Artist.s.) %>%  
  mutate(
    artist_clean = str_to_lower(Artist),
    artist_clean = str_replace_all(artist_clean, "[^a-z0-9]", ""),  
    title_clean = str_to_lower(Title),
    title_clean = str_replace_all(title_clean, "[^a-z0-9]", "")
  )

artist_vector <- songs_clean$artist_clean
song_vector <- songs_clean$song_clean

