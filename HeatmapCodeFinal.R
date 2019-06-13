

library('sf')
library('tmap')
library('tmaptools')
library('leaflet')
library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(mapview) # for interactive maps
library(ggplot2) # tidyverse vis package
library(shiny)   # for web applications
library(dplyr)
library(plotly)
setwd("C:\\Users\\Knöpfle\\Desktop\\Heatmap")

my_map <- st_read("gadm36_DEU_2.shp", stringsAsFactors = FALSE)
my_scores <- read.csv("Score_dot - Tabellenblatt1.csv", colClasses = c("character", "numeric"), sep = ",", encoding="UTF-8")
colnames(my_scores) <- c("NAME_2", "Score")

#my_map_and_scores <- cbind(my_map, my_scores)
my_map_and_scores <- inner_join(my_map, my_scores)
my_map_and_scores <- my_map_and_scores[, c(7, 14, 15)]

#plot(my_map_and_scores)

p <- ggplot () + geom_sf(data = my_map_and_scores, aes(fill = Score)) + 
  scale_fill_viridis_c(option = "plasma")
  
  #scale_fill_gradient(colors = colors))

#ggplotly(p) %>%
#  highlight(
#    "plotly_hover",
#    selected = attrs_selected(line = list(color = "black"))
#  ) %>%
#  widgetframe::frameWidget()


