# Create a numeric vector from 1 until 100
vector.1 <- 1:100

#Create a numeric vector from 101 until 200
vector.2 <- 101:200

#Create a character vector repeating any word you like 20 times 
vector.3 <-rep("I love my professor/teacher",20)

# Name your numeric vectors, using the proper command
names.1<-paste0(rep("Número-",100),1:100)
names.2<-paste0(rep("Número-",100),101:200)
names(vector.1)<-names.1
names(vector.2)<-names.2

#Sum them and save to a new variable
sum.vectors<-vector.1+vector.2
subtraction.vectors <- vector.2-vector.1

#Exponentiation
exp1<-vector.1^2
exp3<-vector.2^3



















