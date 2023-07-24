library(tidyr)
library(cowplot) 
library(readxl)
library(ggplot2)

set.seed(950)
a = 9
b = 13

n_samples = 1970

vector_maker <- function(n){
  #browser()
  avg = rep(0,n_samples)
  samples = rep(0,n)
  
  for(i in 1:n_samples){
    samples = rexp(n, 1.07)
    avg[i] = mean(samples)
  }
  avg.df = as.data.frame(avg)
  return(avg.df)
}

plot_maker <- function(avg.df){
  #browser()
  mean_of_dist = 1/1.07
  variance_of_dist = 1/(1.07)^2
  Vn = variance_of_dist/n
  
  plot1 <- ggplot(avg.df, aes(x = avg)) + 
          geom_histogram(aes(y = ..density..),
          colour = 1, fill = "#B39CD0", bins = 20) +
          stat_function(fun = dnorm, 
          args = list(mean = mean_of_dist, sd = sqrt(Vn))) + 
          theme_minimal()
  
return(plot1)
    
}

n = 1
avg_1.df <- vector_maker(n)
plotFreqDen1 <- plot_maker(avg_1.df)

n = 30
avg_2.df <- vector_maker(n)
plotFreqDen2 <- plot_maker(avg_2.df)

n = 100
avg_3.df <- vector_maker(n)
plotFreqDen3 <- plot_maker(avg_3.df)

plot_exp <- plot_grid(plotFreqDen1, plotFreqDen2, plotFreqDen3, nrow = 3, ncol = 1)
plot_exp


