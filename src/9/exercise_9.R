library(tidyr)
library(readxl)
library(ggplot2)

set.seed(269)
m = 1050
lambda = 0.71


n = rep(0,50)
n[1] = 100
sample_number = 100
i = 2

while (sample_number < 5000){
  n[i] = n[1] + sample_number
  sample_number = sample_number + 100
  i = i + 1
}

intervalo_maker <- function(n){
  x = 0
  for (i in 1:m){
    x[i] = mean(rexp(n,lambda))
  }
  gama = 0.93
  a = qnorm((1+gama)/2)
  amplitude = (2*a)/(x*sqrt(n))
  result = mean(amplitude)
  return(result)
}

z = 1
MA = rep(0,50)
for(i in 1:50){
  MA[z] = intervalo_maker(n[i])
  z = z + 1
}

data.df <- data.frame(n, MA) 

ggplot(data.df, aes(x=n, y = MA)) + 
  geom_point(shape = 18, colour = "#B39CD0", size = 3, stroke = 2) + 
  geom_line(size = 1, colour = "#007ED9") +
  theme_bw()
