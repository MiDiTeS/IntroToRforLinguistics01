---
title: "A very introduction to dyplr"
author: "| Rodrigo Esteves de Lima-Lopes \n| State University of Campinas \n| rll307@unicamp.br\n"
output: 
  pdf_document:
    number_sections: yes
    toc: yes
    keep_md: true
urlcolor: blue
---



# Introduction

You might have observed that some commands showed up in our last tutorial:

1. mutate()
1. anti_join()
1. count()
1. arrange()

Each of these commands (and many others, there is an cheatsheet for you) is loaded as we execute `library(dplyr)`. `dplyr` is part of the [`tidyverse`](https://www.tidyverse.org/) collection of packages for data science. They make the task to manipulate data easier than if we were using ordinary R commands. `dplyr` is usually referred as 'a grammar of data manipulation'. 

However, please, keep in mind that every task in R might be performed in different ways, using different commands or packages. 

We will discuss here some of the packages utilities, not all. If you need further information, please refer to the [`dplyr` website](https://dplyr.tidyverse.org/) or to the readme at [CRAN](https://cran.r-project.org/web/packages/dplyr/index.html). Remember that after loading the package, you can always type ?+command to get further information. 

# Using dplyr
## Loading the package

We load the package using the following command:


```r
library(dplyr)
```




























