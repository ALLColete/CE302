# aqui veremos o capitulo 4 (sendo mais organizado que os outros Alexandres)
# que é sobre o tidyverse

Brasil <- read.csv("/home/est/alelc24/CE302/ce302/bancos de dados/Brazil Total highway crashes 2010 - 2023.csv.gz")
mental_healh <- readr::read_csv("/home/est/alelc24/CE302/ce302/bancos de dados/Mental Health Dataset.csv")
class(mental_healh)
head(mental_healh) # fala que tem 6 linhas por causa do head()
glimpse(mental_healh)
Poland <- subset(mental_healh, Country =="Poland")
Coluna <-mental_healh[,c("Country","Gender")]



## Pipe

x <- seq(1:10)
y <- sqrt(x)
z <- log(y)

# ao inves de perder tempo criando y e z é recomendavel outros caminhos para big data

tan(
  cos(
    log(
      sqrt(
      x
      )
    )
  )
)


# no R o pipe é escrito como |>, ou, Ctrl shift M %>%, leia que %>% fala o que é para ser executado
# assim como se le qualquer coisa

x %>%
  sqrt() %>%
  log() %>%
  cos() %>% 
  tan()


# exemplo
require(magrittr)

set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)     

# pipe de atribuição %>% 

require(dplyr)
## Atribuição explicita
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>%
  mutate(idade_25 = idade > 25)

meu_data_frame = meu_data_frame %<>% 
  mutate(idade_50 = idade >50)

# o mutate cria uma coluna nova com base em uma condição

glimpse(meu_data_frame)
meu_data_frame

# tambem é possivel ler com o fread()
car_crash <- read.csv("/home/est/alelc24/CE302/ce302/bancos de dados/Brazil Total highway crashes 2010 - 2023.csv.gz")


car_crash %>% 
  select(onibus, moto) #filtra as linhas com onibus e moto

car_crash %>% 
  select(c(1:14))

car_crash %>% 
  select(-onibus) # filtra tudo menos o onibus

car_crash %>% 
  select(ends_with("feridos")) # seleciona todas as variaveis que terminas com feridos

car_crash %>% 
  select(contains("_"))

car_crash %>% 
  select(where(is.numerical))

car_crash %>% 
  mutate(tipo_log = tipo_de_ocorrencia == "sem vitima") %>% 
  select(where(is.logical)) %>% 
  glimpse()


