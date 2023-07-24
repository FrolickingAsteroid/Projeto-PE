library(tidyr)
library(readxl)
library(ggplot2)

#Define a diretoria com a localização do ficheiro a ser lido
setwd("C:\\Users\\TERESA NOGUEIRA\\Desktop\\R_excel_files\\4_exercise")

#Obtém os dados do ficheiro excel
data = read_excel("Utentes.xlsx", range = cell_cols("C:D"))

final.df = as.data.frame(data)

#Cálculo da covariância e do coeficiente de correlação linear para comentários posteriores
IMC = final.df$IMC    
TAD = final.df$TAD      
cov(IMC, TAD) 
cor(IMC,TAD)

#Constrói o Gráfico de Dispersão
ggplot(final.df, aes(x = IMC, y = TAD)) +
      geom_point(size = 2, shape = 23, colour = "#C34A36")  +
      geom_smooth(formula = y ~ x, method = "lm", colour = "#FF6F91", fill="#FF9671") +
      theme_light()

IMC = final.df$IMC    
TAD = final.df$TAD      
cov(IMC, TAD) 
cor(IMC,TAD)
   
  