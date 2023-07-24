library(tidyr)
library(readxl)
library(ggplot2)

set.seed(341)
m = 800
lambda = 5.54
lambda_c = 0.51
n = rep(0,25)
n[1] = 100
sample_number = 100

#declara o vetor das dimensões
i = 2
while (sample_number < 2500){
  n[i] = n[1] + sample_number
  sample_number = sample_number + 100
  i = i + 1
}

#provoca a contaminação do vetor puro
cont <- function(x_pure, x_other, n){
  
  for(i in 1:floor(n*0.15)){
    x_pure[i] = x_other[i]
  }
  return(x_pure)
}

#Cálcula as amplitudes dos intervalos de confiança
intervalo_maker <- function(n, x, lambda){
  gama = 0.93
  a = qnorm((1+gama)/2)
  amplitude = (2*a)/(x*sqrt(n))
  result = mean(amplitude)
  return(result)
}

#Contrói os vetores de MA e MA_C
x_pure = rep(0,m)
x_other = rep(0,m)
x_contaminated = rep(0,m)
MA = rep(0,25)
MA_C = rep(0,25)
z = 1
for(i in 1:25){
  for (c in 1:m){
    x = rexp(n[i],lambda)
    y = rexp(n[i],lambda_c)
    j = cont(x,y, n[i])
    
    x_pure[c] = mean(x)
    x_contaminated[c] = mean(j)
  }
  
  MA[z] = intervalo_maker(n[i], x_pure, lambda)
  MA_C[z] = intervalo_maker(n[i], x_contaminated, lambda_c)
  z = z + 1
  
}

#Constrói o gráfico das regressões lineares
data.df <- data.frame(n, MA,MA_C)

ggplot(data.df) + geom_point(aes(x = n, y = MA, color = "MA - amplitude pura"), shape = 18, size = 2, stroke = 2) +
  geom_point(aes(x = n, y = MA_C, color = "MA_C - amplitude com contaminação"), shape = 18, size = 2, stroke = 2) +
  scale_color_manual ( values =c('#D43725', '#845EC2') ) +
  #geom_line(aes(x = n, y = MA, color = "MA_C"), size = 1, colour = "#00C9A7") +
  #geom_line(aes(x = n, y = MA_C, color = "MA_C"), size = 1, colour = "#00C9A7") +
  xlab(("N")) + ylab("amplitude do intervalo de confiança") +
  theme_bw()
