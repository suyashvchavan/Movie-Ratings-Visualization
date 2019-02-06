



getwd()
movies <-read.csv("Movie Ratings.csv")
movies <-read.csv(file.choose())
head(movies)
colnames(movies) <-c("Film","Genre","CriticRating","AudienceRating","Budget","Year")
colnames(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)


#------------Aesthetics
library(ggplot2) 

ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))

#Add Geometry
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating)) + geom_point() 

#Add colour
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre)) + geom_point() 
#addsize
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=Budget)) + geom_point() 

#--------Plotting with layers
p <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=Budget))
p
p + geom_point()
p + geom_line()
p +geom_point() +geom_line()
p+ geom_line() + geom_point()



#-------------overriding Aesthetics
q <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=Budget))

#Add geom layer
q + geom_point()
#overriding Example1
q + geom_point(aes(size=CriticRating))
#example2
q + geom_point(aes(colour= Budget))
 

#Example3
q + geom_point(aes(x=Budget))+ xlab("Budget$$")

#Example4
q + geom_line(size=1)+geom_point()


#---------------mapping vs setting
library(ggplot2)
r <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))
r + geom_point()

#add colour
#1.Mapping
r + geom_point(aes(colour=Genre))
#2.Setting
r + geom_point(colour="DarkGreen")
#3.Error
r + geom_point(aes(colour="Blue"))

#size
#1.Mapping
r + geom_point(aes(size=Budget))
#2.setting
r + geom_point(size=10)


#-----------------Histograms and density functions

s <- ggplot(data=movies,aes(x=Budget))
s + geom_histogram(binwidth = 10)

#Add colour
s + geom_histogram(binwidth = 10,aes(colour=Genre))               #It will only colour the outline
s + geom_histogram(binwidth = 10,aes(fill=Genre))                 #correct way

#add a border
s + geom_histogram(binwidth = 10,aes(fill=Genre),colour="Black")  #Add a border using colour()

#Density Chart
s + geom_density()                                                #plain chart
s + geom_density(aes(fill=Genre))                                 #will show overlapped chart
s + geom_density(aes(fill=Genre),position="stack")                #will not overlap 


#--------------starting layer tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,fill="White", colour="Blue")

# Another way
t <- ggplot(data=movies)
 t + geom_histogram(binwidth = 10,aes(x=AudienceRating),fill="White",colour="Blue")  #When you want to use diffenet factors for x-axis

 t + geom_histogram(binwidth = 10,aes(x=CriticRating),fill="White",colour="Blue")
 
 t + geom_histogram(binwidth = 10,aes(x=Budget),fill="White",colour="Blue")
  
 t + geom_histogram(binwidth = 10,aes(x=AudienceRating,fill=Genre),colour="Blue")
 
 t<-ggplot()                                                   #when you want to use different datasets
 
 
 #------------Statistical Transformation
 
 ?geom_smooth

 u <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
 u + geom_point()
 u + geom_point()+geom_smooth()
 u +geom_point()+geom_smooth(fill=NA)

 #Boxplots
 u <-ggplot(data=movies,aes(x=Genre,y=AudienceRating,colour=Genre))
 u + geom_boxplot(size=1.2)                                #only shows boxplot
 u + geom_boxplot(size=1.2)+geom_point(size=0.5)           #show point over boxplot
 u + geom_boxplot(size=1.2)+geom_jitter(size=0.5)          #shows points scattered in given area 
 u + geom_jitter(size=0.5)+geom_boxplot(size=1.2)          #shows boxplot over scattered points
 u + geom_jitter(size=0.5)+geom_boxplot(size=1.2,alpha=0.5)# alpha is used to show transparent boxplot
 
 d <-ggplot(data=movies,aes(x=Genre,y=CriticRating,colour=Genre))
 d +geom_boxplot(size=1.2) 
 
 
#-------------using facets
 
v <- ggplot(data=movies,aes(x=Budget))
v + geom_histogram(binwidth=10)
v + geom_histogram(binwidth=10,aes(fill=Genre),colour="Blue")

#add facet
v + geom_histogram(binwidth=10,aes(fill=Genre),colour="Blue") +facet_grid(Genre~.,scales="free") #for each genre a histogram
v + geom_histogram(binwidth=10,aes(fill=Genre),colour="Blue") +facet_grid(.~Genre,scales="free") #scales is used so each plot will get own scale

#scatterplot 
w <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
w + geom_point(size=1)
#facet
w + geom_point(size=1) +facet_grid(Genre~.)         #rows for each genre
w + geom_point(size=1) +facet_grid(Genre~Year)      #rows for each genre, placed in each year column
w + geom_point(aes(size=Budget)) +facet_grid(Genre~Year)+geom_smooth()

#-----------------Cordinates

m <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,size=Budget,colour=Genre))               
m + geom_point()                #shows all the points

#limit
m + geom_point() + xlim(50,100) +ylim(50,100)

#when it wont work well
n <- ggplot(data=movies, aes(x=Budget))
n + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black") +
  ylim(0,50)
#zoom in
n + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+ coord_cartesian(ylim=c(0,50))

w + geom_point(size=1) +facet_grid(Genre~Year)      #rows for each genre, placed in each year column
w + geom_point(size=1) +facet_grid(Genre~Year)+geom_smooth() + coord_cartesian(ylim=c(0,100))


#-------------theme

o <- ggplot(data=movies, aes(x=Budget))
o + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
h <- o + geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")

#add axes label

h + xlab("Money Axis") + ylab("Number of Movies") +
theme(axis.title.x=element_text(colour="DarkGreen",size=30),
      axis.title.y=element_text(colour="Red",size=30))

#Tick mark formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen",size=30),
        axis.title.y=element_text(colour="Red",size=30),
        axis.text.x =element_text(size=20),
        axis.text.y=element_text(size=20))


#legend formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="DarkGreen",size=30),
        axis.title.y=element_text(colour="Red",size=30),
        axis.text.x =element_text(size=20),
        axis.text.y=element_text(size=20),
        
        legend.title=element_text(size=30),
        legend.text=element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))
#title addition

h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x=element_text(colour="DarkGreen",size=30),
        axis.title.y=element_text(colour="Red",size=30),
        axis.text.x =element_text(size=20),
        axis.text.y=element_text(size=20),
        
        legend.title=element_text(size=30),
        legend.text=element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title=element_text(size=40,colour="DarkBlue",
                                family="Courier"))



                                                                                