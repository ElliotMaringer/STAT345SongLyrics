## This is a test to make sure the github is working.
library(tidyverse)
library(dplyr)
top3songs <- getTop3Songs("Top100Songs.csv")
cleanSongs <- clean_song_data(top3songs)

songs <- read_csv("Top100Songs.csv")

head(songs)
=
