#SNA Paris St Seine Region. 
#Auth. Ravish Aggarwal 

#objective - to get data from the techonmap.fr. 

# going to our working directory.

getwd()   

# reading the csv file from techonmap.fr and storing data in techon.

techon <- read.csv("parisdata.csv",header = TRUE, sep = ",", quote = "\"" ,dec =".",fill = TRUE)  

# techon is now a data frame. 
class(techon)  

#  prints the techon data frame 

techon

# ploting Paris Map
# using ggmap packages 

install.packages("ggmap")
library(ggmap)
qmap('Paris')
qmap('75008', zoom = 16)



#installing spatial data packge to convert the data frame into spatial data 
install.packages("sp")
library(sp)

coords <- cbind(Longitude = as.numeric(as.character(techon$Longitude)), Latitude = as.numeric(as.character(techon$Latitude)))
techon.pts <- SpatialPointsDataFrame(coords, techon[,-(7:8)],proj4string = CRS("+init=epsg:4326")) 

plot(techon.pts, pch = ".", col = "darkred")
map <- qmap('Paris', zoom = 12, maptype = 'hybrid')
map + geom_point(data = techon, aes(x = Longitude, y = Latitude), color="red", size=10, alpha=0.7)





