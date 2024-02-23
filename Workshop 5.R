beetles1 <- read.csv("dung_beetles_v1.csv")
beetles1

beetles2 <- read.csv("dung_beetles_v2.csv")
beetles2

beetles3 <- read.csv("dung_beetles_v3.csv")
beetles3

beetles4 <- read.csv("dung_beetles_v4.csv")
beetles4

usites <- unique(beetles1$Site) #Unique function finds all of the unique values
length(usites) #Length function counts the length of the vector i.e. how many unique values there are
colnames(beetles1)[3:ncol(beetles1)] #Prints the names of the species from the 3rd column to the last column of 'beetles1'

usites <- unique(beetles3$spp)
length(usites) #Uses unique and length functions to count the number of species in 'beetles3'

usites <- unique(beetles4$Site) #'beetles4' is the only table that lets you count all unique values for Sites, Months and Species
length(usites)

str(beetles4) #Lets us know num of observations and variables in dataset, as well as the type of data of each variable e.g. integer
summary(beetles4) #Lets us know the length of each character column, and measures of central tendency for integer columns
head(beetles4) #Lets us view the first few rows of the dataset
View(beetles4) #Lets us view the dataset in a spreadsheet style table

beetlesdf <- read.table("dung_beetles_read_1.csv", sep=",",header=T) #The separator and header are usually set by default in read.csv. Sep=',' means that the values are separated by commas in the data file
beetlesdf

?read.table

beetles2df <- read.table("dung_beetles_read_2.txt", sep="\t",header=T) #This data set has tab separated values
beetles2df

beetles3df <- read.table("dung_beetles_read_3.txt", sep="\t",header=T, skip=1) #The skip function lets us skip n number of lines before beginning to read the data
beetles3df

library(tidyr) #Makes the functions from this package available for use in this R session
?fill

fill(beetlesdf,Site) #The fill function lets us fill in missing values in (data, selected columns)
beetlesdf <- fill(beetlesdf,Site) #Overwrites the original table with the fixed filled in version

beetlesdf2 <- read.table("dung_beetles_read_4.txt", sep="\t",header=T, na.strings="-") #The na.strings function interprets chosen character vectors as NA
beetlesdf2
beetlesdf2 <- fill(beetlesdf2, Site)
beetlesdf2

beetlesdf <- read.table("dung_beetles_read_1.csv", sep=",",header=T) %>% fill(Site) #The %>% symbol (called a pipe) joins the read.table function directly to the fill function
beetlesdf

?pivot_longer
pivot_longer(data=beetlesdf, cols = c("Caccobius_bawangensis", "Catharsius_dayacus", "Catharsius_renaudpauliani", "Copis_agnus", "Copis_ramosiceps", "Copis_sinicus", "Microcopis_doriae", "Microcopis_hidakai"),names_to="Spp") #The pivot_longer function increases the num of rows and decreases num of columns (to get rid of column names that are values and not variable names)

pivot_longer(data=beetlesdf, cols = 3:10, names_to="Spp") #Performs the same pivot as above, but selecting columns using their numerical index

pivot_longer(data=beetlesdf, cols = starts_with("C"), names_to="Spp") #Selects columns which start with the letter C

pivot_longer(data=beetlesdf, cols = contains("_"), names_to="Spp", values_to="Count") #Uses selection helper to select all species values. Values_to argument specifies the name of the new column

casesdf <- read.table("WMR2022_reported_cases_1.txt",sep="\t", header=T, na.strings="") %>% fill(country)
casesdf
pivot_wider(casesdf,names_from="method",values_from ="n") #Does the opposite of pivot_longer

?pivot_wider

Challenge <- read.table("WMR2022_reported_cases_2.txt",sep="\t", header=T, na.strings="") %>%
  fill(country) %>%
  pivot_longer(cols=3:last_col(), names_to="years") %>%
  pivot_wider(names_from="method", values_from="value")
Challenge
names(Challenge)

sessionInfo()