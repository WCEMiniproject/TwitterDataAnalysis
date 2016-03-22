library(twitteR)
library(tm)
library(wordcloud)
library(RCurl)
# add your following keys you get these keys once you create an twitter api from dev.twitter.com
consumer_key <- "xxxxxxxxxxxxx"
consumer_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_token <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_secret <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets = searchTwitteR("AUSvBAN",n=1500, resultType = "recent")
tweet_text = sapply(tweets, function(x) x$getText())
tweet_text <- iconv(tweet_text,"UTF-8")
tweet_corpus = Corpus(VectorSource(tweet_text))
tweet_clean = tm_map(tweet_corpus, removePunctuation)
tweet_clean = tm_map(tweet_clean, content_transformer(tolower))
tweet_clean = tm_map(tweet_clean, removeWords, stopwords("english"))
tweet_clean = tm_map(tweet_clean, removeNumbers)
tweet_clean = tm_map(tweet_clean, stripWhitespace)
tweet_clean = tm_map(tweet_clean, removeWords, c("india"))
wordcloud(tweet_clean, max.words=1500, colors = rainbow(50), random.order = "TRUE")