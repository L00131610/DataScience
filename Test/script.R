# x = 2
x <- 2
y <- 5

#show the contents of x
x
y

z <- 22.3
z

a <- b <- 8
x <- a + b
x

#remove the variable 
rm(a)
a

#what is the data type of the data
class(z)

#test if it is numeric
is.numeric(b)

#test if integer
is.integer(z)

xChar <- "hello"
xChar

#lengh
nchar(xChar)

#nchar does not work on factor data

#dates are in america format  = 8 March 2018
date1 <- "2018-03-08"
date1

#times
date2 <- as.POSIXct("2018-03-08")
class(date2)

#logical
k <- TRUE
class(k)


vectorX <- c(10.1, 150, 2, 3, 55)
vectorX

class(vectorX)

1 / vectorX

vectorY <- c(vectorX, vectorX, 1, 2, 3)
vectorY

#Install Swirl
install.packages("swirl")

library(swirl)
install_course_zip("c:/swirl_courses-master.zip", multi = TRUE, which_course = "R Programming")

swirl()



x <- c(10.4, 5.6, 3.1, 6.4, 21.7)


y <- c(x, 0, x)

z <- 2 * x + y + 1

z


z <- c(1:3, NA)
result <- is.na(z)

result


vec1 <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Hurling", "Basketball", "Tennis", "Cricket", "Lacrosse")
vec2 <- c("Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")

vec2 <- c(vec2,vec1)
vec2

vec2_factor <- as.factor(vec2)
vec2_factor

x <- c(34, 56, 87, NA, 4, 77, NA, 21, NA, 39)

sum(is.na(x))
#count(is.na(x))

length(is.na(x))

y <- is.na(x)
y

y * 1

a <- c(1, 2, 4, 5, 6)
b <- c(3, 2, 4, 1, 9)

cbind(a, b)

rbind(a, b)

###################################
#  Coding Techniques
###################################

#Import the diabetes data available on Blackboard called diabetes - md into a new data frame called my_data.
my_data = read.csv("Diabetes-md.csv", header = TRUE)

str(my_data)             #structure
class(my_data)

cnames <- c( "Date", "Country", "Gender", "Age", "q1", "q2", "q3", "q4", "q5")
dates <- c("10/15/2018", "01/11/2018", "10/21/2018", "10/28/2018", "05/01/2018")
country <- c("US", "US", "IRL", "IRL", "IRL")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

my_data <- data.frame(dates, country, gender, age, q1, q2, q3, q4, q5)

colnames(my_data) <- cnames

my_data

head(my_data, 2)            #show the first 2 rows

str(my_data)

my_data$Age[my_data$Age == 99] <- NA #re-code to be NA because 99 is wrong

my_data

# Categories fro age, put in a new column
my_data$AgeCat[my_data$Age >= 45] <- "Elder"

my_data$AgeCat[my_data$Age >= 26 && my_data$Age <= 44] <- "Middle Aged"

my_data$AgeCat[my_data$Age < 26] <- "Young"

my_data$AgeCat[is.na(my_data$Age)] <- "TEstr"

# order 

AgeCat <- factor(my_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

AgeCat

my_data$AgeCat <- AgeCat

my_data$AgeCat


summary_col <- my_data$q1 + my_data$q2 + my_data$q3 + my_data$q4 + my_data$q4

summary_col

# new column
my_data <- data.frame(my_data, summary_col)
my_data

date_format <- "%b %d %Y"
today <- Sys.Date()

output_date <- format(today, format = date_format)
output_date

#Display date difference
startdate <- as.Date("1994-05-01")
enddate <- as.Date("2018-03-21")
days <- enddate - startdate
days

#show from dob to now
today <- Sys.Date()
dob <- as.Date("1968-04-26")

diff_dates <- difftime(today, dob, units = "weeks")

diff_dates

#Sorting data by age
my_data
new_data <- my_data[order(my_data$Age),]
new_data

#Multiple Sort
attach(my_data)
str(my_data$Age)
str(my_data$Gender)
new_data <- my_data[order(Gender,Age),]
new_data

# remove rows that contain NA
new_data <- na.omit(my_data)
new_data

# count all missing rows
new_data <- !complete.cases(my_data)
new_data
count_missing_rows = sum(new_data)
count_missing_rows

# show all that don't have missing values
complete_data <- my_data[complete.cases(my_data),]
complete_data

# show all that do have missing values
incomplete_data <- my_data[!complete.cases(my_data),]
incomplete_data

# mean of complete  values in Age attribute
my_data
attach(my_data)
my_mean = mean(!is.na(my_data$Age))
my_mean

#Swirl

#library(swirl)
#swirl()
my_data
my_data$Date <- as.Date(my_data$Date, "%m/%d/%Y")
startdate <- as.Date("2018-01-01")
enddate <- as.Date("2018-01-31")

new_data <- my_data[which(my_data$Date >= startdate & my_data$Date <= enddate),]
new_data

#drop attributes

#create a subset

attach(my_data)

my_data

str(my_data)



new_data <- subset(my_data, Age >= 35 | Age < 24, select = c(q1, q2, q3, q4))

# show all attributes between Gender adn Q4 where Male and over 25
new_data <- subset(my_data, Gender == 'M' & Age > 25, select = c(Gender:q4))

new_data

#select a random sample

my_sample <- my_data[sample(1:nrow(my_data), 3, replace = FALSE),]
my_sample

library(swirl)

swirl()


#Functions
asdf = 3
add_two_Number <- function(x, y, no3 = 10)
{
    result <- x + y + no3

    for (numbers in number_collection) {

    }

    while (TRUE) {

    }

    return(result)

}

result <- add_two_Number(3, 4)
result


postcode_data <- NULL

str(postcode_data)

postcode_data <- data.frame(read.csv("NIPostcodes.csv", header = FALSE,
na.strings = c("", "NA", " ", ".")))

str(postcode_data)

head(postcode_data, 10)

library(swirl)
install_course_zip("c:/swirl_courses-master.zip", multi = TRUE, which_course = "Statistical Inference")

install_course_zip("c:/swirl_courses-master.zip", multi = TRUE, which_course = "Open Intro")

swirl()

install.packages("pwr")
library(pwr)
###########################################
# Power Analysis H0: mean <> 0.5. H1: mean > 0.5
###########################################

# p1 is alternative hypothesis - p2 is null hypothesis

power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.50), sig.level = 0.01, power = 0.80)
power_changes

power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.50), sig.level = 0.01, n = 40)
power_changes

plot(power_changes)

power_changes

#?pwr.p.test

#?pwr.t.test


power_changes <- pwr.p.test(h = ES.h(p1 = 0.65, p2 = 0.50), sig.level = 0.05, power = 0.80)
power_changes
plot(power_changes)

? cohen.ES

test <- ES.h(p1 = 0.75, p2 = 0.50)
test

#calculating effect size
effect_size <- cohen.ES(test = "t", size = "medium")
effect_size

other_effect_sizes = c(.2,.5,.8)

power_changes <- pwr.r.test(r = effect_size$effect.size, sig.level = 0.05, power = 0.80)
power_changes
plot(power_changes)

other_effect_sizes = c(.2, .5, .8)
power_changes <- pwr.p.test(h = other_effect_sizes, sig.level = 0.05, n = 20)
power_changes

#student alcohol example
power_changes <- pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.50), sig.level = 0.05, power = 0.8)
power_changes
plot(power_changes)


?pwr.t.test

abc <- pwr.t.test(d = 1, sig.level = 0.05, power = 0.80, type = "two.sample", alternative = "two.sided")

###########################################
# Power Analysis H0: mean <> 0.5. H1: mean > 0.5
# p1 is alternative hypothesis - p2 is null hypothesis
###########################################
install.packages("pwr")
library(pwr)

#abc <- pwr.t.test(d = ES.h(p1 = .9, p2 = .5), sig.level = 0.05, power = 0.80, type = "two.sample")
abc <- pwr.t.test(d = .8, sig.level = 0.05, power = 0.80, type = "two.sample")
abc
plot(abc)

#above Alternative hypothesis H1 > 0.8 (i.e. a rise of more than 80%
# H1: ? > .8
# H1: ? <= .8


?pwr.t.test
