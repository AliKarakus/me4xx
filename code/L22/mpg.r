library(ggplot2)
data("mpg", package = "ggplot2")

#mpg is a tibble. make it a dataframe
mpg = as.data.frame(mpg)

#view the data frame
str(mpg)

#pick out a column
mpg[["cty"]] # or mpg$cty

#see two columns
mpg[,c("cty","hwy")]

#find the mean of the columns
sapply(mpg[,c("cty","hwy")],FUN=mean)

#city mpg
ctympg=mpg[["cty"]]

#subset: get a list of cars with city mpg > 20
mpg[ctympg > 20,]

#summarize: get average mpg by manufacturer
library(plyr)
mpgByMfr = ddply(mpg,"manufacturer",summarise,cty=mean(cty),hwy=mean(hwy))
mpgByMfr 

#sort: sort by highway mpg (note minus sign for descending)
mpgByMfr = mpgByMfr[order(-mpgByMfr$hwy),]
mpgByMfr

#write the results to file
write.csv(mpgByMfr,file="mpgByMfr.csv",row.names = FALSE)

#read it back in for fun
mpgByMfr2 = read.csv(file="mpgByMfr.csv", stringsAsFactors = FALSE)
mpgByMfr2
