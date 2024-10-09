# primeira aula #
# o R reconhece como valores diferentesletras maiusculas e minusculas e ' ' separa os valores
# assim como no python. coisa curiosa, as linhas de codigos podem ser começadas em uma linha e
# terminadas em outra. Logo
#
# x <- (1 +
#    1)
# resultaria em 2
# outro adendo importante é não usar nomes proprios como 'if, while, ....' em nomes de funções

#1 + 1 # Adição
#2 - 1 # Subtração
#3 * 2 # Multiplicação
#4 / 2 # Divisão
#5 ^ 2 # Potenciação
#5 %% 2 # Resto da divisão
#5 %/% 2 # Divisão inteira

#log(10) # Logarítimo natural
#exp(10) # Exponencial
#log10(100) # Logarítimo base 10
#log2(10) # Logarítimo base 2
#log(100, base = 8) # Log. base 8

#sin(0) # Seno
#cos(0) # Cosseno
#tan(0) # Tangente
#asin(0) # Arco seno
#acos(0) # Arco cosseno
#atan(0) # Arco tangente

#round(pi, digits = 2) # Arredondamento
#ceiling(pi) # Teto entre o decimal e os dois inteiros mais proximos, escolhe o maior inteiro para retornar
#floor(pi) # Piso o contrario da anterior, retorna o menor inteiro
#trunc(pi) # Truncamento

#1 == 1 # Igual
#1 != 2 # Diferente
#1 > 2 # Maior
#1 < 2 # Menor
#1 >= 1 # Maior ou Igual
#2 >= 1 # Menor ou Igual

#a <- 1
#b <- 2
#a <= b

#(1 == 1) & (2 == 2) # E / AND
#(1 == 1) | (2 == 3) # OU / OR
#!(1 == 2) # NÃO / NOT


#NA: Valores Ausentes
#NaN: Not a Number
#Inf e -Inf: Infinito
#NULL: Valor Nulo (vazio)

#NA + 5 # NA
#is.na(NA + 5) # Verifica se é NA

#10 + NULL # Retorna objeto vazio
#is.null(10 + NULL) # Verifica se é NULL

0/0 # NaN
is.nan(0/0) # Verifica se é NaN

1/0 # Inf
is.infinite(1/0) # Verifica se é Infinito
is.finite(1/0) # Verifica se é Finito

# um vetor não mistura classes e nem começa na casa 0
meu_primeiro_vetor <- c(1, 2, 3, 4, 5, 6)
vetor_char <- c('a', 'b', 'c')
vetor_char[1]
vetor_char[length(vetor_char)]
vetor_char[2:3]
meu_primeiro_vetor[-c(1:2)]

vetorsao <- c(meu_primeiro_vetor, vetor_char)
vetorsao
