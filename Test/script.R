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


? pwr.t.test

###########################################
#dplyr
###########################################

swirl::install_course()

library(swirl)

data(diamonds, package = "ggplot2")
dim(diamonds)

dim(head(diamonds, 4))

# do above using pipes
diamonds %>% head(4) %>% dim

x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)
round(exp(diff(log(x))), 1)

# pipes work backwards
x %>% log %>% diff %>% exp %>% round(1)

#install dplyr()

head(diamonds, 5)

select(diamonds, carat, price)

diamonds %>% select(c(carat, price))

my_attributes <- c('carat', 'price')
select(diamonds, one_of(my_attributes))

str(diamonds)
head(diamonds, 5)

slice(diamonds, c(1:5, 8, 15:20))

diamonds %>% slice(c(1:5, 8, 15:20))

set <- select(diamonds, carat, price)
mutate(set, ratio = price / carat)
head(ratio, 5)

diamonds %>% select(carat, price) %>% mutate(ratio = price / carat, double = ratio * 2)

summarise(diamonds, AvgPrice = mean(price), MedianPrice = median(price), AvgCarat = mean(carat))

diamonds %>% group_by(cut) %>% summarise(AvgPrice = mean(price))

# arrange() is a sort
diamonds %>% group_by(cut, color) %>% summarise(AvgPrice = mean(price)) %>% arrange(AvgPrice)

lotto_data = data.frame(read.csv("C:/Users/Owner/Documents/DataScience/Lotto/Lotto/1999.csv", header = TRUE, na.strings = c("", "NA", " ")))
head(lotto_data, 5)

lotto_data %>% group_by(a)

lotto_data %>% group_by(a, b, c, d, e, f) %>% summarise()


#list all the csv files
csv_file_list <- list.files(path = "C:/Lotto", pattern = "*.csv")

csv_file_list

combine_results <- function(csv_file_list) {

    return_data <- NULL

    for (item in csv_file_list) {

        item <- paste("C:/Lotto/", item, sep = "")
        my_data <- data.frame(read.csv(item, header = TRUE, stringsAsFactors = FALSE, na.strings = c("", "NA", " ")))

        data_of_interest <- my_data[2:9]

        return_data <- rbind(return_data, data_of_interest)
    }

    return(return_data)
}

my_data <- combine_results(csv_file_list)

str(my_data)

nrow(my_data)

tail(my_data, 10)

lotto_data <- my_data

lotto_data %>% summarise(AvgPrice = mean(a))
lotto_data %>% summarise(AvgPrice = mean(b))
lotto_data %>% summarise(AvgPrice = mean(c))
lotto_data %>% summarise(AvgPrice = mean(d))

lotto_data %>% summarise(AvgPrice = mean(e))
lotto_data %>% summarise(AvgPrice = mean(f))
lotto_data %>% summarise(AvgBonus = mean(Bonus))

lotto_data %>% group_by(Bonus) %>% summarise(AvgBonus = mean(Bonus)) %>% arrange(AvgBonus)

plot(lotto_data$Bonus)


####################################################################

#Install Swirl
install.packages("hflights")

library(hflights)

head(hflights)


########################################################################graf


Dose <- c(20, 30, 40, 45, 60)
DrugA <- c(16, 20, 27, 40, 60)
DrugB <- c(15, 18, 25, 31, 40)

drugs <- data.frame(Dose, DrugA, DrugB)

plot(drugs)

#type = 0 is blue dot

plot(drugs$Dose, type = "o", col = "blue")

plot(drugs$Dose, type = "b", col = "blue")

# Dose on x, DrugA on y 
plot(drugs$Dose, drugs$DrugA, type = "b", col = "blue")

#take a snapshot of variable settings
oldPar <- par(no.readonly = TRUE)


plot(Dose, DrugA, type = "b", lty = 2, pch = 17, col = "blue")
par(new = TRUE)
plot(Dose, DrugB, type = "b")

par(oldPar)

plot(Dose, DrugA, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2, ylim = c(0, 100))
title(main = "Drug dosage", col.main = "blue", font.main = 4)
lines(Dose, DrugB, type = "o", pch = 22, lty = 2, col = "red")

# Start at 0 and get the biggest
graph_range <- range(0, DrugA, DrugB)
graph_range

#turn off axes annotation
plot(DrugA, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2, ylim = graph_range, axes = FALSE, xlab = "Mililitres")
lines(DrugB, type = "o", pch = 22, lty = 2, col = "red")

#Now cerate a new x axis with ml labels
axis(1, at = 1:5, lab = c("20 ml", "40 ml", "60 ml", "80 ml", "100 ml"))

axis(2, las = 1, at = 5 * 0:graph_range[2])

box(lty = "solid")


#####################################
# Predicting 
#####################################

#Install Swirl
#install.packages("c")

# Load up car library
library(car)

scatter.smooth(x = cars$speed, y = cars$dist, main = "Dist ~ Speed")

# BoxPlot - Check for outliers
boxplot(cars$speed)
boxplot(cars$dist)


install.packages("e1071")
library(e1071)

nrow(cars)

par(mfrow = c(1, 2))

#Regression analysis
#asscess Skewness
#If it's a bell curve then it's good for linear regression

plot(density(cars$speed), main = "Density Plot: Speed", ylab = "Frequency",
    sub = paste("Skewness:", round(e1071::skewness(cars$speed), 2)))

# Fill with red
polygon(density(cars$speed), col = "red")

plot(density(cars$dist), main = "Density Plot: Distance", ylab = "Frequency",
    sub = paste("Skewness:", round(e1071::skewness(cars$dist), 2)))

# Fill with red
polygon(density(cars$dist), col = "red")

# calculate correlatin between speed and distance
cor(cars$speed, cars$dist)
# .8 means a positive correlation

#build linear regression model on full data
linearMod <- lm(dist ~ speed, data = cars)
print(linearMod)

#model summary
# note * is a good indicator, after running the summary(linearMod)
summary(linearMod)

# FOR MODEL COMPARISON, THE MODEL WITH THE LOWEST AIC AND BIC SCORE IS PREFERRED
# Evaluates goodness of fit fo models 
AIC(linearMod)
BIC(linearMod)

# sample 80%
no_of_records <- sample(1:nrow(cars), 0.8 * nrow(cars))

#model training data
training_data <- cars[no_of_records,]

# test data
test_data <- cars[-no_of_records,]

nrow(test_data)
nrow(training_data)

training_data
test_data

# Build the model on training data
lr_model <- lm(dist ~ speed, data = training_data)

summary(lr_model)

# predict distance from testing data
dist_predicted <- predict(lr_model, test_data)
dist_predicted


# make actual prediction
actuals_prediction <- data.frame(cbind(actuals = test_data$dist, predicted = dist_predicted))
head(actuals_prediction)

actuals_prediction

#correlation accuracy
correlation_accuracy <- cor(actuals_prediction)
correlation_accuracy

# min max accuracy
min_max_accuracy <- mean(apply(actuals_prediction, 1, min) / apply(actuals_prediction, 1, max))
min_max_accuracy

#MAPE
mape <- mean(abs((actuals_prediction$predicted - actuals_prediction$actuals)) / actuals_prediction$actuals)
mape


#k fold cross validation
install.packages("DAAG")
library(DAAG)

cvResults <- suppressWarnings(CVlm(data = cars, form.lm = dist ~ speed, m = 5,
dots = FALSE, seed = 29, legend.pos = "topleft", printit = FALSE,
main = "Small symbos are predicted values while bigger ones are actuals."))

summary(cvResults)


# Arima Modelling
ts_data <- EuStockMarkets[, 1]
opar <- par()

par(mfrow = c(1, 2))

decomposed_result <- decompose(ts_data, type = "mult")

plot(decomposed_result)

decomposed_result <- decompose(ts_data, type = "additive")
plot(decomposed_result)

seasonal_trend_error <- stl(ts_data, s.window = "periodic")
par <- opar

#Examine first few rows of time series
seasonal_trend_error$time.series

#lag 3 - 3 periods back
lagged_ts <- lag(ts_data, 3)
lagged_ts

install.packages("DataCombine")
library(DataCombine)

my_dataframe <- as.data.frame(ts_data)

#create lag1 variable
my_dataframe <- slide(my_dataframe, "x", NewVar = "xLag1", slideBy = -1)

#create lead 1 variable
my_dataframe <- slide(my_dataframe, "x", NewVar = "xLead1", slideBy = 1)

head(my_dataframe)

# acf generates chart by default
acf_res <- acf(AirPassengers)

# partial autocorrelation
pacf_res <- pacf(AirPassengers)


# de-trend a time series

plot(JohnsonJohnson)

trained_model <- lm(JohnsonJohnson ~ c(1:length(JohnsonJohnson)))

plot(resid(trained_model), type = "l")

# De-compose the Time series using forecast::stl()
install.packages("forecast")
library(forecast)

ts_decompose <- stl(AirPassengers, "periodic")

ts_seasonal_adjust <- seasadj(ts_decompose)

plot(AirPassengers, type = "l")

plot(ts_seasonal_adjust, type = "l")


seasonplot(ts_seasonal_adjust, 12, col = rainbow(12), year.labels = TRUE, main = "Seasonal plot: Airpassengers")


# how do we test if a time series is stationary?
library(tseries)

adf.test(ts_data)

kpss.test(ts_data)

#Season Differencing
nsdiffs(AirPassengers)

# apply 1
AirPassengers_seasdiff <- diff(AirPassengers, lag = frequency(AirPassengers), differences = 1)
plot(AirPassengers_seasdiff, type = "l", main = "Seasonnally Differenced")

# apply again
nsdiffs(AirPassengers_seasdiff)

AirPassengers_seasdiff2 <- diff(AirPassengers_seasdiff, lag = frequency(AirPassengers_seasdiff), differences = 1)
plot(AirPassengers_seasdiff2, type = "l", main = "2 Seasonnally Differenced")


#Nile dataset
str(Nile)
plot(Nile)
ndiffs(Nile)

d_nile <- diff(Nile)

plot(d_nile)
ndiffs(d_nile)

adf.test(d_nile)

Acf(d_nile)
Pacf(d_nile)

# Fit the ARIMA model
fit <- Arima(Nile, order = c(0, 1, 1))
fit

accuracy(fit)

qqnorm(fit$residuals)
qqline(fit$residuals)

Box.test(fit$residuals, type = "Ljung-Box")

my_forecast <- forecast(fit, 3)

plot(my_forecast)

fit <- auto.arima(Nile)
fit

my_forecast <- forecast(fit, 3)

plot(my_forecast)