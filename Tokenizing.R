library(tm)
library(quanteda)


dir<-"E:/COURSERA/Data Science/Course10-Capstone/"
dir1<-"E:/COURSERA/Data Science/Course10-Capstone/CORP"
dir2<-"E:/COURSERA/Data Science/Course10-Capstone/SAMPLE"
dir3<-"E:/COURSERA/Data Science/Course10-Capstone/TOKENS"

#dir<-"C:/Users/n040485/Documents/000_CAPSTONE/"
#dir1<-"C:/Users/n040485/Documents/000_CAPSTONE/CORP"
#dir2<-"C:/Users/n040485/Documents/000_CAPSTONE/SAMPLE"
#dir3<-"C:/Users/n040485/Documents/000_CAPSTONE/TOKENS" 
#setwd(dir1)



# Profanity

#Profanity file
profanity <- read.csv(paste(dir,"profanity_list.csv", sep=""), header=FALSE, stringsAsFactors=FALSE)
profanity <- profanity$V1


fullCorpus <- Corpus(DirSource(dir2), readerControl = list(language="en_US"))
fullcorpues<-corpus(fullCorpus)


# Tokenizing

#1-grams
tkdfm <- dfm(fullcorpues, tolower=TRUE, remove_numbers = TRUE, remove_punct=TRUE,ngrams = 1, verbose = FALSE)
top_ng1<- topfeatures(tkdfm)
freq_1 <- data.frame(word=names(top_ng1), count=top_ng1)
tk1 <- data.frame(Content = features(tkdfm), Frequency = colSums(tkdfm), 
                 row.names = NULL, stringsAsFactors = FALSE)
write.csv(tk1,paste(dir3,"tokens1.csv", sep="/"))

#2-grams
tkdfm2 <- dfm(fullcorpues, tolower=TRUE, remove_numbers = TRUE, remove_punct=TRUE, ngrams = 2, verbose = FALSE, concatenator=" ")
top_ng2<- topfeatures(tkdfm2)
freq_2 <- data.frame(word=names(top_ng2), count=top_ng2)
tk2 <- data.frame(Content = features(tkdfm2), Frequency = colSums(tkdfm2), 
                  row.names = NULL, stringsAsFactors = FALSE)

write.csv(tk2,paste(dir3,"tokens2.csv", sep="/"))


#3-grams
tkdfm3 <- dfm(fullcorpues, tolower=TRUE, remove_numbers = TRUE, remove_punct=TRUE, ngrams = 3, verbose = FALSE,concatenator=" ")
top_ng3<- topfeatures(tkdfm3)
freq_3 <- data.frame(word=names(top_ng3), count=top_ng3)
tk3 <- data.frame(Content = features(tkdfm3), Frequency = colSums(tkdfm3), 
                  row.names = NULL, stringsAsFactors = FALSE)

write.csv(tk3,paste(dir3,"tokens3.csv", sep="/"))
