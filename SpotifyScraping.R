##install.packages("spotifyr")
library(spotifyr)

Sys.setenv(SPOTIFY_CLIENT_ID = 'xxxxxxxxxxxxxxx')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'xxxxxxxxxxxx')

access_token <- get_spotify_access_token()

track <- search_spotify("bad guy billie eilish", type = "track", limit = 1)

get_duration("Let me love you","mario" )

test_songs <- head(top3songs, 5)

test_songs <- test_songs %>%
  rowwise() %>%
  mutate(duration_sec = get_duration(Title, Artist.s.)) %>%
  ungroup()


head(track)
