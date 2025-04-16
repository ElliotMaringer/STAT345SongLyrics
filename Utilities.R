## Data collection
library(tidyverse)

## Function to get songs that reached top 3
getTop3Songs <- function(filepath) {
  library(dplyr)
  
  topsongs <- read.csv(filepath)
  
  # Clean and convert No. column to numeric
  topsongs$No. <- as.numeric(trimws(topsongs$No.))
  
  top3songs <- topsongs %>%
    filter(No. <= 3)
  
  return(top3songs)
}

## Function to clean songs title and artist into usable text
clean_song_data <- function(dataset) {
  library(dplyr)
  library(stringr)
  
  cleaned <- dataset %>%
    rename(Artist = `Artist.s.`) %>%  
    mutate(
      artist_clean = str_to_lower(Artist),
      artist_clean = str_replace_all(artist_clean, "[^a-z0-9]", ""),
      title_clean = str_to_lower(Title),
      title_clean = str_replace_all(title_clean, "[^a-z0-9]", "")
    )
  
  return(cleaned)
}

