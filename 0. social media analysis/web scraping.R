library(httr);library(jsonlite)
r <- GET('http://httpbin.org/get')
r$status_code
r$headers
r$content
content(r,'raw')
content(r,'text')
content(r,'parse')

## making requests from server and get infomation from server