#loop over dataframe
data("mtcars")

#apply loop over dataframe -> find mean,sum in every column in mtcars (1 =row, 2 column)
apply(mtcars, 2, mean)
apply(mtcars, 2, sum)

#join dataframe
#standard joins in SQL
# inner, left, right, full join

band_members
band_instruments

left_join(band_members, band_instruments)

left_join(band_members, band_instruments, by="name")

band_members %>% 
  left_join(band_instruments, by = "name")

inner_join(band_members, band_instruments, by="name")

full_join(band_members, band_instruments, by="name")

band_members %>%
  rename(memberName = name) -> band_member2
band_member2

band_member2 %>%
  left_join(band_instruments, by = c("memberName" = "name"))

library(nycflights13)

glimpse(flights)  
View(flights)

flights %>%
  filter( year == 2013 & month == 9 ) %>%
  count(carrier) %>%
  arrange(-n) %>% # desc #n (Aes)
  head(5) %>% #top5
  left_join(airlines, by = "carrier")
