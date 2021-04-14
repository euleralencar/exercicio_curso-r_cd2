# FONTE: https://stackoverflow.com/questions/52949780/how-not-to-dplyrsummarize-on-alphabetic-order-in-r

library(tidyverse)

df <- data.frame(year = rep(2013:2016, 2),
                 ID = rep(1:2, each = 4),
                 city = c("B", "B", "A", "A", "B", "B", "C", "C"),
                 address = rep(1:4, each = 2),
                 stringsAsFactors = FALSE)

# Objetivo
df %>% 
  group_by(ID, city, address) %>% 
  #note the first and last year at the address
  summarise(startyear = min(year),
            endyear = max(year)) %>% 
  #sort by ID and year
  arrange(ID, startyear) %>% 
  group_by(ID) %>% 
  #grab the next address for each ID
  mutate(to = lead(city),
         to_address = lead(address),
         to_years = lead(endyear) - lead(startyear) + 1,
         from_years = endyear - startyear + 1) %>% 
  #exclude the last row of each ID, since there's no next address being moved to
  filter(!is.na(to)) %>% 
  select(ID, from = city, from_address = address, from_years, to, to_address, to_years)


# Etapa 1
df %>% 
  group_by(ID, city, address) %>% 
  #note the first and last year at the address
  summarise(startyear = min(year),
            endyear = max(year)) %>% 
  #sort by ID and year
  arrange(ID, startyear)
  