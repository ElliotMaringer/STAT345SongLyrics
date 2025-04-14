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
  mutate(
    artist_clean = str_to_lower(artist),
    artist_clean = str_replace_all(artist_clean, "[^a-z0-9]", ""),  # Remove punctuation, spaces
    song_clean = str_to_lower(title),
    song_clean = str_replace_all(song_clean, "[^a-z0-9]", "")       
  )

artist_vector <- songs_clean$artist_clean
song_vector <- songs_clean$song_clean

