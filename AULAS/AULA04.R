# trabalhando com data frames e listas
meu_df <- data.frame( x = c(1:10),
                      y = LETTERS[1:10])
# DF combinam diferentes vetores, diferentes classes


# Exemplo de criação de Data Frame
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta')
)

## Nomes de colunas do nosso data.frame não possuem espaço, podem ser separadas por "." ou "_".


head(meu_data_frame) # primeiras 5 linhas
tail(meu_data_frame) # ultimas 6 linhas

meu_data_frame$nome # acessa um vetor\ coluna 
class(meu_data_frame$nome)
str(meu_data_frame) # fala a estrutura, variaveis, classes, vetores
meu_data_frame[,'idade']
meu_data_frame[,-2] # remove duas colunas
meu_data_frame$Gosta_de_bolo <- c(T, F, F, T, T, F, F, T)
meu_data_frame$constante = 'SIM'
meu_data_frame



subconjunto_df <- meu_data_frame[meu_data_frame$idade > 28, ]  # Seleciona pessoas com idade maior que 28
subconjunto_df


# Usando a função subset()
subconjunto_df <- subset(meu_data_frame, idade > 28)
subconjunto_df

subconjunto_2 <- subset(meu_data_frame, idade > 28 & Gosta_de_bolo)
subconjunto_3 <- subset(meu_data_frame, idade < 40 | Gosta_de_bolo)
dim(meu_data_frame) ## linha e coluna
nrow(meu_data_frame) ## numero de linhas 
ncol(meu_data_frame) ## numero de colunas

summary(meu_data_frame) ## função util para analizes iniciais
mean(meu_data_frame$idade)
sd(meu_data_frame$idade)
median(meu_data_frame$idade)
quantile(meu_data_frame$idade)

### exemplo da função by(
resultado <- by(meu_data_frame$salario, meu_data_frame$Gosta_de_bolo, mean)
resultado
# aula 4 acho que quanto mais o tempo passa, mais enlouquecerei aqui


# factor() para variaveis qualitativas ordinais e/ou finitas

meu_data_frame$estad_doença <- c('I', 'I', 'II', 'IV', 'II', 'III', 'I', 'IV')
as.factor(meu_data_frame$estad_doença)

#correto
meu_data_frame$estad_doença = factor(meu_data_frame$estad_doença,
                                     levels = c('IV', 'III', 'II', 'I'))
meu_data_frame$estad_doença

str(meu_data_frame)
summary(meu_data_frame)

#para saber os niveis do fator
levels(meu_data_frame$estad_doença)
# n° de niveis
nlevels(meu_data_frame$estad_doença)


tabela <- table(meu_data_frame$estad_doença,
      meu_data_frame$Gosta_de_bolo)
prop.table(table(meu_data_frame$estad_doença,
      meu_data_frame$Gosta_de_bolo),
      margin = 2)


addmargins(prop.table(table(meu_data_frame$estad_doença,
                            meu_data_frame$Gosta_de_bolo),
                      margin = 2))

margin.table(tabela, 1) # somatorio de linhas
margin.table(tabela, 2) # somatorio de colunas

chisq.test(tabela)

# lendo as 9 primeiras observações
head(Queimadas_Q1, n = 9L)

# lendo as 3 ultimas observações
tail(Queimadas_Q1, n = 3L)

# vendo quantas observações temos
nrow(Queimadas_Q1)

# vendo quantas variaveis
ncol(Queimadas_Q1)

# vendo o sumario
summary(Queimadas_Q1)

# vendo a estrutura
str(Queimadas_Q1)

# vendo os biomas afetados
unique(Queimadas_Q1)

# qual a media de av numero de dias sem chuva
# FAZER MAIS TARDE
# crio um vetor para achar os estados pelo nome e deixo em maiusculo pois M != m, 
# os estados estão em maiusculo. isso para o norte e o sul
Estados_Sul <- c('paraná', 'santa catarina', 'rio grande do sul')
Estados_Sul = toupper(Estados_Sul)

Estados_do_Norte <- c('acre', 'amapá', 'amazonas', 'rondônia', 'roraima', 'tocantins')
Estados_do_Norte = toupper(Estados_do_Norte)

# aqui tenho que criar uma nova variavel que é um sub data frame, coloco a 
# condição a ser atendida. a virgula indica que as outras colunas devem ser adicionadas

Sub_estados_sul = Queimadas_Q1[Queimadas_Q1$estado == Estados_Sul, ]

Sub_estados_norte = Queimadas_Q1[Queimadas_Q1$estado == Estados_do_Norte, ]

# aqui faço as medias das colunas desejadas

media_estados_norte <- mean(Sub_estados_norte$avg_numero_dias_sem_chuva)
media_estadossul <- mean(Sub_estados_sul$avg_numero_dias_sem_chuva)


# criando um data table

library(data.table)
meu_data_table <- data.table(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_data_table


# Importar um data.table e comparando o tempo de importação com o read.csv

system.time(Queimadas <- fread("data/FireWatch/Dataset_FireWatch_Brazil_2024.csv"))
# como não tenho o arquivo usado. Apenas noto que a diferença de um data frame para
# um data table na velocidade é de 

# Data frame 
# user  system elapsed 
# 0.103   0.008   0.026  

# data table
#  user  system elapsed 
# 0.802   0.044   0.216 

# filtrando uma data table [i,j,by] 
# i = linhas
# j = colunas
# by = agrupamento de dados

resultados <- meu_data_table[idade > 25, .(nome, salario)]
resultados


# ver do capitulo 3.8.2 até o fim