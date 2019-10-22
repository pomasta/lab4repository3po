# Ohhhhhh boy a new script up in here

#Peter Omasta
#This is the coolest header of all time 
#Look at this subsection 

library(tidyverse)
library(tidyr)
library(here)
library(janitor)

# Gonna wrangle the heck out of this data file. Gotta read it in first though. 

disease <- read_csv(here::here("Data","disease_burden.csv"))

#Ugly variable names, gonna need to clean that up with janitor::clean_names()

disease_clean <- disease %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)

#Want to look at infant death rates for male and remale, looking at US, Japan, Somalia, and Afghanistan

db_sub <- disease_clean %>% 
  filter(country_name %in% c("United States", "Japan",
                             "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

ggplot( data = db_sub, aes(x=year, y=deaths_per_100k)) +
  geom_line(aes(color=country_name)) 

ggsave(here::here("Final Graphs","disease_graph.png"))
