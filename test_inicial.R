library(quanteda)

dir<-"E:/COURSERA/Data Science/Course10-Capstone/"
dir1<-"E:/COURSERA/Data Science/Course10-Capstone/CORP"
dir2<-"E:/COURSERA/Data Science/Course10-Capstone/SAMPLE"

#fullCorpus <- Corpus(DirSource(dir2), readerControl = list(language="en_US"))


#Profanity file
profanity <- read.csv(paste(dir,"profanity_list.csv", sep=""), header=FALSE, stringsAsFactors=FALSE)
profanity <- profanity$V1

tct<- "Por consiguiente Felipe Presidente. Pero es mejor otro presidente como Zapatero"
tct2<-"Ahora viene el otro bastard. Otro presidente que nos dejo peor"
corptc<- corpus(tct)
corptc2<- corpus(tct2)
cor<- corptc+corptc2

tkdfm <- dfm(tct, tolower=TRUE, remove=c(profanity, stopwords("spanish")), remove_numbers = TRUE, remove_punct=TRUE, ngrams = 1, verbose = FALSE)
tkdfm2 <- dfm(tct, tolower=TRUE, remove=c(profanity, stopwords("spanish")), remove_numbers = TRUE, remove_punct=TRUE,stem = TRUE, ngrams = 2, verbose = FALSE)
presidentes <- dfm(tct, tolower=TRUE, select="president", ngrams = 2, verbose = FALSE)

