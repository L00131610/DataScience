
#(1) Import the diabetes-md into a new data frame called my_data
# Also set any empty cells to NA
my_data = data.frame(read.csv("Diabetes-md.csv", header = TRUE, na.strings = c("", "NA", " ")))

nrow(my_data)

#(2) Show the structure and class type of my_data.
str(my_data)
class(my_data)

cnames <- c("Patient name", "NI address", "Type", "Age", "Health status")
colnames(my_data) <- cnames

str(my_data)


#(3) The diabetes type and status attributes need to be refactored. Do this for
#    both attributes. Show the new structure of the data frame.
cnames <- c("Patient name", "NI address", "Type", "Age", "Status")
colnames(my_data) <- cnames
Type <- factor(my_data$Type, order = TRUE, levels = c("Type 1", "Type 2"))
#Type
my_data$Type <- Type

Status <- factor(my_data$Status, order = TRUE, levels = c("Excellent", "Improved", "Poor"))
#Status
my_data$Status <- Status

str(my_data)

head(my_data, 10)

#(4) Create a copy of the names attribute into a data frame called patient_names. Show the first 10 names contained in patient_names.

patient_names <- my_data$"Patient name"

class(patient_names)

head(patient_names, 10)

#(5) Examine how many missing values are in the data frame my_data. Count this value.

missing_values <- sum(is.na(my_data))

missing_values


#(6) Remove the missing values from the my_data data frame. Count and show the number of remaining records

my_data <- na.omit(my_data) # remove the missing values from my_data

my_data

count_no_missing_data <- nrow(my_data) # count the number of rows with no missing data

count_no_missing_data


