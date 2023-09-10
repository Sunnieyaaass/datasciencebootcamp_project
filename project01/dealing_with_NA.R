# missing value
# NA ( Not available)

v1 <- c(5,10,15,NA,25)

#checking missing value with is.na()
is.na(v1)

#load mtcars data
data("mtcars")

#create NA to mtcars 
mtcars [5,1] <- NA

#filter na value
mtcars %>% 
  filter(is.na(mpg))

# ! = revert value
# ! means not select
mtcars %>% 
  select(mpg, hp, wt) %>%
  filter(! is.na(mpg))
  
  
#replace missing value
mtcars %>% 
  summarise(avg_mpg = mean(mpg))

#remove missing value and find average value with na.rm function
mtcars %>%
  summarise(avg_mpg = mean(mpg, na.rm = TRUE))

#remove NA by non-selected with ! (not select)
mtcars %>% 
  filter(!is.na(mpg)) %>%
  summarise(avg_mpg = mean(mpg))

#cannot find average value if there is any NA 
mtcars %>% 
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg))

#replace missing value with mean value
#pull only value exclude column name with pull() function
mtcars %>% 
  summarise(mean(mpg, na.rm = T))

#pull() is similar to $ >> pull(.data, var = -1, name = NULL, ...) and save in mean_mpg
mean_mpg <- mtcars %>% 
  summarise(mean(mpg, na.rm = T)) %>%
  pull()

mtcars %>% 
  select(mpg) %>%
  mutate(mpg2 = replace_na(mpg, mean_mpg) )
 
