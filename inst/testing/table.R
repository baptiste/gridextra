library(gridExtra)
library(grid)

d <- head(iris[,1:3])
d[2,3] <- "this is very wwwwwide"
d[1,2] <- "this\nis\ntall"
colnames(d) <- c("alpha*integral(xdx,a,infinity)", 
                 "this text\nis high", 'alpha/beta')

tt1 <- ttheme_default(core=list(fg_params=list(fontface=3)))
tt2 <- ttheme_minimal()
tt3 <- ttheme_minimal(core=list(bg_params = list(fill = blues9, 
                                                 col=NA)), 
                      colhead=list(fg_params=list(col="navyblue")))

grid.newpage()
g <- tableGrob(iris[1:4, 1:3], theme=tt2)
separators <- replicate(ncol(g) - 2, 
                     segmentsGrob(x1=unit(0,"npc")), 
                     simplify=FALSE)
g <- gtable::gtable_add_grob(g, grobs = separators, 
                     t = 1, b = nrow(g), l = seq_len(ncol(g)-2)+2)
grid.draw(g)

grid.arrange(
  tableGrob(iris[1:4, 1:2], theme=tt1),
  tableGrob(iris[1:4, 1:2], theme=tt2),
  tableGrob(iris[1:4, 1:2], theme=tt3),
  nrow=1)
