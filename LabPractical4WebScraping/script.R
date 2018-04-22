library(rvest)

###################
# The turnover is stored as million or billion.
# The convert_millions_and_billions function converts 
# a million or billion to it's numeric equivalent
# For example: "1.5 million" will be converted to 1500000
###################
convert_millions_and_billions <- function(turnover) {
    all_file_data <- NULL

    # If the string contans billion multiply by a billion
    pos <- grep('billion', turnover)
    if (length(pos) > 0) {
        # Remove billion
        turnover <- gsub(" billion", "", turnover)
        turnover <- as.numeric(turnover) * 1000000000
    }

    # If the string contans million multiply by a billion
    pos <- grep(' million', turnover)
    if (length(pos) > 0) {
        # Remove billion
        turnover <- gsub(" million", "", turnover)
        turnover <- as.numeric(turnover) * 1000000
    }

    return(turnover)
}

###################
# The scrape_industry_type is a generic function that enables
# the data to be scraped using the industry type.
# The input parameter is type, so this means that the 
# scrape_industry_type function can be used to scrape the following
#    http://www.top1000.ie/industries/energy
#    http://www.top1000.ie/industries/pharma
#    http://www.top1000.ie/industries/construction
#    http://www.top1000.ie/industries/technology
#    http://www.top1000.ie/industries/food-and-beverage
###################
scrape_industry_type <- function(type) {

    ###################
    # Get the html based on the input type
    ###################
    url <- 'http://www.top1000.ie/industries'

    # Use paste to create the full url
    # For example, when energy is the type the url
    # becomes 'http://www.top1000.ie/industries/energy'
    url <- paste(url, type, sep = "/")
    web_page <- read_html(url)

    ###################
    # Store the names of the industry
    ###################
    names_html <- html_nodes(web_page, '.name')
    names <- html_text(names_html)
    # Remove all digits
    names <- gsub("[[:digit:]]", "", names)
    # Remove all dots and spaces
    names <- gsub("\\. ", "", names)

    ###################
    # Store the number of Employees
    ###################
    employee_numbers_html <- html_nodes(web_page, '.employees')
    employee_numbers <- html_text(employee_numbers_html)
    # Remove all non numeric characters, and set the data as numerice
    employee_numbers <- as.numeric(gsub("[^0-9]", "", employee_numbers))

    ###################
    # Store the turnover data
    ###################
    turnover_data_html <- html_nodes(web_page, '.turnover')
    turnover_data <- html_text(turnover_data_html)
    # Remove all non numeric characters
    turnover_data <- gsub("[\\€,]", "", turnover_data)
    # Remove all non numeric characters
    turnover_data <- gsub(" turnover", "", turnover_data)

    # Create column of type
    company_type <- rep(type, length(names))

    # Create the data frame
    industry <- data.frame(Company = names, NumEmployees = employee_numbers
        , Turnover = turnover_data, CompanyType = type)

    # Convert the turnover to numbers
    industry$Turnover <- mapply(convert_millions_and_billions, industry$Turnover)

    # Remove the scientific because, for example, 1 billion was returning as 1e+09
    industry$Turnover <- format(industry$Turnover, scientific = FALSE)

    return(industry)
}

# Scrape The Energy Companies
energy_companies <- scrape_industry_type("energy")
str(energy_companies)
energy_companies

# Scrape The Pharma Companies
pharma_companies <- scrape_industry_type("pharma")

# Scrape The Construction Companies
construction_companies <- scrape_industry_type("construction")

# Scrape The Technology Companies
technology_companies <- scrape_industry_type("technology")

# Scrape The Food and Beverage Companies
foodandbeverage_companies <- scrape_industry_type("food-and-beverage")

# Put all the companies into the same data frame
companies <- rbind(energy_companies, pharma_companies, construction_companies
    , technology_companies, foodandbeverage_companies)

companies$Turnover <- as.numeric(as.character(companies$Turnover))

# Remove the scientific because, for example, 1 billion was returning as 1e+09
companies$Turnover <- format(companies$Turnover, scientific = FALSE)

# Factorise the CompanyType type attribute. Show the modified structure. 
companyType <- factor(companies$CompanyType, order = FALSE, levels =
    c("energy", "pharma", "construction", "technology", "food-and-beverage"))

companies$CompanyType <- companyType

# Show the data frame after converting millions and billions
companies

str(companies)

# Create the CSV file
write.csv(companies, file = "Companies.csv", row.names = FALSE, na = "")

head(companies, 10)
tail(companies, 10)
###################
# Testing is below
###################

# Test million
million <- "3.2 million"
million <- convert_millions_and_billions(million)
million

# Test billion
billion <- "10 billion"
billion <- convert_millions_and_billions(billion)
billion

# Test neither
neither <- "random text"
neither <- convert_millions_and_billions(neither)
neither





