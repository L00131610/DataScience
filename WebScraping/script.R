#install.packages("rvest")
library(rvest)


url <- 'https://www.imdb.com/search/title/?release_date=2017-01-01.2017-12-31&count=250'

# Read the HTML code from the website
web_page <- read_html(url)


head(web_page)
str(web_page)

rank_data_html <- html_nodes(web_page, '.text-primary')
head(rank_data_html, 10)

# Convert from HTML to text
rank_data <- html_text(rank_data_html)
head(rank_data, 10)

#check length
length(rank_data_html)

# Pre-processing - convert to numeric
rank_data <- as.numeric(rank_data)
head(rank_data, 10)

title_data_html <- html_nodes(web_page, '.lister-item-header a')

# Inspect element - copy - copy selector
title_data_html <- html_nodes(web_page, '#main > div > div > div.lister-list > div:nth-child(n) > div.lister-item-content > h3 > a')

head(title_data_html, 10)

title_data <- html_text(title_data_html)
head(title_data, 10)

# Description data below
description_data_html <- html_nodes(web_page, '#main > div > div > div.lister-list > div:nth-child(n) > div.lister-item-content > p:nth-child(4)')

#head(description_data_html, 10)

description_data <- html_text(description_data_html)
head(description_data, 10)

# Replace the new line characters
description_data <- gsub("\n *", "", description_data)
head(description_data, 10)

length(description_data)


# runtime data below
runtime_data_html <- html_nodes(web_page, '#main > div > div > div.lister-list > div:nth-child(n) > div.lister-item-content > p:nth-child(2) > span.runtime')

#head(runtime_data_html, 10)

runtime_data <- html_text(runtime_data_html)
head(runtime_data, 10)

# Replace the min characters
runtime_data <- gsub("min", "", runtime_data)

runtime_data <- as.numeric(runtime_data)

head(runtime_data, 10)

length(runtime_data)

# genre data below
genre_data_html <- html_nodes(web_page, '#main > div > div > div.lister-list > div:nth-child(n) > div.lister-item-content > p:nth-child(2) > span.genre')

#head(genre_data_html, 10)

genre_data <- html_text(genre_data_html)
head(genre_data, 10)

# Replace the new line characters
genre_data <- gsub("\n *", "", genre_data)

# remove end spaces
genre_data <- trimws(genre_data)

#genre_data <- as.numeric(genre_data)

head(genre_data, 10)

# Remove everything after a comma - we just want the first genre

genre_data <- gsub(", *", ".", genre_data)



head(genre_data, 10)


# Companies

url <- 'http://www.top1000.ie/companies?count=1000'

# Read the HTML code from the website
web_page <- read_html(url)


# Description data below
description_data_html <- html_nodes(web_page, '.name')
#description_data_html <- html_nodes(web_page, '#companies > div:nth-child(20) > div.content > a > div > span.name')

#description_data_html <- NULL
##companies > div:nth-child(20) > div.content > a > div > span.name
#description_data_html <- html_nodes(web_page, '#companies > div:nth-child(20) > div.content > a > div > span.name')

#tail(description_data, 10)

#head(description_data_html, 10)

description_data <- html_text(description_data_html)
head(description_data, 10)

length(description_data)

# Replace the new line characters
description_data <- gsub("\n *", "", description_data)
head(description_data, 10)

length(description_data)


