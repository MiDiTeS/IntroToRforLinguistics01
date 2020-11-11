library(wordcloud)
library(RColorBrewer)
library(tm)

setwd('/Users/rll307/Google Drive File Stream/My Drive/Profissional/Pedagogico/UNICAMP/disciplinas/pos/R/lp192/intro_to_R1/Module_3/data/wordcloud')

g1 <-readLines('G1.txt')
elpais <-readLines('elpais.txt')

g1.corpus <- Corpus(VectorSource(g1))
elpais.corpus <- Corpus(VectorSource(elpais))

#lowercase
g1.corpus <- tm_map(g1.corpus, content_transformer(tolower))
elpais.corpus <- tm_map(elpais.corpus, content_transformer(tolower))

# no numbers
g1.corpus <- tm_map(g1.corpus, removeNumbers)
elpais.corpus <- tm_map(elpais.corpus, removeNumbers)

#stopwords
g1.corpus <- tm_map(g1.corpus, removeWords, stopwords("portuguese"))
elpais.corpus <- tm_map(elpais.corpus, removeWords, stopwords("spanish"))

#no space
g1.corpus <- tm_map(g1.corpus, stripWhitespace)
elpais.corpus <- tm_map(elpais.corpus, stripWhitespace)

#no pontuation
g1.corpus <- tm_map(g1.corpus, removePunctuation)
elpais.corpus <- tm_map(elpais.corpus, removePunctuation)

g1.dtm <- TermDocumentMatrix(g1.corpus )
elpais.dtm <- TermDocumentMatrix(elpais.corpus )

g1.m <- as.matrix(g1.dtm)
elpais.m <- as.matrix(elpais.dtm)

g1.v <- sort(rowSums(g1.m),decreasing=TRUE)
elpais.v <- sort(rowSums(elpais.m),decreasing=TRUE)

g1.df <- data.frame(word = names(g1.v ),freq=g1.v)
g1.df<- g1.df[-5,]

elpais.df <- data.frame(word = names(elpais.v ),freq=elpais.v)
elpais.df <- elpais.df[-11,]

set.seed(1234)
wordcloud(words = g1.df$word, freq = g1.df$freq, min.freq = 3,
          max.words=100, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

wordcloud(words = elpais.df$word, freq = elpais.df$freq, min.freq = 3,
          max.words=100, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))











