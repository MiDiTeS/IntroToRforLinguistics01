library(tm)
library(SnowballC)
library(stats)

boulos.v <- boulos$text

corpus.cluster <- Corpus(VectorSource(boulos.v))

corpus.cluster <- tm_map(corpus.cluster, content_transformer(tolower))



# Functions ---------------------------------------------------------------

removeURL <- function(x) gsub("http[[:alnum:][:punct:]]*", "", x) 
remove.users <-function(x) gsub("@[[:alnum:][:punct:]]*","",x)
colLab <- function(n) {
  if (is.leaf(n)) {
    a <- attributes(n)
    labCol <- labelColors[clusMember[which(names(clusMember) == a$label)]]
    attr(n, "nodePar") <- c(a$nodePar, lab.col = labCol)
  }
  n
}

# Cleaning the corpus -------------------------------------------------------

corpus.cluster <- tm_map(corpus.cluster, content_transformer(removeURL))
corpus.cluster <- tm_map(corpus.cluster,content_transformer(remove.users))
corpus.cluster <- tm_map(corpus.cluster, stripWhitespace)
corpus.cluster <- tm_map(corpus.cluster, removePunctuation)
corpus.cluster <- tm_map(corpus.cluster, function(x)removeWords(x,stopwords("pt")))


# Creating a TDM for the analysis -----------------------------------------

cluster.tdm <- TermDocumentMatrix(corpus.cluster)


# Triming sparce words ----------------------------------------------------
cluster.m <- as.matrix(cluster.tdm)
cluster.wf <- rowSums(cluster.m)
cluster.m1 <- cluster.m[cluster.wf>quantile(cluster.wf,probs=0.99), ]
#removing 0 columns
cluster.m1<-cluster.m1[,colSums(cluster.m1)!=0]

#Binary Relationship
cluster.m1[cluster.m1 > 1] <- 1
cluster.m1dist <- dist(cluster.m1, method="binary")

#Cluster Ward Method
clus1 <- hclust(cluster.m1dist, method="ward.D2")

plot(clus1, cex=0.9)
rect.hclust(clus1,k=10,border = "blue")


### Colourful cluster

dend <- as.dendrogram(clus1)


labelColors <- c("#809acd", "#000000", "#EB6841", "#666666","#80cdb3", 
                "#c5ab8a","#ffa500","#0000ff", "#523415", "#b882ee")
clusMember <- cutree(clus1, 10)


clusDendro <- dendrapply(dend, colLab)

plot(clusDendro,cex=1)
rect.hclust(clusDendro,k=2)


## Some associates

findAssocs(cluster.tdm,"boulos",corlimit = .1)

findAssocs(cluster.tdm,"fake",corlimit = .16)








