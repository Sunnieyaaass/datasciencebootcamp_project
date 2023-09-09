library(tidyverse)
library(sqldf)
library(glue)

#print column's name, type of data , number rows & coloumns in the data
glimpse(mtcars)

#show information on the first 6 rows
head(mtcars)

#show information on the last 6 rows
tail(mtcars)

#determine how many row you need to print
head(mtcars, 3)
tail(mtcars, 2)

# sql 
#run sql query with R
sqldf("select * from mtcars
      where mpg > 30")

df <- sqldf("select mpg, wt,hp 
      from mtcars
      where wt < 2")

sqldf("select avg(mpg), sum(mpg)
      from mtcars")

sqldf("select am,avg(mpg), sum(mpg)
      from mtcars group by am")

#glue 
#string template

my_name <- "Kim"
my_age <- 34
birthdate <- as.Date("1989-03-09")

glue("Hello my name is Kim")

glue("Hello my name is {my_name}, and I'm {my_age} years old.",
     " My age next year is {my_age + 1} years old.")

paste("Hello my name is", my_name)
paste("I'm", my_age, "years old")
