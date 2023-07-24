library(tidyr)
library(readxl)
library(ggplot2)

#Define a diretoria com a localização do ficheiro a ser lido
setwd("C:\\Users\\TERESA NOGUEIRA\\Desktop\\R_excel_files\\1_exercise")

#Obtém os dados do ficheiro excel
data = read_excel("ResiduosPerCapita.xlsx",range = cell_rows(c(12:43))) 

#Tratamento de dados -> compacta e retira dados desnecessários, insere a matriz resultante numa data frame
data <- data[-c(1,4:30),]
data.df <- as.data.frame(data)
colnames(data.df) <- c("Países", "2004", "2018")

final.df <- gather(data.df,"Anos", "Toneladas de Resíduo per capita",2:3)

#Gera o gráfico de barras
ggplot(final.df, aes(x = Países, y =`Toneladas de Resíduo per capita`, fill = Anos)) +
        geom_bar(stat = "identity", position = position_dodge()) +
        labs(title = "Produção de Resíduos per Capita") +
        
#Tratamento estético do gráfico
        scale_fill_manual("legend", values = c("2004" = "#845EC2", "2018" = "#00C9A7")) +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="#B39CD0", size = 12),
        axis.title.y = element_text(face="bold", colour="#B39CD0", size = 12),
        legend.title = element_text(face="bold", size = 10))


#Gráfico extra para visualização do declive de Produção
ggplot(final.df, aes(x = Anos, y =`Toneladas de Resíduo per capita`, color = Países)) + 
      geom_point(size = 4) + 
      geom_line(aes(group=interaction(Países)),arrow = arrow(length=unit(0.40,"cm"),type = "closed")) +
      labs(title = "Produção de Resíduos per Capita - Visualização do Declive de Produção") 

  
  
  
  
  

  
               