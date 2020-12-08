#Packages--------------

library(rvest)
library(purrr)
library(xml2) 
library(readr)

# Importing data ----------------------------------------------------------
# Importing the file
base <- read.csv("./data/base.csv", row.names = 1, header= TRUE)
# Pulling out the address of the article
article_general <- as.vector(base[,2])

#Cheking if it is a vector
str(article_general)
summary(article_general)

# Function for extracting text --------------------------------------------

extract_articles <- function(x){
  webpage <- read_html(x)
  text <- html_nodes(webpage,'p') 
  text_data <- html_text(text)
  Article <- paste(text_data,collapse="\n")
  return(Article)
}

## Extracting --------------------------------------------
base[6,3] <-extract_articles(article_general[6])







