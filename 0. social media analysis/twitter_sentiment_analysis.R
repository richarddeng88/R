###dwonload and install the 'sentiment' package
###install.packages("C:/Users/Richard/Downloads/sentiment_0.1.tar.gz", repos=NULL, type="source")
library(twitteR)
library(sentiment)
library(plyr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

#Step 2: Let's collect some tweets containing the term "starbucks" 
setup_twitter_oauth(consumer_key="ejRTMayX2nhKZB2yNDCjDJWHz", 
                    consumer_secret="3PGjS2HGvtEPY1DZh9feUDcMv0O02VyYk7Q5MLIS5MzibxwtuD", 
                    access_token="3045806279-RTecSDiDhevDXJ2YnbZ7BJKvUSylb6VvoDQqzDC",
                    access_secret="t7heZUb0KLTuVIJirbPcWDfrLxarCmSFOTDMRsMBpAu8Z")

# harvest some tweets
some_tweets = searchTwitter("starbucks", n=1500, lang="en")
class(some_tweets)
length(some_tweets)

# get the text
some_txt = sapply(some_tweets, function(x) x$getText())


##Step 3: Prepare the text for sentiment analysis
# remove retweet entities
some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
# remove at people
some_txt = gsub("@\\w+", "", some_txt)
# remove punctuation
some_txt = gsub("[[:punct:]]", "", some_txt)
# remove numbers
some_txt = gsub("[[:digit:]]", "", some_txt)
# remove html links
some_txt = gsub("http\\w+", "", some_txt)
# remove unnecessary spaces
some_txt = gsub("[ \t]{2,}", "", some_txt)
some_txt = gsub("^\\s+|\\s+$", "", some_txt)

# define "tolower error handling" function 
try.error = function(x)
            {
                # create missing value
                y = NA
                # tryCatch error
                try_error = tryCatch(tolower(x), error=function(e) e)
                # if not an error
                if (!inherits(try_error, "error"))
                    y = tolower(x)
                # result
                return(y)
            }
# lower case using try.error with sapply 
some_txt = sapply(some_txt, try.error)

# remove NAs in some_txt
some_txt = some_txt[!is.na(some_txt)]
names(some_txt) = NULL












