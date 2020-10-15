#1. Building the matrix

##Column names
column.names <- paste0(rep("col.", 20),1:20)
View(column.names)

##Column Rows
row.names <- paste0(rep("row.", 25),seq(1,25,1))
View(row.names)

## Matrix (no names yet)

# 1
my.matrix <- matrix(1:500, nrow = 25, byrow = TRUE)
# 2
my.matrix <- matrix(seq(1,500,1), nrow = 25, byrow = TRUE)

#3
number.02<-seq(1,500,1)
my.matrix<- matrix(number.02,nrow = 25, byrow = TRUE)

## Renaming
colnames(my.matrix)<-column.names
rownames(my.matrix) <- row.names 
View(my.matrix)

## 5 operations
op1<-my.matrix[1,1]+my.matrix[15,6]
op1

op2<-my.matrix[2,12]-my.matrix[14,14]
op2

op3<-my.matrix[12,12]*my.matrix[15,20]
op3

op4<-my.matrix[25,3]^my.matrix[2,2]
op4

op5<-my.matrix[25,3]/my.matrix[2,20]
op5

# Bonus
op5 <-round(op5,2)
op5




























