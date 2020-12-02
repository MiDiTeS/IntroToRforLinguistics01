
# Packages ----------------------------------------------------------------
library(gutenbergr)
library(quanteda)
library(stringi)
library(dplyr)
library(readtext)
library(ggplot2)
# Downloading the book ---------------------------------------------------------
M.0  <- gutenberg_download(54829)

# Pre-processing ---------------------------------------------------------
# Cleaning characters
MP <- M.0 %>% 
  mutate(text=iconv(text, from = "latin1", to = "UTF-8"))
# getting the text
MP <- MP$text
MP <- paste(MP, collapse=" ")
MP.l<-char_tolower(MP)

# Making a character vector of tokens
MP_v <- tokens(MP.l, remove_punct = TRUE) %>% 
  as.character()
total_length <- length(MP_v)


# Some analysis ----------------------------------------------------------

# Marcella's Occurence
length(MP_v[which(MP_v  == "marcella")])

# Total of tokens
ntoken(char_tolower(MP), remove_punct = TRUE)

# Total of types
ntype(char_tolower(MP), remove_punct = TRUE)

# Ten most frequent words and saving it
MP.dfm <- dfm(MP.l, remove_punct = TRUE)
View (MP.dfm)
textstat_frequency(MP.dfm, n = 10)
MP.WL <- textstat_frequency(MP.dfm)

# Comparing Casmurro's passions

textplot_xray(
  kwic(MP.l, pattern = "marcella"),
  kwic(MP.l, pattern = "virgilia"),
  kwic(MP.l, pattern = "eugenia"))+ 
  ggtitle("Lexical dispersion")

# Plotting a network of words ---------------------------------------

tk.mp <- MP.l%>%
  tokens(remove_punct = TRUE) %>%
  tokens_tolower() %>%
  tokens_remove(pattern = c(stopwords("portuguese"),
                            "é",'á',"capitulo","d","ás","lá","ia"), padding = FALSE)
  
MP.fcm <- fcm(tk.mp, context = "window", tri = FALSE)
top.MP <- names(topfeatures(MP.fcm, 50))
View(top.MP)

fcm_select(MP.fcm, pattern = top.MP) %>%
  textplot_network()








