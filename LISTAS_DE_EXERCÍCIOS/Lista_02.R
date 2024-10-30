# Lista de Exercícios 02
####Atribuição de Variáveis####
# 
# Crie uma variável chamada idade e atribua o valor 25.

idade <- 25

# Declare uma variável nome e atribua o nome "Maria".

nome <- "Maria"

# Crie um vetor numérico chamado notas com os valores 8, 9, 7 e 6.

notas <- c(8, 9, 7, 6)

# Crie um vetor de caracteres chamado frutas com os elementos "maçã", "banana" e "laranja".

frutas <- c("maçã", "banana", "laranja")

# Crie um vetor numérico chamado idades com os valores 30, 40 e 50.

IDADES <- c(30, 40, 50)

# Crie um vetor lógico com os valores TRUE, FALSE e TRUE.

vetor_logico <- c(TRUE, FALSE, TRUE)

# Crie um vetor contendo os números de 1 a 10.

Um_ao_Dez <- c(1:10)

# Crie um vetor com os números pares de 2 a 200.

Dois_ate_Duzentos <- c(seq(from = 2, to = 200, by = 2))
 
# Crie um vetor com cinco repetições dos números pares de 1 a 10.


vetor_rep5_pares <- rep(1:10, c(rep(c(1, 5), 5))) 

        
# Crie um vetor chamado alturas com 100 alturas, variando de 1.50 a 2.00.

set.seed(182210)
ALTURAS <-sample(150:200, 100, replace = TRUE)/100
 
# Crie um vetor chamado pesos com 100 pesos, seguindo uma distribuição normal com média 70 e desvio padrão 10.

PESOS <- round(rnorm(100, mean = 70, sd = 10), digits = 3)

# de maneira alternativa

PESOS <- rnorm(100, mean = 70, sd = 10) %>% 
  round(., digits = 3)

# Crie um vetor chamado notas com 100 notas, com uma distribuição normal, média 7 e desvio padrão 1.

NOTAS <- rnorm(100, mean = 7, sd = 1)

# Crie um vetor de números inteiros de 1 a 100 gerados a partir de uma distribuição uniforme.


inteiros_da_uniforme <- as.integer(runif(1:100, min = 1, max = 100))


# Simule uma jogada de loteria criando um vetor com 6 números inteiros aleatórios de 1 a 60.

faces <- c(1:60)
sorteados <- sample(faces,
                    size = 6,
                    replace = FALSE)
print(sorteados)




#####Operações Aritméticas####
# 
# Multiplique a variável idade por 2 e armazene o resultado em uma nova variável.

Idade_2 <- idade * 2


# Calcule a média dos valores do vetor notas.

mean(NOTAS)

# Eleve os valores do vetor idades ao quadrado.

print(IDADES^2)

# Realize a divisão inteira de 15 por 4.

print(15 %/% 4)

# Calcule o resto da divisão de 15 por 4.

print((15/4)-(15%/%4))
 
####Operações Lógicas e Condicionais####
 
# Verifique se a variável idade é maior que 18.

print(idade > 18)

# Determine se o primeiro elemento do vetor notas é igual a 8.

print( NOTAS[1] == 8)
 
# Verifique se algum valor no vetor idades é menor que 35.

print(NOTAS < 35)

# Selecione as alturas menores que 1.85 do vetor alturas.

print(ALTURAS[ALTURAS < 1.85])

 
# Selecione os pesos maiores que 80 do vetor pesos.

print(PESOS[PESOS > 80])

# Conte quantos valores no vetor notas são maiores que 7.

print(length(NOTAS[NOTAS < 7]))







#####Funções Matemáticas####
# 
# Calcule a raiz quadrada de 16.

print(sqrt(16))

# Arredonde o valor 3.78 para o inteiro mais próximo.

ceiling(3.78)

# Arredonde para cima os valores do vetor alturas.

print(ceiling(ALTURAS))


# Arredonde para baixo os valores do vetor alturas.

floor(ALTURAS)
 
# Calcule o valor absoluto da diferença entre 10 e 7.

abs(10-7)






#####Vetores Nomeados####
# 
# Crie um vetor chamado salarios com os valores 2000, 3000, 1500 e 4000. Nomeie os elementos como "João", "Maria", "Carlos" e "Ana".

salarios <- c("João" = 2000,
              "Maria" = 3000,
              "Carlos" = 1500,
              "Ana" = 4000)

# Acesse o valor do salário de "Maria" no vetor salarios.

salarios["Maria"]
 
# Atualize o salário de "Carlos" para 1800.

salarios["Carlos"] = 1800
 
# Adicione um novo elemento ao vetor salarios com o nome "Paulo" e o salário 2500.

salarios = append(salarios,
       values = c("Paulo" = 2500))

# Remova o salário de "Ana" do vetor salarios.

salarios["Ana"] = 0

# Verifique se existe algum elemento no vetor salarios com o valor superior a 3500.

unique(salarios > 3500)


# Ordene os salários em ordem crescente e mantenha os nomes associados aos valores.

sort(salarios)


# Crie um vetor de notas nomeado, onde os nomes são "Pedro", "Lucas" e "Carla", e as notas são 8, 7 e 9, respectivamente.

notas = c("Pedro" = 8,
          "Lucas" = 7,
          "Carla" = 9)

# Selecione as notas dos alunos "Pedro" e "Carla" do vetor de notas nomeado.

notas[c("Pedro", "Carla")]


 
# Calcule a média das notas dos alunos no vetor nomeado.

mean(notas)








####Manipulação de Strings####


 
# Crie uma string com o texto "Análise de Dados".

 texto <- "Análise de Dados" 
# Extraia os primeiros 5 caracteres da string criada no exercício anterior.

substr(texto, start = 1, stop = 5)

# Converta a string "R é uma linguagem de programação" para maiúsculas.

conversão <- "R é uma linguagem de programação"
toupper(conversão)
 
# Converta a mesma string para minúsculas.

tolower(conversão)

# Substitua a palavra "linguagem" por "software" na string "R é uma linguagem de programação".

gsub('linguagem', 'software', conversão)





####Expressões Regulares####


# Encontre todos os dígitos na string "Texto1234".

require(tidyr)
require(magrittr)

string <- 'Texto1234'

df <- data.frame(string)

nova_str <- df$string %>% 
  str_split(., '', simplify = TRUE) 

padrao <-  '[A-Z|a-z]'

condição <- str_detect(nova_str, padrao)

detecçoes<- nova_str[condição]

paste(detecçoes, collapse = '')

# Extraia as palavras que começam com a letra "C" na string "Casa, carro, frutas, animais e cidade".

