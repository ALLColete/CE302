require(data.table)
require(dplyr)
require(tidyr)

car_crash <- read.csv("bancos de dados/Brazil Total highway crashes 2010 - 2023.csv.gz")


# a função select seleciona e ou filtra as colunas, não as linhas
# group by seleciona as colunas
# filter filtra as linhas


car_crash %>% 
  select(moto)

car_crash %>% 
  select(moto, automovel, data) %>% 
  filter(moto > 2 | automovel ==2) %>% 
  head()



car_crash %>% 
  group_by(tipo_de_ocorrencia) %>% 
  summarise(media = mean(automovel, na.rm = T),
  n = n()) %>% View()

# group by torna a coluna selecionada como uma especie de indice

# summarise adiciona colunas

car_crash %>% 
  filter(tipo_de_ocorrencia %in% c('sem vítima', 'com vítima')) %>% 
  group_by(tipo_de_ocorrencia) %>% 
  summarise(media_carros = mean(automovel, na.rm = T),
            media_motos = mean(moto, na.rm = T),
            media_carros = median(automovel, na.rm = T),
            n = n(),
            quantil_25 = quantile(automovel, 0.25, na.rm = T)) %>% 
  arrange(n)

# arrange(n) mostra as linhas em ordem

car_crash %>% 
  filter(tipo_de_ocorrencia %in% c('sem vítima', 'com vítima') &
           tipo_de_acidente %in% c('Colisão Traseira', 'Saida de Pista')) %>% 
  group_by(tipo_de_ocorrencia, tipo_de_acidente) %>% 
  summarise(media_carros = mean(automovel, na.rm = T),
            media_motos = mean(moto, na.rm = T),
            media_carros = median(automovel, na.rm = T),
            n = n())  %>% 
  arrange(n)


data_string <- '23/10/2024'
data <- as.Date(data_string,
                format = '%d/%m/%Y')
print(data)

data + 31
# a soma com as datas, qualquer numero  mais a data é visto como dias


data1 <- as.Date("2023-08-21")
data2 <- as.Date("2023-08-15")
data1 > data2  # Verifica se data1 é posterior a data2


data <- as.Date("2023-08-21")
ano <- format(data, "%Y")
mes <- format(data, "%m")
dia <- format(data, "%d")
dia



data1 <- as.Date("2023-08-21")
data2 <- as.Date("2023-08-15")
diferenca <- difftime(data1, data2, units = "days")  # Diferença em dias a metrica referencia é dada por units
diferenca_alternativa <- as.numeric(days(data1-data2))

install.packages('lubridate')
require(tidyr)
require(lubridate)
data_ymd <- ymd("2023-08-21")
data_mdy <- mdy("08-21-2023")
data_dmy <- dmy("21-08-2023")

print(data_ymd)

data <- ymd("2024-10-23")
data_nova <- data + days(7)  # Adiciona 7 dias
data_anterior <- data - months(2)  # Subtrai 2 meses

print(data_nova)


data <- ymd_hms("2023-08-21 15:30:45")
data
ano <- year(data)
mes <- month(data)
dia <- day(data)
hora <- hour(data)
awdsminuto <- minute(data)
segundo <- second(data)

print(ano)

data1 <- ymd("2023-08-21")
data2 <- ymd("2023-08-15")
diferenca_em_dias <- as.numeric(data2 - data1)
diferenca_em_semanas <- as.numeric(weeks(data2 - data1))

print(diferenca_em_dias)


# Data original no fuso horário de Nova Iorque
data_ny <- ymd_hms("2023-08-21 12:00:00", tz = "America/New_York")

# Converter para o fuso horário de Londres
data_london <- with_tz(data_ny, tz = "Europe/London")

print(data_ny)


# JUNÇÃO DE DADOS

require(nycflights13)
airlines


planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

planes %>% 
  group_by(tailnum) %>% 
  summarise(n = n()) %>% 
  filter(n > 1)


flights2 <- flights %>% 
  filter(distance > 2000) %>%   
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2

flight2_airlines =
  flight2 %>% 
  left_join(., airlines)

planes_flight = flights2 %>% 
  right_join(planes, by = 'tailnum')

origin_flights = flights2 %>% 
  inner_join(airports, 
             by = c("origin"= "faa"))

origin_flights = flights2 %>% 
  inner_join(airports,
             join_by(origin == faa))

dest_flights = flights2 %>% 
  full_join(airports, by = c("dest"= "faa"))

dest_flights = flights2 %>% 
  full_join(airports, join_by(dest == faa))


