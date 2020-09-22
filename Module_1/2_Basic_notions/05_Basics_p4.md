---
title: "Basic concepts with R (part 4)"
author: "| Rodrigo Esteves de Lima-Lopes \n| State University of Campinas \n| rll307@unicamp.br\n"
output: 
  pdf_document:
    number_sections: yes
    toc: yes
    keep_md: true
---



# Introduction

In this tutorial we will work with data frames. On my little experience using R for language analysis, data frames are probably the most useful data structure. It is also important to say that there is a number of operations on data frames that probably will not be covered in this tutorial, mostly because they are so many, that we will learn them along the way. 

# Data Frames

Data frames are matrices like two-dimensional rectangular structures. However, they bring an important difference: data frame columns do not need to be all of the same data kind. In other words, we cam mix up, numbers, characters, logical, date in a complex table. Naturally there are restrictions, since such a freedom concerns only the kind of data represented within each column. for example, in the table that follows

\begin{table}[H]

\caption{\label{tab:table_1}Demo Dataframe\label{tab:tab01}}
\centering
\begin{tabular}[t]{llllr}
\toprule
Names & Birthdays & Gender & Life Status & Possible Age\\
\midrule
Astolfo & 1907-06-22 & male & FALSE & 113\\
Eleutério & 1987-07-12 & male & TRUE & 33\\
Alarico & 1941-11-10 & male & FALSE & 79\\
Genésia & 1940-11-15 & female & TRUE & 80\\
Gioconda & NA & female & FALSE & 110\\
\addlinespace
Ondina & 1982-06-21 & female & TRUE & 38\\
\bottomrule
\end{tabular}
\end{table}
































