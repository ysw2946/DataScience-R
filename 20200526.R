library(igraph)
G_star <- make_star(6,mode="undirected",center=1) %>%
  set_vertex_attr("name",value=c("A","B","C","D","E","F"))
plot(G_star,vertex.color=rainbow(6),vertex.size=60)
tkplot(G_star,vertex.color=rainbow(6),vertex.size=20)

G_ring <- make_ring(6,directed=F,circular=T) %>%
  set_vertex_attr("name",value=c("A","B","C","D","E","F"))
tkplot(G_ring,vertex.color=rainbow(6),vertex.size=20)

G.Y <- make_graph(edges=NULL,n=NULL,directed=F)
G.Y <- G.Y+vertices("A","B","C","D","E","F")
G.Y <- G.Y + edges("A","B",
                   "A","C",
                   "A","D",
                   "D","E",
                   "E","F")
tkplot(G.Y,vertex.color=rainbow(6),vertex.size=20)

degree(G_star,normalized=F)
degree(G_star,normalized=T)

CD <- centralization.degree(G_star,normalized=F) ; CD
CD$centralization
Tmax <- centralization.degree.tmax(G_ring)
CD$centralization/ Tmax

graph.density(G_star)
graph.density(G.Y)
graph.density(G_ring)

shortest.paths(G.Y)

distances(G.Y, v="A", to="E")

get.shortest.paths(G.Y,"A","E")$vpath[[1]]

average.path.length(G.Y)


df.fb <- read.table(file.choose(),header = F)
head(df.fb)

G.fb <- graph.data.frame(df.fb,directed = F)
par(mar=c(0,0,0,0))
plot(G.fb,
     vertex.label=NA,
     vertex.size=10,
     vertex.color=rgb(0,1,0,0.5))

V(G.fb)$name

v.set <- V(G.fb)$name[1:50]
G.fb.part <- induced.subgraph(G.fb,v=v.set)
tkplot(G.fb.part,
       vertex.label.cex=1.2,
       vertex.size=degree(G.fb.part)*1.5,
       vertex.color="yellow",
       vertex.frame.color="gray")

v2 <- which(V(G.fb)$name=="1")

v.set <- neighbors(G.fb,v=v2)

v3 <- c(v2,v.set)

G.fb.id <- induced.subgraph(G.fb,v=v3)
V(G.fb.id)$color <- ifelse(V(G.fb.id)$name=="1","red","yellow")
tkplot(G.fb.id,
       vertex.label.cex=1.2,
       vertex.size=degree(G.fb.id)*1.5,
       vertex.frame.color="gray")

v.max <- V(G.fb)$name[degree(G.fb)==max(degree(G.fb))]

degree(G.fb,v.max)
v.max.idx <- which(V(G.fb)$name==v.max)

v.set <- neighbors(G.fb,v=v.max.idx)
v3 <- c(v.max.idx,v.set)
G.fb_2 <- induced_subgraph(G.fb,v=v3)
V(G.fb_2)$color <- ifelse(V(G.fb_2)$name==v.max,"red","yellow")
V(G.fb_2)$label <- ifelse(V(G.fb_2)$name==v.max,v.max,NA)
V(G.fb_2)$size <- ifelse(V(G.fb_2)$name==v.max,50,5)
plot(G.fb_2)


degree(G.fb,normalized = FALSE)
degree(G.fb,normalized = TRUE)

CD <- centralization.degree(G.fb,normalized = F)
CD$centralization

Tmax <- centralization.degree.tmax(G.fb)
Tmax

CD$centralization/Tmax

closeness(G.fb,normalized = F)

closeness(G.fb,normalized = T)

CB <- centralization.closeness(G.fb,normalized = F)
n <- vcount(G.fb)

CB$centralization/(n-1)

CB$theoretical_max/(n-1)

CB$centralization/CB$theoretical_max

betweenness(G.fb,normalized = F)

closeness(G.fb,normalized = T)

CB <- centralization.betweenness(G.fb,normalized = F)
CB$centralization

CB$theoretical_max

CB$centralization/CB$theoretical_max

graph.density(G.fb)

shortest.paths(G.fb)[1:10,1:10]


distances(G.fb,v="3",to="7")

get.shortest.paths(G.fb,"3","7")$vpath[[1]]

average.path.length(G.fb)

plot(degree(G.fb),
     xlab = "사용자 ID",ylab="연결 정도",
     main="사용자별 연결정도",
     type="h")

x <- degree(G.fb,normalized = F)
summary(x)

hist(x,
     xlab = "연결 정도",ylab="빈도",
     main="연결정도 분포",
     breaks=seq(0,max(x),by=1))

G.fb.dist <- degree.distribution(G.fb)
plot(G.fb.dist,
     type = "h",
     xlab = "연결정도 분포",ylab="확률밀도",
     main="연결정도 분포")


