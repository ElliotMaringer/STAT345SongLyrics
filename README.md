# Song Lyrics Repetition Analysis

This project analyzes the lyrical repetitiveness of popular songs using data from Billboard’s Top 100 charts, with a focus on changes over time. The analysis includes custom metrics, full data processing in R, and a final report generated via R Markdown. This work was completed as a final project for STAT 345.

## Project Overview

The goal of the project is to explore how repetitiveness in song lyrics has evolved from 1946 to the present day. We built a custom dataset combining scraped lyrics and Spotify metadata, then applied multiple methods to quantify repetition.

The project includes:

- Data scraping and cleaning from public sources
- Calculation of four distinct repetitiveness metrics
- Visualization of trends in repetition across decades
- Interpretation of results in a full narrative report

## Analytical Methods

We used four key metrics to quantify repetition:

1. **Unique-to-Total Word Ratio**  
   Measures vocabulary diversity; lower values indicate more repetition.

2. **Title Word Repetition**  
   Counts how often the song title is repeated in the lyrics.

3. **Line or Verse Repetition**  
   Analyzes the repetition of entire lines or choruses.

4. **Most Repeated Non-Stop Words**  
   Identifies the most frequently used meaningful word (excluding common stop words).

Each method captures a different dimension of repetitiveness, and together they provide a broad perspective on lyrical trends.

## Tools and Technologies

- R for all data wrangling, analysis, and visualization
- `rvest` for web scraping lyrics
- `tidyverse` for data manipulation
- `stringr` for text processing
- `ggplot2` for visualizations
- `rmarkdown` for report generation

## Final Deliverable

The final deliverable is `Stat345DocumentFinal.docx`, which includes:

- An introduction to the problem and goals
- Description of all four repetitiveness methods
- Plots showing trends across time
- Interpretation and discussion of results
- Conclusion summarizing insights on how music has changed
