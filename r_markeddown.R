#' ---
#' title: "Test Drive R Markdown"
#' output: github_document
#' ---

library(tidyverse)
#' **first steps**
head(mpg)
# map points by class using color
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, color=class))
# map points by class using size
ggplot(data = mpg) + geom_point(mapping = aes(x= displ, y=hwy, size=class))