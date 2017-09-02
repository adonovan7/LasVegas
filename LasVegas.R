#install.packages('corrplot')
#install.packages('doBy')
library(doBy) #summaryBy
library(ggplot2) # Data visualization
library(dplyr) 
library(corrplot) # correlation plot
library(plotly) # interactive map
library(rworldmap) #world map

df <- read.csv2('/Users/andiedonovan/myProjects/LasVegas/LasVegas.csv') 

names(df) <- gsub("\\.", "", names(df))
names(df)[1]<-"Country" 

colnames(df) 
colnames(df)<-c('Country', 'NoReviews', 'NoHotelReviews', 'Helpful', 'Score', 'Stay', 'Traveler', 'Pool', 'Gym', 'Tennis', 'Spa', 'Casino', 'Internet', 'Name', 'Stars', 'NoRms', 'Continent', 'MemberYrs', 'Month', 'Weekday') #rename all of the columns using a list
head(df) 

amenities1 = df %>% 
  select(Name, Country,Score, Pool, Gym, Tennis, Spa, Casino, Internet)
amenities1$Pool<-as.numeric(amenities1$Pool)
amenities1$Gym<-as.numeric(amenities1$Gym)
amenities1$Tennis<-as.numeric(amenities1$Tennis)
amenities1$Spa<-as.numeric(amenities1$Spa)
amenities1$Casino<-as.numeric(amenities1$Casino)
amenities1$Internet<-as.numeric(amenities1$Internet)

amenities1[,3:9]
cor.amen<-cor(amenities1[,3:9], use="complete", method="pearson") 
corrplot(cor.amen)

g<- ggplot(df)+
  geom_bar(aes(x=Stars, fill = Continent), color="black") + 
  theme(plot.title=element_text(hjust=0.5), 
        axis.text.x=element_text(angle=90, hjust=1)) + 
  xlab("Hotel Stars") +
  ylab("Number of Hotels") + 
  scale_x_continuous(breaks= seq(2,5,by=0.5), 
                     labels = c('2.0', '2.5', '3.0', '3.5','4.0', '4.5', '5.0')) + 
  ggtitle("Hotels Per Rating and Continent") 
ggplotly(g) 