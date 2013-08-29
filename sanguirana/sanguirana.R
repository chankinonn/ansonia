# Set working directory
setwd("~/Desktop/sanguirana")

# Load combined dataset
combined <- read.csv(file="combined.csv", header=T)

### Test for normality
# Convert data frame to matrix
mat <-t(combined[4:19])

# Multivariate normality test
mshapiro.test(mat)

# Transform to log
combined.log <- log10(combined[4:19])

### Write output to csv
# Combine columns 1 and 2 (species, sex) into transformed dataset
combined.log.out <- cbind(combined[1:2], combined.log)
write.csv(combined.log.out, "combined.log.csv", row.names=F)

### ANCOVA for sexual dimorphism
# Load albotuberculata dataset
albotuberculata <- read.csv(file="albotuberculata.csv", header=T)

# Perform ANCOVA with SVL as covariate. Do for every character
anc=aov(HL~SVL+sex, data=albotuberculata)
summary(anc)

### ANCOVA for visayan/everetti male
visayan.everetti.male <- read.csv(file="visayan_everetti.male.csv")
anc=aov(HL ~ SVL + SPECIES, data=visayan.everetti.male)
summar(anc)

