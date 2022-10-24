here::i_am("code/table1.R")
library(tidyverse)
library(labelled)
library(gtsummary)
library(dplyr)

data = read.csv ("world_population.csv")

data_1 <- data %>% 
  group_by(Continent)%>% 
  summarize("2020"=sum(X2020.Population),"2015"=sum(X2015.Population),"2010"=sum(X2010.Population),"2000"=sum(X2000.Population),"1990"=sum(X1990.Population),"1980"=sum(X1980.Population),"1970"=sum(X1970.Population),"Area (km²)"=sum(Area..km..),"Density (per km²)"=sum(Density..per.km..),"Growth Rate"=sum(Growth.Rate),"World Population Percentage"=sum(World.Population.Percentage))

knitr::kable(data_1,"simple")->table1
saveRDS(table1,file = here::here("output/table1.rds"))

