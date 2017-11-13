library(tm)
library(quanteda)


dir3<-"E:/COURSERA/Data Science/Course10-Capstone/TOKENS"
setwd(dir3)

tkm<- read.csv("tokens2.csv")
tkm_<- read.csv("tokens3.csv")

lit<-"friends and family members"
lit_str<- strsplit(lit," ")
n_lit<- length(lit_str[[1]])

if (n_lit==1) {
    # 2-g
    search<-tkm[grepl(paste("^",lit,sep=""), tkm$Content),]
    search<-search[order(-search$Frequency),]
    leader<- head(search,3)
    #des<- t(data.frame((strsplit(as.character(leader$Content)," "))))
    st1<-strsplit(as.character(leader$Content)," ")
    vector<- c(st1[[1]][2],st1[[2]][2],st1[[3]][2])
    
} else {
    # find the lag
    liting <- as.character()
    for (j in max(1,n_lit-1):n_lit) {
      liting <- paste(liting, lit_str[[1]][j], sep=" ")
    }
    liting<- substring(liting,2)
    # 3-g
    search_<-tkm_[grepl(paste("^",liting,sep=""), tkm_$Content),]
    if (nrow(search_)>0) {
      search_<-search_[order(-search_$Frequency),]
      leader_<- head(search_,3)
      st1<-strsplit(as.character(leader_$Content)," ")
      vector<- c(st1[[1]][3],st1[[2]][3],st1[[3]][3])
    } else {
      sep<- strsplit(lit, " ")
      lit<-sep[[1]][3]
      search<-tkm[grepl(paste("^",lit,sep=""), tkm$Content),]
      search<-search[order(-search$Frequency),]
      leader<- head(search,3)
      st1<-strsplit(as.character(leader$Content)," ")
      vector<- c(st1[[1]][2],st1[[2]][2],st1[[3]][2])
    }
}  

print(vector)