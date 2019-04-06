library(tidyverse)
library(jsonlite)

#example link found: https://blog.exploratory.io/working-with-json-data-in-very-simple-way-ad7ebcc0bb89

yelp <- stream_in(file("yelp_academic_dataset_business.json"))

str(yelp)

yelp_flat <- flatten(yelp)

str(yelp_flat)

yelp_tbl <- as_data_frame(yelp_flat)

yelp_tbl %>% 
  mutate(categories = as.character(categories)) %>% 
  select(categories)

yelp_tbl %>% 
  select(-starts_with("hours"), -starts_with("attribute"))

yelp_tbl %>% 
  select(-starts_with("hours"), -starts_with("attribute")) %>%
  filter(str_detect(categories, "Restaurant"))

?str_detect

yelp_tbl %>% select(-starts_with("hours"), -starts_with("attribute")) %>%
  filter(str_detect(categories, "Restaurant")) %>%
  mutate(categories = as.character(categories)) %>% 
  select(categories)

yelp_tbl %>% select(-starts_with("hours"), -starts_with("attribute")) %>%
  filter(str_detect(categories, "Restaurants")) %>%
  unnest(categories) %>%
  filter(categories != "Restaurants") %>%
  count(state, categories) %>%
  filter(n > 10) %>%
  group_by(state) %>%
  top_n(1, n)
  
