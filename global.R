## libraries list

library(shiny)
library(knitr)
library(shinydashboard)
library(rgdal)
library(dplyr)
library(readxl)
library(geojson)
library(geojsonio)
library(rmapshaper)
library(leaflet)
library(ggpubr)
library(viridis)
library(devtools)
library(ggplot2)
library(ggiraph)
library(shinymeta)
library(shinyAce)
library(clipr)
library(stringr)
library(zoo)
library(shinyjs)
library(bsplus)
library(shinycustomloader)


## Dataprep

# Read in the study population data
tab1 <- read.csv(file="data/table1.csv") 

# Read in the development by age data
ontrack <- read.csv(file="data/OnTrackByAge.csv")

# Read in the model estimates data
tab3 <- read.csv(file="data/table3.csv") 

# Read in ABS timeseries data
wpi <- readRDS(file = "data/wpi.rds")

# Load the map data (map.dat)
load("data/qmap")