library(tidyr)
library(readxl)
library(ggplot2)

#Define a diretoria com a localização do ficheiro a ser lido
setwd("C:\\Users\\TERESA NOGUEIRA\\Desktop\\R_excel_files\\3_exercise")

#Obtém os dados do ficheiro excel
data = read_excel("QualidadeARO3.xlsx",range = cell_cols("C:E"), col_types = c("text","text","text"))

#Tratamento de dados -> compacta, retira dados desnecessários e converte a matriz para numérico, insere a matriz resultante numa data frame
data <-data[,-2]

data_numeric = apply(as.matrix.noquote(data),2,as.numeric)

final.df = as.data.frame(data_numeric)
final.df <- gather(final.df,Estações,Value,1:2)


#Constrói o histograma
ggplot(final.df, aes(x = Value, fill = Estações)) + 
      geom_histogram(color = 1, alpha = 0.65, position = "identity", bins = 40, ) +
      scale_fill_manual(values = c("#845EC2", "#2C73D2")) +
      xlab("Níveis de Ozono (µg/m3)") +
      ggtitle("Qualidade do ar em diferentes estações da QUALAR") +
      theme_minimal()

#Constrói o plot de densidade
ggplot(final.df, aes(x=Value, group=Estações, fill=Estações)) +
      geom_density() +
      scale_fill_manual(values = c("#845EC2", "#F3C5FF")) +
      xlab("Níveis de Ozono (µg/m3)") +
      theme_minimal() 

