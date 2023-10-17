library(tidyverse)
library(maps)
library(sf)

state <- map("state", fill = T)
county <- map("county", fill = T)

state <- st_as_sf(state)
county <- st_as_sf(county)

tx <- state %>% filter(ID %in% c("texas"))
b <- county %>% filter(ID %in% c("texas,brazoria"))

ggplot(tx) +
  geom_sf(fill = "white", color = "#009F00", lwd = 1) +
  geom_sf(data = b, fill = "#FE5101") +
  theme_void()
ggsave("static/img/texas.png")
