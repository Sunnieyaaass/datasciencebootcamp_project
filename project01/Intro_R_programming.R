#working in posit Cloud Web browser
#basic calculation
5%%2 
log(5) 
exp(2)
2^5
2**5
abs(-20)

#check working directory 
getwd()

#basic knowledge in r programming
# 1. variable
# 2. data types
# 3. data structures
# 4. control flow
# 5. function

#create variable
income <- 28000
income * 1.1
expense <- 19500
saving <- income - expense
saving #print saving variable

#remove variable
rm(saving)
rm(expense)
rm(income)

#data types
# numeric, character(text)
# date, logical ( TRUE,FALSE)

my_age <- 28
my_name <- "Sun"
movie_lover <- TRUE

#check data type by class or is.datatype function
class(my_name) #character
class(my_age) #numeric
class(movie_lover) #logical

is.numeric(my_age)
is.character(my_name)
is.character(my_age)

#YYYY-MM-DD
wantee <- "2023-02-17"
class(wantee) #character since numeric in " "
wantee <- as.Date(wantee) #convert to date data type 
class(wantee) #date

