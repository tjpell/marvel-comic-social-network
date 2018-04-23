library(tidyverse)
library(igraph)
library(magrittr)



# There are 574467 edges and 6421 nodes

el <- read_csv("~/Downloads/hero-network.csv")
df = as.matrix(el)
g <- graph.edgelist(df,directed=FALSE) 
g

##############################################################
##############################################################


el <- read_csv("~/Downloads/hero-network.csv")

# this takes random sample of 200 edges, need to figure out 200 nodes
df <- sample_n(el, 200)

new <- rbind(as_data_frame(df$hero1), as_data_frame(df$hero2))

df = as.matrix(df)
g <- graph.edgelist(df,directed=FALSE) 

V(g)$vertex_degree <-  degree(g)

plot(g, 
     vertex.label.cex = 0.8, 
     edge.width = E(g)$weight, 
     vertex.size = V(g)$vertex_degree, 
     vertex.label=NA
)

# I got all this from https://stackoverflow.com/questions/40181355/network-graph-using-r-node-size-based-on-number-of-connected-edges?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
# this is scaling it
scale_factor <- 3
plot(g, 
     vertex.label.cex = 0.8, 
     edge.width = E(g)$weight, 
     vertex.size = V(g)$vertex_degree * scale_factor, 
     vertex.label=NA
)





