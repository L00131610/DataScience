postcode_data <- NULL

str(postcode_data)

postcode_data <- data.frame(read.csv("NIPostcodes.csv", header = FALSE,
na.strings = c("", "NA", " ", ".")))

str(postcode_data)

head(postcode_data, 10)

#Show the total number of missing values.
total_missing_values <- sum(is.na(postcode_data))

total_missing_values

#Show the mean of missing values.
mean_missing_values = mean(is.na(postcode_data))
mean_missing_values


# show all that do not have missing values
complete_postcode_data <- postcode_data[complete.cases(postcode_data),]

head(complete_postcode_data,10)

str(complete_postcode_data)

str(postcode_data)

#Assign attribute titles
colnames(postcode_data) <- c("OrganisationName", "SubBuildingName", 
    "BuildingName", "Number", "PrimaryThorfare", "AltThorfare", 
    "SecondaryThorfare", "Locality", "Townland", "Town", 
    "County", "Postcode", "XCoordinates", "YCoordinates", "PrimaryKey")

str(postcode_data)

head(postcode_data, 10)


# Modify the County attribute to a categorising factor.
County <- factor(postcode_data$County, order = TRUE, levels =
    c("ANTRIM", "ARMAGH", "DOWN", "FERMANAGH", "LONDONDERRY", "TYRONE"))

postcode_data$County <- County

str(postcode_data)

nrow(postcode_data)
ncol(postcode_data)


number_columns <- ncol(postcode_data)

# this will move the last column i.e. number_columns column to the first column.
postcode_data <- postcode_data[, c(number_columns, 1:number_columns - 1)]

head(postcode_data, 10)



#trimws(postcode_data, which = "both")
head(postcode_data, 5)

nrow(postcode_data)


#retval <- subset(postcode_data, SubBuildingName == ".")
#print(nrow(retval))

#countof <- sum(postcode_data$PrimaryThorfare == "GLENMORE PLACE")
#countof

postcode_data[6408, 2]


#format(postcode_data, justify = "left")


number_columns <- ncol(postcode_data)

# this will move the last column i.e. number_columns column to the first column.
#postcode_data <- postcode_data[, c(number_columns, 1:number_columns - 1)]

head(Limavady_data, 10)

nrow(postcode_data)

# Create a new dataset called Limavady_data.
# Store within it only information that has locality, townland and town
# containing the name “Limavady”. Store this information in an 
# external csv file called Limavady.
Limavady_data <- NULL

str(Limavady_data)

Limavady_data <- subset(postcode_data, Locality == "LIMAVADY"
    | Town == "LIMAVADY" | Townland == "LIMAVADY", replace = FALSE)

nrow(Limavady_data)
nrow(postcode_data)

write.csv(Limavady_data, file = "Limavady.csv", row.names = FALSE, na = "")

head(Limavady_data, 10)

str(Limavady_data)

#Save the modified dataset in a csv file called CleanNIPostcodeData.
write.csv(postcode_data, file = "CleanNIPostcodeData.csv", row.names = FALSE, na = "")

str(postcode_data)

head(postcode_data, 10)

abcd <- format.data.frame(postcode_data, format="left")
abcd <- head(abcd, 10)

abcd

# Left Align Columns and Data
left_aligned <- print(head(postcode_data, 10), right = FALSE, row.names = TRUE)

str(postcode_data)

left_aligned