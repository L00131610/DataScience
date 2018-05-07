###########################################
# Power Analysis H0: mean <> 0.5. H1: mean > 0.5
# p1 is alternative hypothesis - p2 is null hypothesis
###########################################
install.packages("pwr")
library(pwr)

pwr_test <- pwr.t.test(d = .8, sig.level = 0.05, power = 0.80, type = "two.sample")
plot(pwr_test)
pwr_test

sales_data <- read.csv(header = TRUE, "SalesPerBusinessSector2000to2017.csv"
            , stringsAsFactors = FALSE, na.strings = c("", "NA", " "))

str(sales_data)
sales_data

###########################################
# Calculate Percent function which returns the percentage
# of num1 in comparison to num2
###########################################
calculate_Percent <- function(num1, num2) {
    perc <- (num1 / num2) * 100
    return(perc)
}

# get the percentage between 2007 and 2017
percentage_vector <- mapply(calculate_Percent, sales_data$Year_2017, sales_data$Year_2007)
percentage_vector

# get the average percents
average_percent_rise <- mean(percentage_vector) - 100
average_percent_rise

cat("A rise between 2007 and 2017 of", average_percent_rise, "percent")

###########################################
# create a new data frame showing the percentage
# differnece between 2007 and 2017 for each business sector
###########################################
rise2017to2018 <- cbind(sales_data$Business.Sector, percentage_vector)
sortedByRise <- rise2017to2018[order(percentage_vector),]
head(sortedByRise, 5)
tail(sortedByRise, 5)





