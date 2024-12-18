# notas sobre funções uteis
# 
# 
# separate #####################################################################
# 
# 
# esta função basicamente tem o formato
# separate([string], [nome das colunas], [sep])
# [string]: tem que ser uma coluna dum dataframe do tipo <character>
# [nome das colunas]: nomeia as colunas em ordem: antes do separador e depois
# [sep]: o sep vale para separar uma string em duas
# 
# 
# ingredientes
# <char>
#   1:     3- B,S,C
# 2:     3- B,S,C
# 3:     3- B,S,C
# 4:     3- B,S,C
# 5:     3- B,S,C
# 6:     3- B,S,C
# 
# 
# chocolate = chocolate %>% 
# separate(ingredientes, into = c('ing_quantidades', 'ingredientes' ), sep = '-')
# 
# 
# grepl ########################################################################
# 
# formato
# grepl([pattern], coluna)
# [pattern]: é um padrão regex
# coluna: coluna em que serão verificados os valores
# caso o elemento de tal coluna tem o padrão, retorna TRUE, caso contrario FALSE
# 
# 
# summarize ####################################################################
# 
# o formato não é fixo, porem quero ressaltar que podemos calcular as quantidades
#  de elementos diferentes dentro da coluna ao não selecionar outra coluna, para 
#  contar com outra variavel, é necessário selecionar a coluna que deseja
# 
# n_distinct ###################################################################
# 
# dentro do summarize quando queremos contar quantos elementor distintos temos para
# tal variavel empilhada essa função pode ser util, usei apenas com outra coluna
# 
# 
# na.omit ######################################################################
# 
# coloque como argumento um data frame que ela removerá qualquer linha que em qualquer 
# parte apresenta algum NA
# 
# 
# exemplos######################################################################
# 
# para ver exemplos destas funções veja a LISTA05_REFEITA
# 
# como selecionar elementos ou dimensões com o dplyr ###########################
# 
# 
# para fazer a seleção em uma matriz ou dataframe qualquer basta
# 
# banco_de_dados %>% 
#   função1 %>% 
#   função2 %>% 
#   .[,3] %>%    <---- aqui eu estou basicamente com o ponto falando que eu quero o banco
#                      já trabalhado, no indice todas as linhas da coluna 3, é como um select 
#   função4
# 
# str_extract_all() ############################################################
# 
# 
# esta função tem 3 argumentos:
#  string: a string que você aplicará a função
#  pattern: o mecanismo de captura 
#  simplify: define a classe de retorno, caso seja FALSE retorna uma lista, caso 
#  seja TRUE devolve uma matriz
#  
#  NOTA: converter uma linha de uma matriz para um vetor retorna um vetor com
#  todos os elementos da linha concatenados, de tamanho 1. Necessita-se da função
#  t() para converter a coluna da matriz em um vetor em que cada linha é um elemento
#  
#  
#  
# dplyr::bind_rows() ###########################################################
# 
# 
# caso tenhamos uma lista em que cada indice da lista é um data frame, todos com
# as mesmas coluna, porem observações diferentes, como se o data frame tivesse as
# linhas cortadas e armazenadas em cada indice de uma lista em um novo data frame 
# com mesmas colunas. 
# com o dplyr::bind_rows() é possível colar elas novamente e formar um unico data frame
# 
# 
# 
# pivot_wider() ################################################################
# 
# 
# estrutura pivo_wider( data, names_from = , values_from = , values_fill = 0)
#  
# data: selecione o banco de dados que você está operando
# 
# names_from: seleciona uma linha e as suas observações se tornam colunas
# 
# values_from: imagine que temos a estrutura
# 
# dado categorico 1 | dado categorico 2 | valor continuo
# 
# 
# usando a segunda coluna no values_from, temos
#  
# 
#                   | dado categorico 2
# dado categorico 1 |  valor continuo
# 
# para tornar mais visivel veja o exercicio extra na LISTA05_REFEITA.R
# 
# 