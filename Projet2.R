#install.packages("rmarkdown")
resultKeep <- c()
resultChange <- c()
resultRandom <- c()
library(ggplot2)
library(rmarkdown)

change <- function() {
  box <- c(0.1,1000000,0.1)
  choice <- sample(1:3,1)
  if (choice == 1) {
    box[2]
  } else if (choice == 2) {
    box[1]
  } else if (choice == 3) {
    box[2]
  }
}

keep <- function() {
  box <- c(0.1,1000000,0.1)
  choice <- sample(1:3,1)
  box[choice]
}

random <- function() {
  box <- c(0.1,1000000,0.1)
  choice <- sample(1:3,1)
  if (choice == 1) {
    choice <- sample(1:2,1)
    box[choice]
  } else if (choice == 2) {
    choice <- sample(1:2,1)
    box[choice]
  } else if (choice == 3) {
    choice <- sample(2:3,1)
    box[choice]
  }
}

for (i in 1:1000) {
  resultChange <- c(resultChange,change())
  resultKeep <- c(resultKeep, rester())
  resultRandom <- c(resultRandom, aleatoire())
}

resultat <- data.frame(strategy = c('Keep','Change','Random'), mean = c(mean(resultChange), mean(resultKeep),mean(resultRandom)))
head(resultat)

ggplot(data = resultat, aes(x = strategy, y = mean)) + geom_bar(stat = "identity")