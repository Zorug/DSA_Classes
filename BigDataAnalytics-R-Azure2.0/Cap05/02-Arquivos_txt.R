# Trabalhando com Arquivos txt

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/cassi/OneDrive/Programa??o/DSA/BigDataAnalytics-R-Azure2.0/Cap05")
getwd()

# Usando as funções base do R (pacote utils)
search()


# Importando arquivo com read.table()
?read.table

df1 <- read.table("pedidos.txt")
df1
dim(df1)

df1 <- read.table("pedidos.txt", header = TRUE, sep = ',')
df1
dim(df1)

df1 <- read.table("pedidos.txt", header = TRUE, sep = ',', 
                  col.names = c("var1", "var2", "var3"))
df1

df1 <- read.table("pedidos.txt", header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'))
df1

str(df1)

df1 <- read.table("pedidos.txt", header = TRUE, 
                  sep = ',', 
                  col.names = c("var1", "var2", "var3"),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = FALSE)
df1

str(df1)



# Importando arquivo com read.csv()
df2 <- read.csv("pedidos.txt")
df2
dim(df2)

df3 <- read.csv2("pedidos.txt")
df3
dim(df3)

df3 <- read.csv2("pedidos.txt", sep = ',')
df3
dim(df3)


# Importando arquivo com read.delim()
df4 <- read.delim("pedidos.txt")
df4

df4 <- read.delim("pedidos.txt", sep = ',')
df4
dim(df4)


# Importando / Exportando

#Gerando arquivo
write.table(mtcars, file = 'mtcars.txt')
dir()

df_mtcars <- read.table("mtcars.txt")
df_mtcars
dim(df_mtcars)

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()

read.table("mtcars2.txt")
df_mtcars2 <- read.table("mtcars2.txt")
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|')
df_mtcars2

df_mtcars2 <- read.table("mtcars2.txt", sep = '|', encoding = 'UTF-8')
df_mtcars2




