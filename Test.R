## This is a test to make sure the github is working.
library(tidyverse)
library(tidytext)
library(dplyr)
library(readxl)

songs <- read_csv("songs_with_lyrics.csv")
allSongs <- read_excel("combined_all_songs_lyrics.xlsx")

## Get stop words in a suitable format
stop_words <- read_lines("NLTK's list of english stopwords") %>%
  tolower() %>%
  tibble(word = .)

## Remove all songs that have NA as lyrics then split songs lyrics into single
## words that are not stop words for analysis
clean_lyrics <- songs %>%
  filter(!is.na(lyrics)) %>%
  unnest_tokens(word,lyrics) %>%
  anti_join(stop_words, by = "word")

## Get word counts for each word in each songs
word_counts <- clean_lyrics %>%
  count(Title, word, sort = TRUE)

## Get total repeats of all words for each song
summary <- word_counts %>%
  group_by(Title) %>%
  summarize(total_repeats = sum(n[n > 1])) %>%
  arrange(desc(total_repeats))

## Bar plot of the top 10 most repetitiveness songs (based off of repetitiveness of non-stop words)
summary %>%
  slice_max(total_repeats, n = 10) %>%
  ggplot(aes(x = reorder(Title, total_repeats), y = total_repeats)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Top 10 Most Repetitive Songs (Non-Stop Words)",
    x = "Song Title",
    y = "Total Repeated Non-Stop Words"
  ) +
  theme_minimal()

## Join songs with their number of repeats
songs_with_repeats <- summary %>%
  left_join(songs %>% select(Title, Year), by = "Title")

## Scatter plot with curved regression line of songs repetitiveness over time
p4 <- songs_with_repeats %>%
  ggplot(aes(x = Year, y = total_repeats)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method ="loess", se = FALSE, color = "firebrick") +
  labs(
    title = "Repetitiveness of Lyrics Over Time",
    x = "Year",
    y = "Total Repeated Non-Stop Words" 
  ) +
  theme_minimal()

ggsave("StopWordsPlot.png", plot = p4, width = 8, height = 5, dpi = 300, bg = "white")

## Join songs with their number of repeats
songs_with_repeats_duration <- summary %>%
  left_join(allSongs %>% select(Title, Year, duration_sec), by = "Title")

## Scatter plot with curved regression line of songs repetitiveness over time
p5 <- songs_with_repeats_duration %>%
  ggplot(aes(x = Year, y = total_repeats / duration_sec)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method ="loess", se = FALSE, color = "firebrick") +
  labs(
    title = "Repetitiveness of Lyrics Over Time",
    x = "Year",
    y = "Total Repeated Non-Stop Words / duration" 
  ) +
  theme_minimal()

ggsave("StopWordsPlotDuration.png", plot = p5, width = 8, height = 5, dpi = 300, bg = "white")








