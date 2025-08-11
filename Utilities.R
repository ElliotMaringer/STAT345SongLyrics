## Data collection
library(tidyverse)

## Function to get songs that reached top 3
get_Top3_Songs <- function(filepath) {
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

get_duration <- function(title, artist) {
  query <- paste(title, artist)
  result <- search_spotify(query, type = "track", limit = 1)
  if (nrow(result) > 0) {
    return(result$duration_ms[1] / 1000)
  } else {
    message(paste("No match found (duration):", query))
    return(NA)
  }
}

get_genres <- function(title, artist) {
  query <- paste(title, artist)
  result <- search_spotify(query, type = "track", limit = 1)
  
  if (nrow(result) > 0 && length(result$artists[[1]]$id) > 0) {
    artist_id <- result$artists[[1]]$id[1]
    artist_info <- get_artist(artist_id)
    
    # Safely check if genres exist
    if (!is.null(artist_info$genres) && length(artist_info$genres) > 0 && length(artist_info$genres[[1]]) > 0) {
      return(paste(artist_info$genres[[1]], collapse = ", "))
    } else {
      message(paste("No genre data for:", title, "-", artist))
      return(NA)
    }
  } else {
    message(paste("No match found (genre):", title, "-", artist))
    return(NA)
  }
}

add_song_duration <- function(df) {
  df <- df %>%
    rename(Artist = 'Artist(s)') %>%
    rowwise() %>%
    mutate(
      duration_sec = get_duration(Title, Artist),
    ) %>%
    ungroup()
  
  return(df)
}



