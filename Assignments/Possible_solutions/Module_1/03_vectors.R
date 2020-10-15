# Create a numeric vector from 1 until 100
# Sequencing using ":"
vector.1 <- 1:100

#Sequencing using seq()
vector.1 <- seq(from=1, to=100, by=1)
View(vector.1)
vector.1 <- seq(1, 100, 1)


#Create a numeric vector from 101 until 200
vector.2 <- 101:200
vector.2 <- seq(from=101, to=200, by=1)
vector.2 <- seq(101, 200, 1)

#Create a character vector repeating any word you like 20 times 
vector.3 <-rep("I love my professor/teacher",20)
View(vector.3)

# Name your numeric vectors, using the proper command
names.1<-paste0(rep("Número-",100),1:100)
names.2<-paste0(rep("Número-",100),seq(101, 200, 1))

names(vector.1)<-names.1
names(vector.2)<-names.2
View(vector.2)

#Sum them and save to a new variable
sum.vectors<-vector.1+vector.2
subtraction.vectors <- vector.2-vector.1
View(subtraction.vectors)


#Exponentiation
exp1<-vector.1^2
exp2<-vector.2^3

View(exp1)
View(exp2)















