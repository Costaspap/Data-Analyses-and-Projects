# I did one change before i load the data, i deleted the blank lines
# in the original dataset, i will attach my data.txt with the e-mail.

# So first i load the data. We don't have headers and we don't want
# factors, so:

data = read.table("data.txt", header = F, strin = F)
names(data) = "Tosses"

# Lets make sure every row has 50 characters

lapply(data,nchar)

# We will keep only the head occurences

heads = sapply(data,function(x) gsub("T","",x))

# We find the number of heads

nheads = apply(heads,2,nchar)

# Find the head propability for each experiment

headprop = nheads/50

# Lets make them look nice
headprop = sort(headprop)

# Now we take a look at our data

hist(headprop,col="red")

# I am going to use k-means clustering. I chose the initial centers
# based on the histogram.

k=kmeans(headprop,c(0.23,0.35,0.48,0.8),iter.max=10)

# K-means clustering with 4 clusters of sizes 18, 25, 15, 34

# Cluster means:
 
# Coin 1:  0.2388889
# Coin 2:  0.3472000
# Coin 3:  0.5026667
# Coin 4:  0.8058824

# Within cluster sum of squares by cluster:
# [1] 0.02997778 0.02950400 0.03189333 0.12922353
#  (between_SS / total_SS =  95.7 %)

# ===========================================Results============================================================

# So my best estimates for each coin's head propability are:

# Coin 1:  0.2388889
# Coin 2:  0.3472000
# Coin 3:  0.5026667
# Coin 4:  0.8058824

# After experimenting with many different centers, those gave me the
# highest reduction in sum of squares, 95,7%
