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

