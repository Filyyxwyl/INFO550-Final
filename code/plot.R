here::i_am("code/plot.R")
library(tidyverse)
library(labelled)
library(gtsummary)
library(dplyr)

data = read.csv ("world_population.csv")

data_1 <- data %>% 
  group_by(Continent)%>% 
  summarize("2020"=sum(X2020.Population),"2015"=sum(X2015.Population),"2010"=sum(X2010.Population),"2000"=sum(X2000.Population),"1990"=sum(X1990.Population),"1980"=sum(X1980.Population),"1970"=sum(X1970.Population),"Area (km²)"=sum(Area..km..),"Density (per km²)"=sum(Density..per.km..),"Growth Rate"=sum(Growth.Rate),"World Population Percentage"=sum(World.Population.Percentage))


data_1 %>% 
  pivot_longer(c(`1970`,`1980`,`1990`,`2000`,`2010`,`2015`,`2020`), names_to = "year", values_to = "population")->figure_data

ggplot(data=figure_data)+
  geom_line(aes(x=year,y=population,group = Continent,color = Continent)) -> plot1


ggsave(
  here::here("output/plot1.png"),
  plot=plot1,
  device = "png"
)