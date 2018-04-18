# (a) Using R, amalgamate all of the crime data from each csv file into one dataset. 


# (b) Modify the structure of the newly created AllNICrimeData csv file and remove the following attributes:
# CrimeID, Reported by, Falls within, LSOA code, LSOA name, last outcome and context.
# Show the structure of the modified file.

csv_file_list <- list.files(path = "NI Crime Data", pattern = "*.csv", recursive = TRUE)

csv_file_list[1]

# Function that reads all csv files in a directory, into one data frame and returns the result.
# Pass in the file list, directory and required columns as this function can be re-used again
# Note also that "On or near" is being set as a Missing Value NA
combine_results <- function(file_list, directory, columns) {
    all_file_data <- NULL

    for (csv_file in file_list) {
        # Read each of the csv files in turn and skip the first line of data as it
        # contains headings within the csv file
        nicrime_file <- read.csv(header = TRUE, paste(directory, csv_file, sep = "")
            , stringsAsFactors = FALSE, na.strings = c("", "NA", " ", ".", "On or near ", "On or near"))

        data_of_interest <- nicrime_file[columns]
        # append vertically to the all_file_data data frame
        all_file_data <- rbind(all_file_data, data_of_interest)
    }
    # Return the concatenated result
    return(all_file_data)
}

# Call the function and return the result to a data frame
#myColumns <- c("Month", "Longitude", "Latitude", "Location")

myColumns <- c(5:7, 10)

my_nicrime_data <- combine_results(csv_file_list, "NI Crime Data/", myColumns)
str(my_nicrime_data)

# Save this dataset into a csv file called AllNICrimeData. 
write.csv(my_nicrime_data, file = "AllNICrimeData.csv", row.names = FALSE, na = "")


# Count and show the number of rows in the AllNICrimeData dataset.
num_rows <- nrow(my_nicrime_data)
num_rows

# (c) Factorise the Crime type attribute. Show the modified structure. 
crime_type <- factor(my_nicrime_data$Crime.type, order = FALSE, levels =
    c("Anti-social behaviour", "Bicycle theft", "Burglary", "Criminal damage and arson", "Drugs", "Other crime"
    , "Other theft", "Possession of weapons", "Public order", "Robbery", "Shoplifting", "Theft from the person"
    , "Vehicle crime", "Violence and sexual offences"))

my_nicrime_data$Crime.type <- crime_type

str(my_nicrime_data)

# (d) Modify the AllNICrimeData dataset so that the Location attribute contains only a street name. 
# For example, the attribute value “On or near Westrock Square” should be modified to only contain “Westrock Square”. 
# Modify the resultant empty location attributes with a suitable identifier. 

head(my_nicrime_data, 10)

my_nicrime_data$Location <- gsub("On or near ", "", my_nicrime_data$Location)


head(my_nicrime_data, 10)

# (e) Create a function called find_a_postcode that takes as an input each location attribute from AllNICrimeData 
# and finds a suitable postcode value from the postcode dataset.  

# Use the CleanNIPostcodeData dataset you created in your previous lab practical 
# as the reference data to find postcodes. If there are several postcodes discovered with 
# the same location, choose the most popular postcode for that location. 

# Store the output from the find_a_postcode function in a suitably named variable. 
# Show the structure and number of values in this variable.


# Running all data in the my_nicrime_data frame was taking too long, so it
# was decided to process just the data from Jan 2015.
# Code below processed the Jan 2015 data, in the nicrime_file_jan2015 data frame
nicrime_file_jan2015 <- NULL
nicrime_file_jan2015 <- combine_results(csv_file_list[1], "NI Crime Data/", myColumns)
nrow(nicrime_file_jan2015)
str(nicrime_file_jan2015)

nicrime_file_jan2015$Location <- gsub("On or near ", "", nicrime_file_jan2015$Location)

crime_type_jan <- NULL
crime_type_jan <- factor(nicrime_file_jan2015$Crime.type, order = FALSE, levels =
    c("Anti-social behaviour", "Bicycle theft", "Burglary", "Criminal damage and arson", "Drugs", "Other crime"
    , "Other theft", "Possession of weapons", "Public order", "Robbery", "Shoplifting", "Theft from the person"
    , "Vehicle crime", "Violence and sexual offences"))

nicrime_file_jan2015$Crime.type <- crime_type_jan

head(nicrime_file_jan2015, 10)

#Read the postcode file.  Only the PrimaryThorfare and Postcode columns are required
postcode_data <- read.csv(header = TRUE, "CleanNIPostcodeData.csv",
            , stringsAsFactors = FALSE, na.strings = c("", "NA", " ", "."))[, c("PrimaryThorfare", "Postcode")]

# Add a new column called Postcode, populated with empty strings
# This will be populated with the postcode
nicrime_file_jan2015$Postcode <- ""

find_a_postcode <- function(location, postcode) {

    # This function finds the post code for a given location
    # and populates it in the postcode

    # Get all rows with the Primary Thorfare equal to the location
    # PrimaryThorfare is upper case, so location needs to be upper case
    location_data <- subset(postcode_data, PrimaryThorfare == toupper(location))

    # https://stackoverflow.com/questions/22120781/getting-the-most-frequent-element-in-a-factor-in-r
    # Get the most common postcode. Note code below found at url above

    specific_postcodes <- location_data$Postcode

    most_common_postcode <- names(which.max(table(specific_postcodes)))

    if (is.null(most_common_postcode)) {
        most_common_postcode <- NA
    }

    postcode <- most_common_postcode

    return(postcode)
}


str(my_nicrime_data)

#mapply(find_a_postcode, nicrime_file_jan2015$Location, nicrime_file_jan2015$Postcode)

head(nicrime_file_jan2015, 10)

# Loop through the locations, find a postcode, and add the vector
# Note that if the location is NA, then the postcode will be NA also


str(my_nicrime_data)

# Use the index in count to update the Postcode attribute
count = 1
for (loc in nicrime_file_jan2015$Location) {

    postcode <- NA
    # Get the post code
    if (!is.na(postcode_data)) {
        postcode <- find_a_postcode(loc, postcode)
    }

    #Update the postcode in the data frame
    nicrime_file_jan2015$Postcode[count] <- postcode

    count = count + 1
}

# (f) Append the data output from your find_a_postcode function to the AllNICrimeData dataset. 
# Show the modified structure.

head(nicrime_file_jan2015, 10)
str(nicrime_file_jan2015)




# (g) Some location data in the nicrime_file_jan2015 has missing location information 
# eg it contains the identifier you added in task (d). 
# Instead of deleting these from the dataset, 
# create a function called tidy_location that takes as an input any data that does not have complete location information. 
# Using longitude and latitude information, find a close match to the missing location information. 
# For example, the second line of your dataset contains a blank location with longitude -6.00329 and latitude 54.55165. 
# Search the AllNICrimeData dataset for locations with very similar longitude and latitude values. 
# You should use as much of each co-ordinate to find similarly matching locations and not just locations that are broadly within the same latitude and longitude. 

# You may use a suitable R function such as the functions available within the ggmap library to examine and extract relevant location data. 
# If you decide to do this, fully document the processes you followed to use this library. 
# Count the number of modifications you make to AllNICrimeData dataset and show the first 10 rows of data.

tidy_location <- function(my_row) {
    # A row is input containing an empty location. 
    # Interrogate the file to find a location with similar longitude and latitude
    while_count = 1
    found_location = ""

    my_row <- nicrime_file_jan2015[2, 1:5]
    length <- nchar(my_row$Longitude)

    # stopping condition is run 5 times or if a location is found
    while (while_count < 6 && found_location == "") {
        # take the end character from the longitude and latitude
        long <- substr(my_row$Longitude, 1, length - 1)
        lat <- substr(my_row$Latitude, 1, length - 1)

        # Get the longitudes and latitudes that have 1 character less
        df_longitude <- my_nicrime_data[grep(long, my_nicrime_data$Longitude),]
        df_longitude_latitude <- df_longitude[grep(lat, df_longitude$Latitude),]

        # loop through the data frame, and store the location
        for (loc in nicrime_file_jan2015$Location) {

            if (!(is.na(loc))) {
                found_location <- loc
            }
        }
        # Increment count and decrement length for next time in loop
        while_count = while_count + 1
        length = length - 1
    }

    return(found_location)
}

count = 1
num_modification = 0
for (location in nicrime_file_jan2015$Location) {

    # Only process employt locations
    if (is.na(location)) {

        new_location <- tidy_location(datarow)

        #Update the location with the new location
        nicrime_file_jan2015$Location[count] <- new_location

        num_modification = num_modification + 1
    }
    count = count + 1
}

print(num_modification)

head(nicrime_file_jan2015, 10)

str(nicrime_file_jan2015)


# (h) Append the AllNICrimeData dataset with new attributes Town, County and Postcode. 
# Use the NIPostcode dataset and match the location attribute to perform the join between both datasets. 
# Modify Town and County attributes to become unordered factors. 
# Show the modified AllNICrimeData structure

# Add the Town and County. Postcode has already been added
nicrime_file_jan2015$Town <- ""
nicrime_file_jan2015$Count <- ""
str(nicrime_file_jan2015)


#Read the postcode file.  Only the Town, County and Postcode columns are required
postcode_data <- read.csv(header = TRUE, "CleanNIPostcodeData.csv",
            , stringsAsFactors = FALSE, na.strings = c("", "NA", " ", "."))[, c("Town", "County", "Postcode")]

head(nicrime_file_jan2015, 10)
head(postcode_data, 10)

# Add the Town and County. Postcode has already been added
nicrime_file_jan2015$Town <- ""
nicrime_file_jan2015$Count <- ""

# Populate the Town and County in For loop below
count = 1
for (pcode in nicrime_file_jan2015$Postcode) {

    # Only process where the post code is not empty
    if (!(is.na(pcode))) {

        pcode_data <- subset(postcode_data, Postcode == pcode)

        #Update the town and county with the first record
        nicrime_file_jan2015$Town[count] <- pcode_data[1, 1]
        nicrime_file_jan2015$County[count] <- pcode_data[1, 2]
    }
    count = count + 1
}

head(nicrime_file_jan2015, 10)

str(nicrime_file_jan2015)


# (i) Save your modified AllNICrimeData dataset in a csv file called FinalNICrimeData. 

write.csv(nicrime_file_jan2015, file = "FinalNICrimeData.csv", row.names = FALSE, na = "")

# (j) Search for all crime data where town contains Strabane. 
# Show the first 10 rows of this data.

strabane_data <- subset(nicrime_file_jan2015, Town == "STRABANE")
head(strabane_data, 10)

str(strabane_data)
