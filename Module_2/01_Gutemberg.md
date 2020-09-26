---
title: "Gutember Analysis"
author: "| Rodrigo Esteves de Lima-Lopes \n| State University of Campinas \n| rll307@unicamp.br\n"
output: 
  pdf_document:
    number_sections: yes
    toc: yes
    keep_md: true
---



# Our first analyss

## Packages
We will work with a classic work by Machado de Assis scraped from [Gutemberg Project's] (https://www.gutenberg.org/) website. This project is responsible for making books that are in  *public domain* available in all languages. There are packages in R that allow us to do this kind of scrapping automatically.

First we will download and install **gutenbergr** and a few others. There are two ways to do this, one is by the command line, the other is by the Rstudio package administrator. Here I will show both.

## Checking the packages

First of all we will try to load all packages and see if it throws an error:


```r
library(gutenbergr)
```

```
## Error in library(gutenbergr): there is no package called 'gutenbergr'
```

```r
library(ggplot2)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidytext)
```

As you see I got an error: `Show in New WindowClear OutputExpand/Collapse Output Error in library(gutenbergr): there is no package called ‘gutenbergr’`. It means that the package `gutenbergr` is not installed. 

### Install using your IDE

For installing the package using you IDE support, you will have to look for the tab `packages`. Then you click on it. You will see a list of your system's packages, the ones with the *tick* are loaded. To load a package from IDE with no code, just *tick* package. To install a package, click on install packages, type the name of the package and the IDE will do the job for you. Please, do not forget to choose *install dependencies*, so everything runs smoothly. The images bellow show the process. 


\begin{center}
\includegraphics{./images/01}
\end{center}

\begin{figure}
\includegraphics[width=0.5\linewidth]{./images/02} \caption{Screen 02}\label{fig:unnamed-chunk-2}
\end{figure}




































