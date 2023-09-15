#r is case sensitive 
print(
  "hello world"
)

# data structure
# 1. vector 
# 2. matrix
# 3. list
# 4. dataframe

#vector collect only one data type
friends <- c("taeyeon", "jisoo", "jennie", "rose", "lisa")
length(friends) #check how many data in friends
friends #print variable in friends
friends[1] #pull the data from the first position -> taeyeon

#sub-setting, indexing
friends[length(friends)] #length = 5 -> lisa
friends[5]  #print the value in 5th position which is lisa here
friends[1:3] #print value's position from 1-3
friends[c(1,3,5)] #print value's position 1,3,5

#replace value
friends[1] <- "ditto" #replace ditto in 1st position
friends[2] <- "hype boy" #replace hype boy in 2nd position
friends[1:2] <- c("born pink","pink venom") #replace "born pink","pink venom" in 1-2 position

#check position 
friends == "rose" #the result will be FALSE FALSE FALSE  TRUE FALSE
which(friends == "rose") #the result is 4
rose_index <- which(df$friend == "ROSE")
df[rose_index, "friend"] <- "rose"

#matrix, vector 2 dimension
#?matrix, help(matrix) #check how to use function

#create matrix from 1:10 , 2 columns ,count by row
m <- matrix(1:10, ncol = 2, byrow = TRUE)
     [,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
[4,]    7    8
[5,]    9   10

m*2
     [,1] [,2]
[1,]    2    4
[2,]    6    8
[3,]   10   12
[4,]   14   16
[5,]   18   20

#start counting from 5 & jump by 5 from 5 to 100
seq(5,100, 5)
 [1]   5  10  15  20  25  30  35  40  45  50  55  60  65  70  75  80  85  90  95 100

#element wise computation
#vectorization 

m1 <- matrix(c(5,10,2,4), ncol = 2)
m2 <- matrix(c(1,2,5,5), ncol = 2)

> m1
     [,1] [,2]
[1,]    5    2
[2,]   10    4
> m2
     [,1] [,2]
[1,]    1    5
[2,]    2    5

m1*m2
     [,1] [,2]
[1,]    5   10
[2,]   20   20

m1 %*% m2 #matrix multiply matrix
     [,1] [,2]
[1,]    9   35
[2,]   18   70

y <- 1:6
y
[1] 1 2 3 4 5 6
#convert to matrix c(row,column)
dim(y) <- c(3,2)
> y
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

#list can collect multiple data types/objects
#key = value
my_playlist <- list(
  fav_movies = c("The Dark Knight", "Marvels"),
  fav_songs = c("Pink Venom", "you!", "lysb"),
  fav_artist = "BlackPink",
  year = 1994,
  movie_lover = TRUE,
  my_fav_matrix = matrix(1:100, ncol = 50)
)
class(my_playlist) #check data type/structure

my_playlist$fav_movies #"The Dark Knight" "Marvels"
my_playlist$fav_artist #"BlackPink"

my_playlist[1] #pull value along with name's list
$fav_movies
[1] "The Dark Knight" "Marvels" 

my_playlist[[1]] #pull only value
[1] "The Dark Knight" "Marvels" 

> my_playlist$fav_songs[2]
[1] "you!"
> my_playlist[[2]][3]
[1] "lysb"
> my_playlist[[2]][2]
[1] "you!"
> my_playlist[[1]][2]
[1] "Marvels"
> my_playlist$fav_movies[2]
[1] "Marvels"

# customer database for our company
customer_01 <- list(
  name = "sun",
  location = "BKK",
  age = 28,
  movies = c("John Wick", "Dark Knight")
)
customer_02 <- list(
  name = "john",
  lname = "wick",
  age = 42,
  movies = "John Wick 4",
  fav_weapon = "A pencil"
)

customer_db <- list(
  sun = customer_01,
  john = customer_02
)

> customer_db$sun$movies
[1] "John Wick"   "Dark Knight"
> customer_db$john$fav_weapon
[1] "A pencil"
> customer_db$sun$movies[2]
[1] "Dark Knight"
> customer_db$sun[[4]][2]
[1] "Dark Knight"


#replace value in movie
customer_db$john$movies <- "John Wick Series 09"
customer_db$john

$name
[1] "john"

$lname
[1] "wick"

$age
[1] 42

$movies
[1] "John Wick Series 09"

$fav_weapon
[1] "A pencil"

> names(customer_db)
[1] "sun"  "john"
> names(customer_db$sun)
[1] "name"     "location" "age"      "movies"  

# dataframe
# table in google sheet/sql database
data() # build in data in R
mtcars
View(mtcars)

#create new dataframe
friends <- c("jisoo", "jennie","rose", "lisa")
ages <- c(27,26,25,25)
movie_lover <- c(T,T,F,F)

#create dataframe the value in each vector should equal
length(friends)
df <- data.frame( id = 1:4,
            friend = friends, 
            age = ages,
            movie_lover = movie_lover)
#view dataframe
View(df)

#alternative approach to create dataframe in R
customer <- list(
  friends = c("John", "David", "Anna"), 
  ages = c(25, 20, 19),
  movie = c(T,T,F)
)

#using function data.frame to create data frame
df2 <- data.frame(customer)
View(df2)

#NULL SQL == Not available (NA) in R
age = c(18, 25, 30, NA, 20)
age
18 25 30 NA 20
is.na(age)
FALSE FALSE FALSE  TRUE FALSE

#T = 1, F = 0
sum(is.na(age))


#sub set
df
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE
3  3     rose  25       FALSE
4  4     lisa  25       FALSE

df$friend
[1] "NewJeans" "jennie"   "rose"     "lisa" 

df[[2]] #double square bracket to select only vector from specific column
[1] "NewJeans" "jennie"   "rose"     "lisa"

df$movie_lover #df[[4]]
TRUE  TRUE FALSE FALSE

df[4] #one square bracket will show as data set view included column's name
  movie_lover
1        TRUE
2        TRUE
3       FALSE
4       FALSE

#pull out every rows but 2 & 3 columns
df[ ,2:3]
    friend age
1 NewJeans  27
2   jennie  26
3     rose  25
4     lisa  25

#pull out every columns but 3 rows
df[1:3, ]
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE
3  3     rose  25       FALSE

df[ ,c(1,3)] #select every row and 1,3 columns
  id age
1  1  27
2  2  26
3  3  25
4  4  25

df[,c("id","friend","movie_lover")]
  id   friend movie_lover
1  1 NewJeans        TRUE
2  2   jennie        TRUE
3  3     rose       FALSE
4  4     lisa       FALSE

df[c(1,4), c(2,4)]
    friend movie_lover
1 NewJeans        TRUE
4     lisa       FALSE

#replace data
df[1,2] <- "NewJeans"
df
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE
3  3     rose  25       FALSE
4  4     lisa  25       FALSE

