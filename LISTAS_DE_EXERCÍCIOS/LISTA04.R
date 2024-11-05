#  Lista de Exercícios 04

library(tidyverse)
require(data.table)
require(dplyr)

# 1. Utilizando o banco de dados `Queimadas`, crie uma tabela com a contagem de incêndios por estado.

queimadas <- read.csv("~/CE302/ce302/bancos de dados/Dataset_FireWatch_Brazil_Q1_2024.csv")

tabela_estado <- queimadas %>% 
  group_by(estado) %>% 
  summarise(n = n(),)
tabela_estado

# o group_by seleciona uma coluna de interesse
# summarise faz as estatisticas de cada valor unico, com base no que é pedido
# no nosso caso queremos o total de ocorrencias de incendio, que é contabilizado por
# n = n()



# 2. Qual o número de queimadas por região?



norte <- c("RONDÔNIA", "AMAZONAS", "RORAIMA", "PARÁ", "TOCANTINS", "ACRE", "AMAPÁ")

nordeste <- c("MARANHÃO", "PIAUÍ", "CEARÁ", "PERNAMBUCO", "ALAGOAS", "SERGIPE", "BAHIA", "MINAS GERAIS", "SÃO PAULO")

sudeste <- c("SÃO PAULO", "RIO DE JANEIRO", "ESPÍRITO SANTO", "MINAS GERAIS")

sul <- c("PARANÁ", "SANTA CATARINA", "RIO GRANDE DO SUL")

centro_oeste <- c("MATO GROSSO DO SUL", "MATO GROSSO", "GOIÁS", "DISTRITO FEDERAL")

nordeste <- c("MARANHÃO", "PIAUÍ", "CEARÁ", "PERNAMBUCO", "ALAGOAS", "SERGIPE", 
              "BAHIA")
região <- c('NORTE', 'SUDESTE', 'SUL', 'NORDESTE', 'CENTRO-OESTE')

queimadas %>%
  select(estado) %>%
  str_replace(., 'RONDÔNIA|AMAZONAS|RORAIMA|PARÁ|TOCANTINS|ACRE|AMAPÁ', 'NORTE') 

# queimadas %>%
#   select(estado) %>%
#   mutate(regiões = str_replace(estado, '(RONDÔNIA|AMAZONAS|RORAIMA|PARÁ|TOCANTINS|ACRE|AMAPÁ)|(SÃO PAULO|RIO DE JANEIRO|ESPÍRITO SANTO|MINAS GERAIS)|(PARANÁ|SANTA CATARINA|RIO GRANDE DO SUL)|(MARANHÃO|PIAUÍ|CEARÁ|PERNAMBUCO|ALAGOAS|SERGIPE|BAHIA)|(MATO GROSSO DO SUL|MATO GROSSO|GOIÁS|DISTRITO FEDERAL)', região))




 



# 3. Para a região com maior número de queimadas, identifique: 

#  a. A cidade com maior número de queimadas.

#  b. A data com maior número de queimadas.

#  c. O mês com maior número de queimadas.




 
# 4. Quantas cidades tiveram risco de fogo acima de 90% no mês de julho?





# 5. Qual a média de risco de fogo por estado?
