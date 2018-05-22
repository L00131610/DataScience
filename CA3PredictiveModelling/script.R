

#####################################
# Read in the sales data, and create the data frame
#####################################
sales <- read.csv(header = TRUE, "SalesPerBusinessSector2000to2017.csv"
            , stringsAsFactors = FALSE, na.strings = c("", "NA", " "))

# Create Total Sales Vector from all numeric columns
TotalSales <- colSums(Filter(is.numeric, sales))

TotalSales

df <- as.data.frame(TotalSales)
TotalSales <- df$TotalSales
sales_dataframe <- as.data.frame(TotalSales)

# Create Year Vector
sales_dataframe$Year <- c(2000:2017)
sales_dataframe
str(sales_dataframe)

original_sales_dataframe <- sales_dataframe

original_sales_dataframe

#take a snapshot of variable settings
oldPar <- par(no.readonly = TRUE)

# Plot the total sales from 2000 to 2017
scatter.smooth(x = sales_dataframe$Year, y = sales_dataframe$TotalSales,
    main = "Year ~ Sales", xlab = "Year", ylab = "Sales (Million)")

# BoxPlot - Check for outliers in the sales
boxplot(sales_dataframe$TotalSales)

 #There ar e no outliers


#install.packages("e1071")
library(e1071)
# divide graph area in 2 columns
par(mfrow = c(1, 2))

# density plot for '2007'
plot(density(sales_dataframe$Year), main = "Density Plot: Years", ylab = "Frequency",
    sub = paste("Skewness:", round(e1071::skewness(sales_dataframe$Year), 2)))

polygon(density(sales_dataframe$Year), col = "red")

# density plot for Total Sales
plot(density(sales_dataframe$TotalSales), main = "Density Plot: Total Sales", ylab = "Frequency",
    sub = paste("Skewness:", round(e1071::skewness(sales_dataframe$TotalSales), 2)))

polygon(density(sales_dataframe$TotalSales), col = "blue")


# calculate correlation between Year and Total Sales
correlation <- cor(sales_dataframe$Year, sales_dataframe$TotalSales)
print(correlation)

# build linear regression model on full data
linearMod <- lm(TotalSales ~ Year, data = sales_dataframe)

# build polynomial linear model on full data
polynomial_regression_model <- lm(TotalSales ~ Year + I(Year ^ 2), data = sales_dataframe)

# Evaluates goodness of fit fo models 
AIC(linearMod)
BIC(linearMod)
AIC(polynomial_regression_model)
BIC(polynomial_regression_model)


# Remove a random  3 rows because we currently have 18
# and we want 15 rows for an 80%-20% split (i.e. 12 - 3)
sales_dataframe <- sales_dataframe[sample(nrow(sales_dataframe), 15),]

# sample chooses a random sample
# from 1:all records from sales_dataframe, 80% of rows
records_for_training <- sample(1:nrow(sales_dataframe), 0.8 * nrow(sales_dataframe))
print(records_for_training)

# model training data
training_data <- sales_dataframe[records_for_training,]
# test data
testing_data <- sales_dataframe[-records_for_training,]

# Build the model on training data
polynomial_r_model <- lm(TotalSales ~ Year + I(Year ^ 2), data = training_data)

summary(polynomial_r_model)

# predict sales from testing data
sales_predicted <- predict(polynomial_r_model, testing_data)
sales_predicted

# compare the actual sales with the predicated sales
actuals_preds <- data.frame(cbind(actuals = testing_data$TotalSales, predicted = sales_predicted))
actuals_preds

#Calculate the co-relation accuracy
correlation_accuracy <- cor(actuals_preds)
correlation_accuracy


#restore setting
par(oldPar)

# Predict for next three years
TotalSales <- c(0,0,0)
futureSales <- as.data.frame(TotalSales)
futureSales$Year <- c(2018:2020)

futuresales_predicted <- predict(polynomial_r_model, futureSales)
futuresales_predicted

# Create a new predicted sales dataframe
# and append it to the original dataframe
# so that it can be plotted
TotalSales <- futuresales_predicted
predicted_sales_dataframe <- as.data.frame(TotalSales)
predicted_sales_dataframe$Year <- c(2018:2020)

originalandpredicted_sales <- rbind(original_sales_dataframe, predicted_sales_dataframe)

scatter.smooth(x = originalandpredicted_sales$Year, y = originalandpredicted_sales$TotalSales,
    main = "2000 to 2017 Year ~ Sales. 2018 to 2020 Predictions.",
    xlab = "Year", ylab = "Sales (Million)")

# Calculate the Mean Absolute Percentage Error
mape <- mean(abs((actuals_preds$predicted - actuals_preds$actuals)) / actuals_preds$actuals)
mape


#K-Fold Cross validation
library(DAAG)
cvResults <- suppressWarnings(CVlm(data = sales_dataframe, form.lm = TotalSales ~ Year,
m = 5, dots = FALSE, seed = 29, legend.pos = "topleft", printit = FALSE,
main = "Small symbols are predicted values. Larger symbols are actuals."))

fit <- lm(Year ~ TotalSales, data = sales_dataframe)
summary(fit)


