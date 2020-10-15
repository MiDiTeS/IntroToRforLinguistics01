#Create a data frame with the name of 10 of your family members of friends following these instructions: 

jazz.names<-c("Miles Davis","Ella Fitzgerald","Thelonious Monk", "Herbie Hancock", "Wynton Marsalis","Sarah Vaughan","Art Blakey","John Coltraine","Chales Parker", "Chet Baker")

ages<-c(94, 103,103,80,58,96,101,94,100,91)

married<-c(TRUE,FALSE, TRUE, TRUE,TRUE,FALSE,FALSE,TRUE,FALSE, FALSE)

birthdays <- c("1926-05-26","1917-04-25","1917-10-1017", "1940-04-12","1961-10-18",'1924-03-27', "1919-10-11","1926-09-23", '1920-08-29', "1929-12-23")

jazz.masters <- data.frame(jazz.names,ages,married,birthdays)

colnames(jazz.masters)<-c("name","age","married","birthdays")

summary(jazz.masters)

jazz.masters$birthdays <-as.Date(jazz.masters$birthdays, format = '%Y-%m-%d')



#Create a new vector with the state they are now
#Create a new vector with the city they are now
#Merge these new vector in the data frame

city<-c('Santa Monica', 'Beverly Hills',"Englewood","Undefined",'New York',"Hidden Hills",'New York','New York','Huntington',"Amsterdam")

states<-c("California", "California",'New Jersey','Undefined','New York',"California",'New York','New York','New York','Netherlands')

#1
jazz.masters$city<-city
jazz.masters$state<-states

#2
jazz.masters<-cbind(jazz.masters,city,states)

















