beetles1 <- read.csv("dung_beetles_v1.csv")
beetles1

beetles2 <- read.csv("dung_beetles_v2.csv")
beetles2

beetles3 <- read.csv("dung_beetles_v3.csv")
beetles3

beetles4 <- read.csv("dung_beetles_v4.csv")
beetles4

usites <- unique(beetles1$Site)
length(usites)
colnames(beetles1)[3:ncol(beetles1)]

usites <- unique(beetles3$Site)
length(usites)
colnames(beetles3)[3:ncol(beetles3)]

usites <- unique(beetles2$Site)
length(usites)
colnames(beetles2)[3:ncol(beetles2)]

usites <- unique(beetles4$Site)
length(usites)
colnames(beetles4)[3:ncol(beetles4)]

str(beetles4) 
summary(beetles4)
head(beetles4)
View(beetles4)

beetlesdf <- read.table("dung_beetles_read_1.csv", sep=",",header=T)
beetlesdf

beetles2df <- read.table("dung_beetles_v2.csv", sep=",",header=T)

beetles3df <- read.table("dung_beetles_v3.csv", sep=",",header=T)

library(tidyr)
?fill

fill(beetlesdf,Site)
beetlesdf <- fill(beetlesdf,Site)

beetlesdf <- read.table("dung_beetles_read_1.csv", sep=",",header=T) %>% fill(Site)

?pivot_longer
pivot_longer(data=beetlesdf, cols = c("Caccobius_bawangensis", "Catharsius_dayacus", "Catharsius_renaudpauliani", "Copis_agnus", "Copis_ramosiceps", "Copis_sinicus", "Microcopis_doriae", "Microcopis_hidakai"),names_to="Spp")

pivot_longer(data=beetlesdf, cols = starts_with("C") )

casesdf <- read.table("WMR2022_reported_cases_1.txt",sep="\t")
casesdf

pivot_wider(casesdf,names_from="method",values_from ="n")

sessionInfo()