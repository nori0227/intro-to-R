##################################
######## 1.1 Intro to R Lesson ###
##################################

# Feb 16th, 2016

# Interacting with R

## I am adding 3 and 5. R is fun!
3+5

x <- 3

y <- 5

x + y

number <- x + y

### exercises 1.1 ###

x <- 5

number <- x + y

y <- 10

number <- x + y


########################################
#### 1.2 R Syntex & Data Structures ####
########################################

## Vector
# Create a numeric vector and store the vector as a variable called 'glengths'
glengths <- c(4.6, 3000, 50000)
glengths  ### vector starts at element 1 and ends at element 3 (i.e. vector contains 3 values) as denoted by the [1:3] in environment.

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")
species

# Forget to put quotes around corn
species <- c("ecoli", "human", corn)

# Create a character vector and store the vector as a variable called 'species'
species <- c("ecoli", "human", "corn")

### exercises 1.2 VECTOR ###

#create a vector of numeric and character values by combining the two vectors that we just created (glengths and species)
combined <- c("glengths", "species")

## Factors -- used to store categorical data
# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

### exercises 1.2 FACTORS ###
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
samplegroup <- factor(samplegroup)

##Dataframe --data.frame is the de facto data structure for most tabular data and what we use for statistics and plotting.
# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)
df

### exercises 1.2 Data Frame ###
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)

favorite_books <- data.frame(titles, pages)
favorite_books

##Lists -- put all of those into one list object by using the list() function and placing all the items you wish to combine within parentheses
list1 <- list(species, df, number)
list1

### exercises 1.2 LISTS ###
list2 <- list(species, glengths, number)
list2

##################################
######## 1.3 Functions in R ######
##################################
# functions - process data, and return a result

# function_name(input)

# adding another item to either end of glengths
glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning

#sqrt() -- input/argument must be a number, and the output is the square root of that number
sqrt(81)

sqrt(glengths)

round(3.14159)

## Seeking help on arguments for functions

?round

args(round)

example("round")

round(3.14159, digits=2)
also,
round(3.14159, 2)

### exercises 1.2 Functions ###
test <- c(1, NA, 2, 3, NA, 4)
mean(test, na.rm = TRUE)
sort(test, decreasing = TRUE)

## User-defined Functions

# name_of_function <- function(argument1, argument2) {
# statements or code that does something
# return(something)
# }

square_it <- function(x) {
  square <- x * x
  return(square)
}
square_it(5)

### exercises 1.2 User Defined Functions ###
multiply_it <- function(x, y) {
  multiply <- x * y
  return(multiply)
}

multiply_it(x=4,y=6)


#########################################
#### 1.4 Data Subsetting with base R ####
#########################################


## Reading data into R
?read.csv

#The separator - in the case of read.table() it is sep = "" (space or tab) & whereas for read.csv() it is sep = "," (a comma).
#The header - This argument refers to the column headers that may (TRUE) or may not (FALSE) exist in the plain text file you are reading in.

## Create a data frame by reading in the file
metadata <- read.csv(file="data/mouse_exp_design.txt")
metadata

## Exercise 1.4.1
proj_summary <- read.table(file="data/project-summary.txt")
proj_summary

##Inspecting data structures
head(metadata)

## Exercise 1.4.2
class(glengths)
class(metadata)

summary(proj_summary)

length(samplegroup)

dim(proj_summary)

rownames(metadata)

ncol(proj_summary)

#### PRACTICE EXERCISES I: DAY 2 ACTIVITIES #####

temp_conv <- function(temp_f) {
  temp_k <- ((temp_f -32) * 5 / 9) + 273.15
  return(temp_k)
}
temp_conv(70)

round(temp_conv(70), 1)
#########################################
############### PART 2  #################
#########################################

##### 2.1 DATA WRANGLING: SUBSETTING VECTORS AND FACTORS 

age <- c(15, 22, 45, 52, 73, 81)

age[5]

age[-5]

age[c(3,5,6)]   ## nested

# OR

## create a vector first then select
idx <- c(3,5,6) # create vector of the elements of interest
age[idx]

age[1:4]

age[4:1]

## Exercise 2.1.1 
alphabets <- c("C", "D", "X", "L", "F")
alphabets[c(1,2,5)]
alphabets[-3]
alphabets[5:1]

age > 50

age > 50 | age < 18

age

age[age > 50 | age < 18]  ## nested

# OR

## create a vector first then select
idx <- age > 50 | age < 18
age[idx]


which(age > 50 | age < 18)

age[which(age > 50 | age < 18)]  ## nested

# OR

## create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

expression[expression == "high"]    ## This will only return those elements in the factor equal to "high"

## Exercise 2.1.2 
samplegroup[which(samplegroup != "KO")]

## Releveling factors
expression

str(expression)

expression <- factor(expression, levels=c("low", "medium", "high"))     # you can re-factor a factor 

str(expression)

str(samplegroup)

## Exercise 2.1.3
samplegroup <- factor(samplegroup, levels=c("KO", "CTL", "OE"))
str(samplegroup)

####  2.2 PACKAGES AND LIBRARIES  

sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages

install.packages("ggplot2")

library(ggplot2)

sessionInfo()

install.packages("tidyverse")

####  DATA WRANGLING: DATA FRAMES, MATRICES AND LISTS  

# Extract value 'Wt'
metadata[1, 1]

# Extract value '1'
metadata[1, 3] 

# Extract third row
metadata[3, ] 

# Extract third column
metadata[ , 3]   

# Extract third column as a data frame
metadata[ , 3, drop = FALSE] 

# Dataframe containing first two columns
metadata[ , 1:2] 

# Data frame containing first, third and sixth rows
metadata[c(1,3,6), ] 

# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"] 

# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)

# Extract the genotype column
metadata$genotype 

# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

metadata[c("sample2", "sample8"), c("genotype", "replicate")]

metadata$genotype[c(1,9)]

metadata[ , 3, drop = FALSE]

metadata$celltype == "typeA"

logical_idx <- metadata$celltype == "typeA"

metadata[logical_idx, ]

which(metadata$celltype == "typeA")

idx <- which(metadata$celltype == "typeA")

metadata[idx, ]

which(metadata$replicate > 1)

idx <- which(metadata$replicate > 1)

metadata[idx, ]

metadata[which(metadata$replicate > 1), ]

sub_meta <- metadata[which(metadata$replicate > 1), ]

metadata[which(metadata$genotype == "KO"), ]

list1[[2]]

comp2 <- list1[[2]]
class(comp2)

list1[[1]]

list1[[1]][1]

list1

random <- NULL

random

random <- list(c(metadata, age, list1, samplegroup, number))
random[[1]]

names(list1)

# Name components of the list
names(list1) <- c("species", "df", "number")

names(list1)

# Extract 'df' component
list1$df

names(random)

names(random) <- c("metadata")
names(random)


IntroR.R
/Users/nuri/HHA-507-2022/intro-to-R/IntroR.R