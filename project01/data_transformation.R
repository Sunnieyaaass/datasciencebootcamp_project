#tidyverse
#download library
library(tidyverse)

#print column's name, type of data , number rows & coloumns in the data
glimpse(mtcars)

#show information on the first 6 rows
head(mtcars)

#show information on the last 6 rows
tail(mtcars)

#determine how many row you need to print
head(mtcars, 3)
tail(mtcars, 2)

  #dplyr => data transformation
# 1. select
# 2. filter
# 3. mutate
# 4. arrange
# 5. summarise + group_by

#select columns
select(mtcars, mpg, hp, wt)

#example how we can select the column by select() function
select(mtcars, contains("a")) #select all column's name that contains "a" syllable 
select(mtcars, starts_with("a")) #select all column's name that starts with "a" syllable 
select(mtcars, ends_with("p")) #select all column's name that ends with "p" syllable 
select(mtcars, 1,3,5) #select columns where position is 1,3,5 of the table
select(mtcars, 1:5, am) #select columns where position is from 1 to 5 of the table and column's name "am"
select(mtcars, mpg:disp) #select all column's name from "mpg" to "disp"

#%>% Operator
#Data pipeline in R
#filter function
#select column mpg, hp, wt from mtcars and filter where mpg greater than 30 and hp greater than 100 and print out only row name
mtcars %>% 
  select(mpg, hp, wt) %>%
  filter(mpg > 30 & hp > 100) %>%
  rownames()

#select column mpg, hp, wt, am from mtcars and filter where mpg greater than 30 and am = 1
mtcars %>% 
  select(mpg, hp, wt, am) %>%
  filter(mpg > 30 & am == 1) 

mtcars %>% 
  select(mpg, hp, wt, am) %>%
  filter(mpg > 30 | am == 1) %>%
  filter(mpg < 20 )

#filter model names
#filter model names starts with "Me"
mtcars %>% 
  select(model, mpg, hp, wt) %>%
  filter(grepl ("^Me", model))

#filter model names ends with n
mtcars %>% 
  select(model, mpg, hp, wt) %>%
  filter(grepl ("n$", model))

#mutate function
#we use mutate to create new column
#print only first 6 rows of row names
mtcars %>% 
  head() %>%
  rownames()

#use select to set a new column's name
#select row name as a column and set a new name for rowname = model, mpg = milePerGallon, hp = horsePower, wt = weight and print only first 6 rows
mtcars %>%
  rownames_to_column() %>%
  select(model = rowname,
         milePerGallon = mpg,
         horsePower = hp,
         weight = wt) %>%
  head()

#use rename() function to create new column's name ( rowname to model )
mtcars <- mtcars %>%
  rownames_to_column() %>%
  rename(model = rowname)


#mutate create new column
df <- mtcars %>%
  select(model, mpg, hp) %>%
  head() %>%
  mutate(mpg_double = mpg*2,
         mpg_log = log(mpg),
         hp_double = hp*2 )

#create label
#ifelse am = 0 print "Auto", else print "Manual"
# am (0 = auto, 1 = manual)
mtcars <- mtcars %>% 
  mutate( am = ifelse(am==0, "Auto", "Manual"))


# arrange sort data
#sorting mpg column in descending order
mtcars %>%
  select(model, mpg, am) %>%
  arrange(desc(mpg)) %>%
  head(10)

mtcars %>%
  select(model, am, mpg) %>%
  arrange(am, desc(mpg)) 

#create dataframe from scratch
df <- data.frame(
  id = 1:5,
  country = c("Thailand", "Korea", "Japan", "USA", "Norway")
)

#create new column with case_when
#country where is in "Thailand", "Korea","Japan" as a Asia region, country = USA as America region, TRUE = the rest as other region
df %>% 
  mutate(region = case_when(
    country %in% c("Thailand", "Korea","Japan") ~ "Asia",
    country == "USA" ~ "America",
    TRUE ~ "Other Regions" #or using .default = "Regions"
  ))

df2 <- data.frame(id = 6:8,
                  country = c("Germany", "Italy", "Sweden"))

full_df <- df %>% bind_rows(df2)                  

df3 <- data.frame(id = 9:10,
                  country = c("Canada", "Greece"))

#combine all data.frame with bind_rows
df %>% 
  bind_rows(df2) %>%
  bind_rows(df3)

#use list function as a setlist of data
list_df <- list(df,df2,df3)

#we can combine list with bind row too
bind_rows(list_df)

#case when in R
full_df %>%
  mutate(region = case_when(
    country %in% c("Thaialnd", "Korea", "Japan") ~ "Asia",
    country %in% c("Canada","USA") ~ "America",
    TRUE ~ "Europe"
  ))

# case when in SQL
sqldf("select * ,case 
            when country in ('USA', 'Canada') then 'America'
            when country in ('Thailand', 'Japan', 'Korea') then 'Asia'
            else 'Europe'
            end as region
            from full_df 
      ")


#summarise + group_by
result <- mtcars %>% 
  mutate(vs = ifelse(vs==0, "v-shaped", "straight")) %>%
  group_by(am, vs) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            min_mpg = min(mpg),
            max_mpg = max(mpg),
            n = n())

#save as csv file
write_csv(result, "result.csv")

#loading a csv file
read_csv("result.csv")

