library(dplyr)
life_exceptancy <- read.csv("C:/Users/liavb/Downloads/Life Expectancy Data.csv")
life_exceptancy <- life_exceptancy %>% select(colnames(! colnames(life_exceptancy) %in% "Adult.Mortality" ))
