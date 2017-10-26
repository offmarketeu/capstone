library(tm)
library(knitr)
library(ggplot2)
library(NLP)
library(quanteda)

dir<-"E:/COURSERA/Data Science/Course10-Capstone/"
dir1<-"E:/COURSERA/Data Science/Course10-Capstone/CORP"
dir2<-"E:/COURSERA/Data Science/Course10-Capstone/SAMPLE1"

fullCorpus <- Corpus(DirSource(dir2), readerControl = list(language="en_US"))
fullcorpues<-corpus(fullCorpus)

#Profanity file
profanity <- read.csv(paste(dir,"profanity_list.csv", sep=""), header=FALSE, stringsAsFactors=FALSE)
profanity <- profanity$V1


# Tokenizations
#1-grams
tkcorpus<- tokens(fullcorpues, remove_numbers = TRUE,  remove_punct = TRUE)
tkdfm <- dfm(fullcorpues, tolower=TRUE, remove=stopwords("english"), remove_numbers = TRUE, remove_punct=TRUE,stem = TRUE, ngrams = 1, verbose = FALSE)
top_ng1<- topfeatures(tkdfm)
top_ng1
#1-grams with stopwords
tkdfm_b <- dfm(fullcorpues, tolower=TRUE, remove_numbers = TRUE, remove_punct=TRUE,stem = TRUE, ngrams = 1:2, verbose = FALSE)
top_ng1b<- topfeatures(tkdfm_b)
top_ng1b
freq_1b<-docfreq(tkdfm_b)
freq_1b <- data.frame(word=names(freq_1b), count=freq_1b)

#2-grams
tkdfm2 <- dfm(fullcorpues, tolower=TRUE, remove_numbers = TRUE, remove_punct=TRUE,stem = TRUE, ngrams = 2, verbose = FALSE)
top_ng2<- topfeatures(tkdfm2)
top_ng2

#4-grams
tkdfm4 <- dfm(fullcorpues, tolower=TRUE, remove_numbers = TRUE, remove_punct=TRUE,stem = TRUE, ngrams = 4, verbose = FALSE)
top_ng4<- topfeatures(tkdfm4)
top_ng4

#set.seed(100)
#textplot_wordcloud(tkdfm, min.freq = 6, random.order = FALSE,
#                   rot.per = .25, 
#                   colors = RColorBrewer::brewer.pal(8,"Dark2"))
