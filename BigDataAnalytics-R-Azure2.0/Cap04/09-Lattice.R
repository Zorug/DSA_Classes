# Lattice

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/cassi/OneDrive/Programa��o/DSA/BigDataAnalytics-R-Azure2.0/Cap04")
getwd()

# O pacote Lattice é um sistema de visualização de dados 
# de alto nível poderoso e elegante, com ênfase em dados 
# multivariados. 

# Na criação de gráficos, condições e agrupamentos são 2 conceitos
# importantes, que nos permitem compreender mais facilmente
# os dados que temos em mãos. O conceito por trás do Lattice
# é agrupar os dados e criar visualizaçãoes de forma que fique 
# mais fácil a busca por padrões.

# Instala e carrega o pacote
install.packages('lattice')
library(lattice)

# ScatterPlot com Lattice
View(iris)
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

# BarPlots com dataset Titanic
?Titanic

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = "Dados Titanic", columns = 2))

barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic),
         groups = Survived, stack = T, layout = c(4, 1),
         auto.key = list(title = "Dados Titanic", columns = 2),
         scales = list(x = "free"))


# Contagem de elementos
PetalLength <- equal.count(iris$Petal.Length, 4)
PetalLength

# ScatterPlots
xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris)


xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(...) {
         panel.grid(h = -1, v = -1, col.line = "skyblue")
         panel.xyplot(...)})


xyplot(Sepal.Length~Sepal.Width | PetalLength, data = iris,
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         mylm <- lm(y~x)
         panel.abline(mylm)})


histogram(~Sepal.Length | Species, xlab = "",
          data = iris, layout=c(3,1), type = "density",
          main = "Histograma Lattice", sub = "Iris Dataset, Sepal Length")


# Distribuição dos dados
qqmath(~ Sepal.Length | Species, data = iris, distribution = qunif)


# Boxplot
bwplot(Species~Sepal.Length, data = iris)


# ViolinPlot
bwplot(Species~Sepal.Length, data = iris,
       panel = panel.violin)



