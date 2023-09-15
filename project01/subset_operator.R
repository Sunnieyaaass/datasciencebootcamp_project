#subset 
#and & operator
> df$age < 30
[1] TRUE TRUE TRUE TRUE

> df[df$age < 30, ]
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE
3  3     rose  25       FALSE
4  4     lisa  25       FALSE
df[df$age <= 25, ]
  id friend age movie_lover
3  3   rose  25       FALSE
4  4   lisa  25       FALSE

condition <- df$age < 30 & df$movie_lover
df[condition, ] #select condition from all columns
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE

df[df$movie_lover, ] #select TRUE in movie_lover from all columns
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE

#! means unselect
friend_dontlike_movie <- df[!df$movie_lover, ] 
friend_dontlike_movie
  id friend age movie_lover
3  3   rose  25       FALSE
4  4   lisa  25       FALSE

> T
[1] TRUE
> !T
[1] FALSE

# OR | in R
cond <- df$age >= 28 | df$movie_lover
df[cond, ]
  id   friend age movie_lover
1  1 NewJeans  27        TRUE
2  2   jennie  26        TRUE

#save as csv
write.csv(df, "friends.csv", row.names = FALSE) #not print row's name
df <- read.csv("friends.csv")
View(df)
