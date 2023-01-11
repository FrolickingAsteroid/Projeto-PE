library(tidyr)
library('stats')
library(readxl)
library(ggplot2)

set.seed(1511)
n = 404
lambda = 0.14
i = 1


data = rexp(n, lambda)
data = sort(data)


while (data[i] <= 18){
  i = i + 1
}

v_est = (404 - i + 1)/n
v_teo = 0.08045960674953243
  
abs(v_teo-v_est)
