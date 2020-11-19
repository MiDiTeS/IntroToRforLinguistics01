#Corpus list
corpus.list <- function(my.files, input.dir){
  #Creates an empty list 
  corpus.list <- list()
  # loop over the files
  for(i in 1:length(my.files)){
    # read the file in,  we need to know the input directory
    text.v <- scan(paste(input.dir, my.files[i], sep="/"),
                   what="character", sep="\n")
    #convert to single string
    text.v <- paste(text.v, collapse=" ")
    #lowercase and split on non-word characters
    text.lower.v <- tolower(text.v)
    text.words.v <- strsplit(text.lower.v, "\\W")
    text.words.v <- unlist(text.words.v)
    #remove the blanks
    text.words.v <- text.words.v[which(text.words.v!="")]
    #use the index id from the my.files vector as the "name" in the list
    corpus.list[[my.files[i]]] <- text.words.v
  }
  return(corpus.list)
}

#File listing
file.listing <- function(dir){
  for(i in 1:length(dir)){
    cat(i, dir[i], "\n", sep=" ")
  }
}









