# Read Excel csv
Dat <- read.csv("E:/APRIL/Skill Training/R/Data Visualization/Data/Landslide Training & Testing Dataset.csv")

# Add New Columns followed the value in Axis columns before 
Dat$Inventory[Dat$L.NL==0]<-"Non-Landslide" # This function also able to rename value
Dat$Inventory[Dat$L.NL==1]<-"Landslide"
View(Dat)

# Subset the Non-landslide Data and Sumber Coloumn with dplyr
library(tidyverse)
L <- dplyr:: filter(Dat, L.NL!= 0) %>% # "PIPE OPERATOR" that provided by dplyr
  select(-Sumber,-ReUL)
LNL <- select(Dat, -Sumber,-ReUL)

# Rename the columns
names(L) <-c("Bin_Inv","Topographic Wetness Index", "Topograpic Position Index",
                    "Stream Power Index", "Soil", "Slope", "Rainfall", "Profile Curvature",
                    "Landuse","Elevation","Distance to Road","Distance to Drainage", "Landform","Aspect", "Inventory")
names(LNL) <-c("Bin_Inv","Topographic Wetness Index", "Topograpic Position Index",
             "Stream Power Index", "Soil", "Slope", "Rainfall", "Profile Curvature",
             "Landuse","Elevation","Distance to Road","Distance to Drainage", "Landform","Aspect","Inventory")
View(L)
View(LNL)

library(ggplot2)
ggplot(LNL, aes(x = factor(Slope), fill = Inventory)) +
  geom_bar(mapping = aes(x = factor(Slope), fill = Inventory),
           position = "dodge") +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.4, colour = "black", size=3,position = position_dodge(0.8)) +
  labs(title="Training & Testing Data Distribution \nin Each Slope Classes", x = "Slope Classes", y = "Amount") +
  scale_x_discrete(
  breaks = c(1, 2, 3, 4, 5, 6, 7),
  labels = c("0-2°", "2-4°", "4-8°", "8-16°","16-35°", "35-55°", ">55°")
)
