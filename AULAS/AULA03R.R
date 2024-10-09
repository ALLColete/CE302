aula03R
## criando vetores aleatórios
runif(10)
#gera 10 numeros aleatórios
# max indica o maior valor possivel e min indica o valor minimo
runif(10, min=20, max=50)
# ja a função set.seed() indica uma seed especifica para se obter os mesmos resultados
set.seed(89584)
runif(10, min = 10, max = 20)

# sorteando segundo uma distribuição normal
rnorm(10)
rnorm(10, mean = 6, sd = 10)
# poisson
rpois(n=10, lambda = 2)

#sorteando nomes sem repor

x <- c('Ale', 'ana', 'maria')

sample(x, size = 2)

# repondo

sample(x, size = 2, replace = TRUE)

#operações com vetores, note que segue a regra da reciclagem e que realmente funciona como em ALGA
# outra nota é que qualquer operação é sobre o termo i de A comparado ao termo B no indice i
# Criando um vetor de números inteiros
vetor_inteiro <- c(2, 4, 6, 8, 10)

# Criando um vetor de números reais
vetor_real <- c(3.14, 1.618, 2.718, 3.48, 1.9)

# Criando um vetor de caracteres
vetor_caracteres <- c("maçã", "banana", "laranja")

# Criando um vetor misto
vetor_misto <- c(1, 2, "maçã", "banana", "laranja")

#PARA SABER QUANTOS ESPAÇOS TEM O VETOR
length(vetor_inteiro)

# para saber a classe de um vetor use a função class()


# Soma de vetores
soma_vetores <- vetor_inteiro + vetor_real
soma_vetores

# Subtração de vetores
subtracao_vetores <- vetor_real - vetor_inteiro
subtracao_vetores

# Multiplicação de vetores
multiplicacao_vetores <- vetor_inteiro * 2
multiplicacao_vetores

# Divisão de vetores
divisao_vetores <- vetor_real / 3
divisao_vetores

sum() # soma todos os espaços verdadeiros 
any() # verifica algum vetor
all() # verifica todos os termos de um vetor




# Vetores lógicos desempenham um papel crucial na programação e análise de dados, 
# permitindo a seleção e filtragem de elementos com base em condições específicas.
# Um vetor lógico contém valores booleanos (TRUE ou FALSE), onde cada elemento 
# indica se uma determinada condição é verdadeira ou falsa para o elemento correspondente no vetor original.
# 3.1.4.1 Aplicação de Vetores Lógicos: Filtragem e Seleção

# Os vetores lógicos são frequentemente usados para filtrar e selecionar elementos
# de um vetor com base em uma condição. Suponha que temos um vetor de idades e
# queremos selecionar apenas as idades maiores que 18:


idades <- c(16, 21, 14, 30, 25)
condicao <- idades > 18    #mascara lógica
condicao
idades[condicao]  # mostra apenas as idades maiores de 18. Ou para casos gerais,
                  # onde o indice da mascara ser True


#  matrizes dentro do R
# são uma extenção dos vetores dentro do R, assim como os vetores

vetor_a <- c(3,4,5,8)
vetor_b <- c(6,5,7,1)
matriz_linha <- cbind(vetor_a,
                      vetor_b)
matriz_linha
is.matrix(matriz_linha)

A <- matrix(seq(1:9),
                   ncol = 3,
                   nrow = 3,
                   byrow = TRUE)
dim(A)
A
A[1,2]
A[1, ]
A[,3]
A[1:2,-c(2)]


B <- matrix(rpois(n=9, lambda = 6),
                   ncol = 3,
                   nrow = 3,
                   byrow = TRUE)
B
ProdutoMatricial <- A%*%B
ProdutoMatricial
t(A) # transposta
solve(B)
det(B)
autovalores_autovetores <- eigen(A)
diag(A)
