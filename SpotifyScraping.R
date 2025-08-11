##install.packages("spotifyr")
library(spotifyr)

Sys.setenv(SPOTIFY_CLIENT_ID = '2591b396c76b4e1a9c3de07d2d7e07c0')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'ff1dc383d7054a6cbd1b26fc8ad691f7')

access_token <- get_spotify_access_token()

track <- search_spotify("bad guy billie eilish", type = "track", limit = 1)

get_duration("Let me love you","mario" )

test_songs <- head(top3songs, 5)

test_songs <- test_songs %>%
  rowwise() %>%
  mutate(duration_sec = get_duration(Title, Artist.s.)) %>%
  ungroup()


head(track)
