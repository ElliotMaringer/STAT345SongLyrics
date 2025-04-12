## Data collection
library(tidyverse)


getTop3Songs <- function(filepath) {
  topsongs <- read.csv(filepath)
  top3songs <- topsongs %>%
    filter(topsongs$No. <= 3)
  return(top3songs)
}