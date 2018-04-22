my_data = data.frame(read.csv("C:/Users/Owner/Documents/DataScience/Lotto/Lotto/1999.csv", header = TRUE, na.strings = c("", "NA", " ")))
my_data

str(my_data)

head(my_data, 10)

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

    return (return_data)
}

my_data <- combine_results(csv_file_list)

str(my_data)

nrow(my_data)

head(my_data,10)