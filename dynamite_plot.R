# I couldn't find an easy way to make a dynamite plot in Python, so I grabbed this R code from 
# https://github.com/sdjbrown/publicFiles/blob/master/dynamitePlot.R

dynamitePlot <- function(height, error, names = NA, 
        significance = NA, ylim = c(0,maxLim), …){
    maxLim <- 1.1* max(mapply(sum, height, error))
    bp <- barplot(height, names.arg = names, ylim = ylim, ...)
    arrows(x0 = bp, y0 = height, y1 = height + error, angle = 90)
    text(x = bp, y = 0.2 + height + error, labels = significance)
}

 df = read.csv("mean.csv",header=TRUE)
 dynamitePlot(df$Mean,df$Std,df$Target,ylab="pIC50")