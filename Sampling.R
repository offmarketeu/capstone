library(tm)
library(knitr)
library(ggplot2)
library(NLP)
library(quanteda)


#dir<-"E:/COURSERA/Data Science/Course10-Capstone/"
#dir1<-"E:/COURSERA/Data Science/Course10-Capstone/CORP"
#dir2<-"E:/COURSERA/Data Science/Course10-Capstone/SAMPLE"

dir<-"C:/Users/n040485/Documents/000_CAPSTONE/"
dir1<-"C:/Users/n040485/Documents/000_CAPSTONE/CORP"
dir2<-"C:/Users/n040485/Documents/000_CAPSTONE/SAMPLE"
setwd(dir1)


# Original Files
# Blogs
blogs <- readLines("en_US.blogs.txt")
# News
news <- readLines("en_US.news.txt")
# Twitter
twitter <- readLines("en_US.twitter.txt")

#Sampling


# Blogs
set.seed(123)
blogs <- blogs[rbinom(length(blogs)*.10, length(blogs), .5)]
write.csv(blogs, file = paste(dir2,"blog.sample.csv", sep="/"), row.names = FALSE, col.names = FALSE)
# News
set.seed(123)
news <- news[rbinom(length(news)*.10, length(news), .5)]
write.csv(news, file = paste(dir2,"news.sample.csv", sep="/"), row.names = FALSE, col.names = FALSE)
# Twitter
set.seed(123)
twitter <- twitter[rbinom(length(twitter)*.10, length(twitter), .5)]
write.csv(twitter, file = paste(dir2,"twitter.sample.csv", sep="/"), row.names = FALSE, col.names = FALSE)

# clean up global environment
rm(blogs, news, twitter)


