library(dplyr)
life_exceptancy <- read.csv("C:/Users/liavb/Downloads/Life Expectancy Data.csv")
life_exceptancy <- as.data.frame(unclass(life_exceptancy),stringsAsFactors = TRUE)
life_exceptancy <- life_exceptancy %>% select(colnames(life_exceptancy)[! colnames(life_exceptancy) %in% "Adult.Mortality" ])
life_exceptancy <- na.omit(life_exceptancy)
## 85% of the sample size
smp_size <- floor(0.85 * nrow(life_exceptancy))
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(life_exceptancy)), size = smp_size)
train <- life_exceptancy[train_ind, ]
test <- life_exceptancy[-train_ind, ]
summary(life_exceptancy)
no_factor_data <- life_exceptancy[,colnames(life_exceptancy)[ which(! colnames(life_exceptancy) %in% c("Country","Status"))]]
cor_table <- round(cor(no_factor_data),2)
cor_heatmap <- heatmap(cor_table)
