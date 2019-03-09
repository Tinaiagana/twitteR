library(twitteR)
consumer_key <- "ZLX0zDj47f35gmRlPDmyxqLuJ"
consumer_secret<- "aWawo7GN7SJxFS1X8NBrJDpe4UuOZicQUzVEtf23AK6D6JJUr7"
access_token <- "107991817-ekKpeILEER2GrZaIr3H51uBMsTDYIL6CTtAi2xiD"
access_secret <- "iHlVgWV6TPF20AlmqZaAUyGDvCULXEUyMIr0L1jCRWwzA"

#set up authenticate
# choose yes for auto authentication or no otherwise
setup_twitter_oauth(consumer_key ,consumer_secret,access_token ,access_secret)
tweets <- usecategory_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0,
category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0,
rTimeline("RealDonaldTrump", n=200)
n.tweet <- length(tweets)
tweets.df <- twListToDF(tweets)
head(tweets.df)
#removing URLs, Hashtags and such using gsub function
tweets.df2 <- gsub("http.*","",tweets.df$text)
tweets.df2 <- gsub("https.*","",tweets.df2)
tweets.df2 <- gsub("#.*","",tweets.df2)
tweets.df2 <- gsub("@.*","",tweets.df2)
head(tweets.df2)
library(syuzhet)
word.df <- as.vector(tweets.df2)
emotion.df <- get_nrc_sentiment(word.df)
emotion.df2 <- cbind(tweets.df2, emotion.df) 
head(emotion.df2)

#getting positive sentiment
sent.value <- get_sentiment(word.df)
most.positive <- word.df[sent.value == max(sent.value)]
most.positive
#getting negative sentiment
most.negative <- word.df[sent.value <= min(sent.value)]
most.negative

#segregating tweets based on on sentiment
positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)

negative.tweets <- word.df[sent.value > 0]
head(negative.tweets)

neutral.tweets <- word.df[sent.value == 0]
head(neutral.tweets)

### There is another way to categorize sentiment into P, N, NEU
category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0,
                                                  "Positive", "Neutral"))
head(category_senti)

