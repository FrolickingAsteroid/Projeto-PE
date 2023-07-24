set.seed(182)
m = 900
n = 763
lambda = 2.51
x = 0
gama = 0.94
b = qnorm((1+gama)/2)
b = 1.880746

for (i in 1:m){
  x[i] = mean(rexp(n,lambda))
  amplitude[i] = (2*b)/(x[i]*sqrt(n))
}

#amplitude = (2*b)/(x*sqrt(n))
result = mean(amplitude)
result


