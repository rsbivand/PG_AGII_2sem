rm(list=ls())
library(spdep)
library(maps)
library(sphet)
library(maptools)

 datas <- read.csv("cigarette.csv")
 datas<-datas[datas$year %in% 64:92,]
or<- order(datas$year, datas$idstate)
dataset<-datas[or,]

names(dataset)
dim(dataset)
coord<-cbind(dataset$xcoord,dataset$ycoord)

state.map<-map("state",as.vector(unique(dataset$name)), plot = FALSE, fill = TRUE)
IDS<-sapply(strsplit(state.map$names, ":"), function(x)x[1])
state.sp<-map2SpatialPolygons(state.map,IDs = IDS, proj4string = CRS ("+proj=longlat +ellps=WGS84"))

nbq<-poly2nb(state.sp)
st.listw <-nb2listw(nbq,style = "B")
Wmat<-Matrix(listw2mat(st.listw))
Wmat <- Wmat / rowSums(Wmat)
write.csv(as.matrix(WmatWmat),"W_cigar")

