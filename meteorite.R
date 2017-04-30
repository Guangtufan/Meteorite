setwd('/Users/yezhuang/Documents/R/Meteorite/')
meteorite <- read.csv(file = 'meteorite-landings.csv')
names(meteorite)
table(meteorite$nametype)
table(meteorite$recclass)
table(meteorite$fall)
table(meteorite$year)

library(maps)
library(mapdata)
library(ggplot2)
library(ggmap)
attach(meteorite)
world <- map_data('world')
head(world)
ggplot() +
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_point(data=meteorite, aes(x=reclong, y=reclat), col='#1347ff', alpha=.2)
library(Hmisc)
str(meteorite)

table(nametype, fall)

ggplot(meteorite[year>=1970,], aes(x=as.factor(year))) + geom_bar() +
  coord_flip()
  theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
table(year[year>=1800])


for (i in 1:nrow(meteorite)){
  ifelse(meteorite$year[i] >= 1970, 
         meteorite$year2[i] <- meteorite$year[i],
         meteorite$year2[i] <- '1969 and before')
}
  
summary(meteorite$year2)
for (i in 1:nrow(meteorite)){
  ifelse(meteorite$year[i] > 1970, a[i]<-1,a[i]<-0)
}

m21 <- meteorite[meteorite$year >= 2000,]
m20 <- meteorite[meteorite$year >= 1900,]
m19 <- meteorite[meteorite$year < 1900,]

ggplot() +
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_point(data=na.omit(m19[,c('reclong', 'reclat', 'fall')]), aes(x=reclong, y=reclat, col=fall), alpha=.2) +
  theme(legend.position = c(0.95,0.5))
table(fall)
table(nametype)

relict <-meteorite[meteorite$nametype == 'Relict',]
ggplot() +
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_jitter(data=relict, aes(x=reclong, y=reclat), size=5, col='#ff0000', alpha=0.3) +
  theme(legend.position = c(0.1,0.3))

meteorite$log_mass <- log10(meteorite$mass)
ggplot(meteorite, aes(x=log_mass, fill=nametype, col=nametype)) + geom_density(alpha=0.7) +
  theme(legend.position = c(0.9, 0.7)) + xlab(label = 'mass(log10)')

ggplot() +
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_point(data=meteorite, aes(x=reclong, y=reclat, col=fall, size=log_mass), alpha=.2) +
  theme(legend.position = c(0.9,0.5)) +
  labs(size = 'mass(log10)')
