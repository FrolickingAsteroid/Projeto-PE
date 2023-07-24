library(tidyr)
library(readxl)
library(ggplot2)

#Define a diretoria com a localização do ficheiro a ser lido
setwd("C:\\Users\\TERESA NOGUEIRA\\Desktop\\R_excel_files\\2_exercise")

#Obtém os dados do ficheiro excel
data = read_excel("EsperancaVida.xlsx",range = cell_rows(c(9:69))) 

#Tratamento de dados -> compacta e retira dados desnecessários, insere a matriz resultante numa data frame
data <- data[-c(1:42),-c(2:42, 44:52, 54:65, 67:76, 78:86, 88:99, 101:103)]

data.df <- as.data.frame(data)

colnames(data.df) <- c("Anos","CY - Chipre ♂","IS - Islandia ♂","HU - Hungria ♂",
                       "CY - Chipre ♀","IS - Islandia ♀","HU - Hungria ♀")

final.df <- gather(data.df,"Países","Esperança de Vida",2:7)

#Constrói o gráfico temporal
ggplot(final.df, aes(x=Anos, y=`Esperança de Vida`, color = Países)) +
      geom_point(shape = 18, colour = "#B39CD0", size = 4, stroke = 2) + 
      geom_line(size = 1) +
      xlab("Anos")+
      theme_minimal() +
      scale_color_manual(values=c("#D65DB1", "#9270D3","#007ED9",
                              "#0082C1","#007F93", "#FFA967"))

