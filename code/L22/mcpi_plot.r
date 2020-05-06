library(ggplot2)

n.pts = 10000

xval = runif(n.pts, min = -1, max = 1)
yval = runif(n.pts, min = -1, max = 1)

#find the points inside the unit circle
incircle = ((xval^2 + yval^2) <= 1)

#make a dataframe
df = data.frame(xval,yval,incircle)

#plot
gg = ggplot(df,aes(x=xval,y=yval)) + #define data
     geom_point(aes(col=incircle)) + #scatter plot with incircle as colors
     xlim(c(-1, 1)) + #x limits
     ylim(c(-1, 1)) + #y limits
     coord_fixed()  + #square axes
     labs(title="Monte Carlo Pi",
       x="x", 
       y="y")

#save plot (use cairo on ARC systems since you don't have a GUI)
ggsave("pi.png", plot=gg, type="cairo")

#check pi approximation
cat(sprintf("pi is approximately: %8.6f\n",4*sum(df$incircle)/n.pts))
