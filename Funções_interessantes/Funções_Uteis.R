# verifica se é impar ou par ----------------------------------------------

par_impar <- function(numero){
  if((numero - ceiling(numero)) != 0){
    warning(paste('O número', numero, 'digitado não é inteiro, logo não é possivel verificar se é par ou não é. \n A função retornou \'N\''))
    return('N')
  }
  condição <- (numero / 2) - (numero %/% 2)
  if(condição == 0){
    return('PAR')
  } else{
    return('IMPAR')
  }
}


# A função inicialmente verifica se o número é inteiro, o procedimento para isso 
# é simplês, se subtrairmos um numero menos ele mesmo arredondado, caso seja inteiro
# o resultado é 0, caso não seja inteiro o resultado é 0; o primeiro if detecta e 
# a função para.
# 
# Caso o numero seja inteiro: subtrai-se o numero dividido por 2, pela divisão inteira
# do numero por 2, tanto faz o sinal do numero aqui. Se a subtração é igual a 0 
# o numero é par, caso contrario é impar
# retornos: N , PAR , IMPAR






# verifica se é primo -----------------------------------------------------

eh_primo <- function(numero){
  if((numero - ceiling(numero)) != 0 | numero <= 0){
       warning(paste('O número', numero, 'digitado não é natural, logo não é possivel verificar se é primo ou não é.\n A função retornou \'N\''))
       return('N')
    }
  if(numero == 1){
        return("NÃO PRIMO")
    }
  if(par_impar(numero) == 'PAR' & numero != 2){
    return("NÃO PRIMO")
    }
    if(numero != 2){
      for (variavel in c(2:(numero-1))) {
        teste <- numero/variavel - numero %/% variavel
        if(teste == 0){
          return('NÃO PRIMO')
          }
        }
      }
   return("PRIMO")
}


# for(x in c(1:50)){
#   print(paste(x, 'tem a classe', eh_primo(x)))
# }
# 
# acima temos um teste para ver se a função está funcionando, altere o vetor para 
# obter um intervalo de numeros primos ou não primos.
# 
# A função opera no conjunto dos numeros naturais. primeiramente ela verifica se 
# o numero é negativo, zero ou decimal, caso isso aconteça a função retorna "N".
# Logo em seguida se entra em um for que opera num vetor que vai de 2 até o antecessor
# do numero, em que dentro do laço é feita a subtração da divisão do numero pelo
# elemento do vetor menos a divisão por inteiro do numero pelo elemento, caso dê
# o valor 0 significa que ambas as divisões resultam em um numero natural, etc etc,
# significa que o número não é primo. caso o for seja completo é porque o numero
# é primo
# retornos: N , NÃO PRIMO , PRIMO






# verifica se é um quadrado perfeito --------------------------------------



eh_quadrado_perfeito <- function(numero){
  if (numero < 0){
    warning(paste('O número',numero,'digitado é negativo, logo não é possivel verificar se é um quadrado perfeito ou não é.\n A função retornou \'N\''))
    return('N')
  }
  if((numero - ceiling(numero)) != 0){
    warning(paste('O número',numero,'digitado é decimal, logo não é um quadrado perfeito ou não é.\n A função retornou \'N\''))
    return('N')
  }
  
  teste <- sqrt(numero)%%1
  if(teste == 0){
    return('PERFEITO')
  } else {
    return('IMPERFEITO')
  }
}

# for(x in c(1:50)){
#    print(paste(x, 'é um quadrado', eh_quadrado_perfeito(x)))
# }
# 
# acima temos o teste da função
# 
# A função basicamente verifica se o numero é decimal ou negativo, caso isso ocorra
# ela retorna N. Então é feita a raiz quadrada e armazenado na variavel teste a parte
# decimal; se o resto é 0, logo é um quadrado perfeito; caso contrario imperfeito
# retornos: N , PERFEITO , IMPERFEITO






# função varre_matriz -----------------------------------------------------

# com base em alguns critérios esta função deve alterar os valores de uma matriz
# com dimenções mXm.
# se o número é negativo, então é calculado a raiz quadrada do modulo
# se é um quadradro perfeito, subtrai-se 14, e caso dê um negativo, eleva-se a 5° potencia
# caso seja primo, multiplica-se ele por 3



# matriz_teste <- matrix(c(1:9),
#                        nrow = 3,
#                        ncol = 3,
#                        byrow = TRUE)
# 
# 
# for (linha in c(1:3)) {
#   for (coluna in c(1:3)) {
#     print(matriz_teste[linha,coluna])
#   }
# }
# 
# aqui fica um exemplo de como a varredura deve ser feita, expressões e operações
# devem estar contidas no segundo for


varre_matriz <- function(matriz){
  for (linha in c(1:nrow(matriz))) {
    for (coluna in c(1:ncol(matriz))) {
      elemento <- matriz[linha,coluna]
      if(elemento < 0){
        elemento <- sqrt(abs(elemento))
      }
      if(eh_primo(elemento) == 'PRIMO' & matriz[linha,coluna] == elemento){
        elemento <- elemento*3
      }
      if(eh_quadrado_perfeito(elemento) == 'PERFEITO' & matriz[linha,coluna] == elemento){
        elemento <- elemento - 14
        if(elemento < 14){
          elemento <- elemento**5
        }
      }
      matriz[linha,coluna] <- elemento
    }
  }
  return(matriz)
}


# varre_matriz(matriz_teste)
# matriz_teste
#
# outros testes para ver se a função está funcionando corretamente.
# 
# O for aninhado basicamente se refere ao indice do elemento da matriz. a escolha 
# de alocar o elemento da matriz em outra variavel tem dois motivos, o primeiro é 
# tornar a função mais legivel, e o segundo é para comparar no segundo e terceiro if
# se essa variavel, elemento, é igual ao elemento da matriz original, visto que 
# ao ser alterado uma vez o elemento, ele pode cumprir com a exigencia do proximo if
# coisa que de acordo com o exercicio está errado. Dentro dos ifs é auto explicativo.
# Por fim, com o elemento alterado, eu salvo ele na matriz original. Quando todos 
# os FOR acabam a função retorna a matriz modificada







# Variância amostral ------------------------------------------------------

variancia_amostral <- function(vetor){
  somatorio <- 0
  for (elemento in vetor) {
    somatorio <- somatorio + (elemento - mean(vetor))**2
  }
  resultado <- somatorio / (length(vetor)-1)
  return(resultado)
}



variancia(c(1:5))


# nada a falar, esta é a variancia amostral


# Desvio médio absoluto amostral ------------------------------------------


Desvio_medio_absoluto_amostral <- function(vetor){
  somatorio <- 0
  for (elemento in vetor) {
    somatorio <- somatorio + abs(elemento - mean(vetor))
  }
  resultado <- somatorio / (length(vetor)-1)
  return(resultado)
}



# Assimetria de Pearson ---------------------------------------------------

assimetria_de_Pearson <- function(vetor){
  numerador <- 3 * (mean(vetor)-median(vetor))
  denominador <- sqrt(variancia_amostral(vetor))
  resultado <- numerador/denominador
  return(resultado)
}
