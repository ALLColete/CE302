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
# 
# 