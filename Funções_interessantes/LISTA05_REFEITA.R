
#### Tidyverse
####1. Para esse exercício você deverá utilizar o banco de dados `chocolate.csv.gz`.####
# 
# O dicionário das variáveis encontra-se disponível abaixo.
# 
# 
#   | Variável        | Descrição                                             |
#   |-----------------|-------------------------------------------------------|
#   | local_compania  | Região do Fabricante                                  |
#   | ano             | Ano da Revisão                                        |
#   | origem_cacau    | País de Origem dos Grãos de Cacau                     |
#   | cocoa_percent   | Percentagem de Cacau (% chocolate)                    |
#   | ingredientes    | Ingredientes                                          |
#   | caracteristicas | Características mais memoráveis daquele chocolate     |
#   
#   Lista de ingredientes:
#   "#": representa o número de ingredientes no chocolate; 
#    B: Grãos, 
#    S: Açúcar, 
#    S*: Adoçante diferente de açúcar de cana branco ou beterraba, 
#    C: Manteiga de Cacau, 
#    V: Baunilha, 
#    L: Lecitina, 
#    Sa: Sal
# 

require(tidyverse)
require(readr)
require(data.table)


chocolate <- fread("Dados/Dados/chocolate.csv.gz")
class(chocolate)
view(chocolate)







#   a. Quantos países produzem chocotale?

chocolate$local_compania %>% 
  unique() %>% 
  length()

# são 67 paises







#   b. Quantos chocolates existem com pelo menos 3 ingredientes?

chocolate = chocolate %>% 
  separate(ingredientes, into = c('ing_quantidades', 'ingredientes' ), sep = '-')

chocolate$ing_quantidades <- as.integer(chocolate$ing_quantidades)

chocolate %>% 
  filter(!(between(ing_quantidades, lower = 0, upper = 2))) %>% 
  nrow()

# com pelo menos 3 ingredientes são 1687







#   c. Quantos chocolates existem com 5 ingredientes?

chocolate %>% 
  filter(ing_quantidades == 5) %>% 
  nrow()

# existem 191 chocolates com 5 ingredientes










#   d. Quantos chocolates existem com pelo menos 4 características memoráveis?

chocolate = chocolate %>% 
  mutate(car_quantidade = str_count(caracteristicas, ',') + 1)

chocolate %>% 
  filter(!(between(car_quantidade, lower = 0, upper = 3))) %>% 
  nrow()


# são 281 chocolates que tem 4 ou mais caracteristicas memoraveis













#   e. Quantos chocolates existem com Sal em sua composição?





chocolate %>% 
  filter(grepl('Sa', ingredientes)) %>% 
  nrow()

# temos 37 chocolates com sal na composição











#   f. Quantos chocolates existem com Baunilha em sua composição?



chocolate %>% 
  filter(grepl('V', ingredientes)) %>% 
  nrow()

# são 353 chocolates que apresentam baunilha em sua composição









#   g. Quantos chocolates existem com Lecitina e Baunilha em sua composição?


chocolate %>% 
  filter(grepl('V', ingredientes) & grepl('L', ingredientes)) %>% 
  nrow()








####2. Para esse exercício você deverá utilizar os banco de dados `Art.csv.gz` e `Art_Moma.csv.gz`. Desconsidere artistas sem nacionalidade e/ou sem nome.####

#    O dicionário das variáveis encontra-se disponível abaixo.
# 
#   | variável                   | descrição                                                                                                           |
#   |----------------------------|---------------------------------------------------------------------------------------------------------------------|
#   | artist_name                |  O nome de cada artista                                                                                             |
#   | edition_number             |  O número da edição do livro.                                                                                       |
#   | year                       |  O ano de publicação de uma determinada edição do livro                                                             |
#   | artist_nationality         |  A nacionalidade de um artista.                                                                                     |
#   | artist_nationality_other   |  A nacionalidade do artista                                                                                         |
#   | artist_gender              |  O gênero do artista                                                                                                |
#   | artist_race                | A raça do artista                                                                                                   |
#   | artist_ethnicity           |  A etnia do artista                                                                                                 |
#   | book                       | Qual livro, "Janson" ou "Gardner"                                                                                   |
#   | space_ratio_per_page_total |  A área em centímetros quadrados do texto e da figura de um determinado artista                                     |
#   | artist_unique_id           |  O número de identificação exclusivo atribuído aos artistas                                                         |
#   | moma_count_to_year         |  O número total de exposições já realizadas pelo Museu de Arte Moderna (MoMA)                                       |
#   | whitney_count_to_year      |  O número de exposições realizadas pelo The Whitney                                                                 |
#   | artist_race_nwi            |  O indicador de raça não branca para a raça do artista                                                              |


art <- fread("Dados/Dados/Art.csv.gz")
moma <- fread("Dados/Dados/Art_Moma.csv.gz")

view(art)
view(moma)


# unique(art$artist_name)
# aqui faço uma pequena varredura para saber quem é na, ou como está escrito na,
# que no nosso caso é começado por N/


id_dos_sem_nação_ou_nome <- art %>% 
  filter(grepl('N/', artist_name) | grepl('N/', artist_nationality)) %>% 
  select(artist_unique_id)

view(id_dos_sem_nação_ou_nome)

id_dos_sem_nação_ou_nome <- id_dos_sem_nação_ou_nome$artist_unique_id


art$artist_unique_id <- as.character(art$artist_unique_id)
moma$artist_unique_id <- as.character(moma$artist_unique_id)

head(art)

art = art %>% 
  filter(!(artist_unique_id %in% id_dos_sem_nação_ou_nome))


moma = moma %>% 
  filter(!(artist_unique_id %in% id_dos_sem_nação_ou_nome))


view(art)
view(moma)

art_moma_unidos <- art %>% 
  full_join(moma, join_by(artist_unique_id == artist_unique_id))

moma_art_unidos <- moma %>% 
  full_join(art, join_by(artist_unique_id == artist_unique_id))


view(art_moma_unidos)
view(moma_art_unidos)







#   a. Qual a média de exposições realizadas pelo MoMA e pelo Whitney por ano?



moma %>% 
  group_by(year) %>% 
  summarise(media_anual_moma = mean(moma_count_to_year, na.rm = TRUE),
            media_anual_whitney = mean(whitney_count_to_year, na.rm = TRUE)) %>% 
  view()









#   b. Qual a média de exposições realizadas pelo MoMA e pelo Whitney por ano para artistas de raça não branca?

moma_art_unidos <- moma %>% 
  full_join(art, join_by(artist_unique_id == artist_unique_id))

# aqui eu acoplo os dados da tabela art na tabela moma

view(moma_art_unidos)


moma_art_unidos %>% 
  filter(artist_race_nwi %in% 'Non-White') %>% 
  select(year, moma_count_to_year, whitney_count_to_year) %>% 
  group_by(year) %>% 
  summarise(media_anual_moma = mean(moma_count_to_year, na.rm = TRUE),
            media_anual_whitney = mean(whitney_count_to_year, na.rm = TRUE)) %>% 
  view()









#   c. Quais os quatro artistas com mais exposições realizadas pelo MoMA?

moma_art_unidos %>% 
  select(artist_name, moma_count_to_year) %>% 
  group_by(artist_name) %>% 
  summarise(expo_total = sum(moma_count_to_year, na.rm = T)) %>% 
  arrange(., desc(expo_total)) %>% 
  head(., n = 4)













#   d. Do total de artistas, quantos são homens e quantos são mulheres?


art %>% 
  select(artist_gender) %>% 
  group_by(artist_gender) %>% 
  summarise(total = n())












#   f. Dos artistas que expuseram no MoMA, quantos aparecem em cada livro? E dos que expuseram no Whitney?



view(moma_art_unidos)

moma_art_unidos %>% 
  filter(moma_count_to_year != 0) %>% 
  group_by(book) %>% 
  summarise(total_de_aparições = n_distinct(artist_name))


moma_art_unidos %>% 
  filter(whitney_count_to_year != 0) %>% 
  group_by(book) %>% 
  summarise(total_de_aparições = n_distinct(artist_name))







#   g. Qual a média de espaço ocupado por página de cada artista?


moma_art_unidos %>% 
  select(space_ratio_per_page_total, artist_name, book) %>% 
  group_by(artist_name, book) %>% 
  summarise(Média_de_espaço_ocupado = mean(space_ratio_per_page_total)) %>% 
  arrange(., desc(Média_de_espaço_ocupado))











####3. Para esse exercício você deverá utilizar os banco de dados `refugiados_pais.csv.gz` e `refugiados.csv.gz`. Considere apenas observações completas.####


R_pais <- fread('Funções_interessantes/Dados/refugiados_pais.csv.gz')
refug <- fread('Funções_interessantes/Dados/refugiados.csv.gz')


# como no dicionario temos a informação 'desconhecido', terei que remover ela
# e verificar onde tem NA

R_pais %>% 
  filter(is.na(id) == TRUE | is.na(nome) == TRUE | is.na(regiao) == TRUE | is.na(subregiao) == TRUE)

# meio arcaico mas serve, temos 3 locais com NA
# fiz isso para ter certeza na hora de verificar a tabela, de que ela não tem NA

R_pais <- na.omit(R_pais)
refug <- na.omit(refug)

view(R_pais)
view(refug)


tabela_refugiados_com_dicionario <- refug %>% 
  inner_join(R_pais, join_by(id_origem == id))

view(tabela_refugiados_com_dicionario)

# o inner_join faz o serviço pesado de remover os na, mas isso é comparando o id
# do destino

tabela_refugiados_com_dicionario = tabela_refugiados_com_dicionario %>% 
  rename(nome_origem = nome,
         região_origem = regiao,
         subregiao_origem = subregiao)


# agora vamos fazer o mesmo processo para acoplar o dicionario do destino


tabela_refugiados_com_dicionario = tabela_refugiados_com_dicionario %>% 
  inner_join(R_pais, join_by(id_destino == id))

tabela_refugiados_com_dicionario = tabela_refugiados_com_dicionario %>% 
  rename(nome_destino = nome,
         região_destino = regiao,
         subregiao_destino = subregiao)


view(tabela_refugiados_com_dicionario)




#   a. Qual a média de refugiados por país?

tabela_refugiados_com_dicionario %>% 
  select(nome_origem, refugiados) %>% 
  group_by(nome_origem) %>% 
  summarise(media_por_pais = mean(refugiados)) %>% 
  arrange(., desc(media_por_pais))











#   b. Quantos refugiados houveram saíndo do Afeganistão em 1990? E a partir de 2000?


tabela_refugiados_com_dicionario %>% 
  select(ano, refugiados, nome_origem) %>% 
  filter((ano == 1990 | ano >= 2000) & nome_origem %in% 'Afghanistan') %>% 
  group_by(ano) %>% 
  summarise(total_ano = sum(refugiados)) %>% 
  arrange(., ano)
  










#   c. Crie a matriz de migração intercontinental (de -> para) de refugiados do ano 2005.


tabela_refugiados_com_dicionario %>% 
  group_by(região_origem, região_destino) %>% 
  summarise(total_migrantes = sum(refugiados)) %>% 
  pivot_wider(names_from = região_destino, values_from = total_migrantes, values_fill = 0) %>% 
  print()






#   d. Qual o país que mais recebeu refugiados em 2005? E em 2010?



tabela_refugiados_com_dicionario %>% 
  select(nome_destino, refugiados, ano) %>% 
  filter(ano == 2005) %>% 
  group_by(nome_destino) %>% 
  summarise(total_refugiados = sum(refugiados)) %>% 
  arrange(., desc(total_refugiados))

tabela_refugiados_com_dicionario %>% 
  select(nome_destino, refugiados, ano) %>% 
  filter(ano == 2010) %>% 
  group_by(nome_destino) %>% 
  summarise(total_refugiados = sum(refugiados)) %>% 
  arrange(., desc(total_refugiados))


# ambos os anos é o Paquistão



#   e. Quantos refugiados os 3 países que mais receberam refugiados em 2010 receberam em 2005?




tabela_D <- tabela_refugiados_com_dicionario %>% 
  select(nome_destino, refugiados, ano) %>% 
  filter(ano == 2010) %>% 
  group_by(nome_destino) %>% 
  summarise(total_refugiados = sum(refugiados)) %>% 
  arrange(., desc(total_refugiados)) %>% 
  select(nome_destino)

tabela_D <- tabela_D$nome_destino[c(1:3)]

tabela_refugiados_com_dicionario %>% 
  select(nome_destino, refugiados, ano) %>% 
  filter(ano == 2005 & nome_destino %in% tabela_D) %>%
  group_by(nome_destino) %>% 
  summarise(total = sum(refugiados))






# Exercício extra ---------------------------------------------------------

# 4. (3pontos) Para esse exercício você deverá utilizar os banco de dados refugiados_pais.csv.gz
# e refugiados.csv.gz. Considere apenas observações completas.
# verifique se é verdade
# A matriz de migração [origem, destino] intercontinental do ano 2006 é dada por:
# 
#  Região  |  Africa  |  Americas  |  Asia  |  Europe  |  Oceania
#  Africa  |  2507581 |   262745   |  98175 |  250070  |   37124
#  Americas|     0    |   150149   |    0   |  14850   |   174
#   Asia   |  76780   |   308706   | 4411284|  664075  |   42704
#  Europe  |    94    |   306672   |  7816  |  454237  |   3423
#  Oceania |     0    |    1679    |    0   |    92    |   59
#  



# Filtrar para o ano de 2006
tb4_2006 <- tabela_refugiados_com_dicionario %>% filter(ano == 2006) # troquei o tb4 pela variavel do meu codigo

# Criar a matriz de migração [origem, destino]
matriz_migracao_2006 <- tb4_2006 %>%
  group_by(região_origem, região_destino) %>%
  summarise(total_migrantes = sum(refugiados)) %>%
  pivot_wider(names_from = região_destino, values_from = total_migrantes, values_fill = 0) %>% 
  as.matrix()
matriz_migracao_2006
