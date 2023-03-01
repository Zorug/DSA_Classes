# Fatores

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/cassi/OneDrive/Programa��o/DSA/BigDataAnalytics-R-Azure2.0/Cap03")
getwd()

vec1 <- c("Macho","Femea","Femea","Macho","Macho")
vec1
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)

# Variáveis categóricas nominais
# Não existe uma ordem implícita
animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais
class(animais)
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)

# Variáveis categóricas ordinais
# Possuem uma ordem natural
grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
fac_grad
levels(fac_grad)

# Sumarizar os dados fornece uma visão geral sobre o conteúdo das variáveis
summary(fac_grad)
summary(grad)

vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "M", "F", "F", "M", "M")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femea", "Macho")
fac_vec2
summary(fac_vec2)
summary(vec2)


# Mais exemplos
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata


rdata = factor(data, labels = c("I","II","III"))
rdata

# Fatores Não-Ordenados
set1 <- c("AA", "B", "BA", "CC", "CA", "AA", "BA", "CC", "CC")
set1

# Transformando os dados. 
# R apenas criou os níveis, o que não significa que exista uma hierarquia.
f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)

# Fatores Ordenados
o.set1 <- factor(set1, 
                 levels = c("CA", "BA", "AA", "CC", "B"), 
                 ordered = TRUE)

o.set1
is.ordered(o.set1)

as.numeric(o.set1)
table(o.set1)


# Fatores e Dataframes
df <- read.csv2("etnias.csv", sep = ',')
View(df)


# Variáveis do tipo fator
str(df)

# Níveis dos fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (em ordem alfabética)
# e agrupa as estatísticas por níveis. Agora, se fizermos sumarização de estatísticas, é possível visualizar 
# a contabilização para cada categoria
levels(df$Etnia)
summary(df$Etnia)


# Plot
# Agora se fizermos um plot, temos um boxplot para estas variáveis categóricas
plot(df$Idade~df$Etnia, xlab = 'Etnia', ylab = 'Idade', main = 'Idade por Etnia')


# Regressão
summary(lm(Idade~Etnia, data = df))

# Convertendo uma coluna em variável categórica. Isso criará um fator não-ordenado
df
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df
str(df)



