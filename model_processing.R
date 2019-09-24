
# install.packages("gapminder")
library(gapminder)
library(tidyverse)
gapminder

by_country <- gapminder %>% 
  dplyr::group_by(country, continent) %>% 
  nest()

country_model <- function(df){
  lm(lifeExp ~ year, data = df)
}

by_country <- by_country %>% 
  mutate(models = map(.$data, country_model))

nz <- filter(gapminder, country == "New Zealand")
nz_mod <- lm(lifeExp ~ year, data = nz)
nz_mod %>% broom::glance()
nz_mod %>% broom::tidy()


by_country %>% 
  mutate(tidy_mod = map(models, broom::tidy)) %>% 
  mutate(slope = 
           map_dbl(tidy_mod,
           ~ filter(..1, term == "year") %>% 
           pluck("estimate")
         )
  ) %>%
  mutate(theta = atan(slope))

         