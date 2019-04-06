library(lubridate)
library(httr)
library(jsonlite)
library(tidyverse)


options(stringsAsFactors = FALSE)

yelp <- stream_in(file("masterleague_1.json"))
