# Valores iniciais
set.seed (235)
N_amostras = 1945
n =6

## Calcular valor teórico
# Dado por E(x) = n*p
k =14
p =0.45
teoric_value = k * p

## Calcular valor estimado
# Inicializar vetores
data = rep (0 , N_amostras )

# Simular a situacao N_amostras vezes
for ( i in 1: N_amostras ) {
  data[ i ] = mean( rbinom (n , 14 , 0.45 ) )
  }
# Média da amostra de mé dias
est_value = mean ( data )

# Calcular modulo da diferen ca dos valores
dif_values = abs( teoric_value - est_value )
dif_values

