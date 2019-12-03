install.packages("dplyr")
library(ggplot2) # Cargar la librería gráfica "ggplot2"
library(dplyr) # Cargar la librería de manipulación de dataframes "dplyr"

#base de datos
datos1=read.csv2("C:/Users/apoyo37dnef/Desktop/datos_muestra.csv", sep=",")

#seleccionar variables a graficas
total=ggplot(datos1) +
  geom_bar(mapping = aes(x=Nivel.del.Candidato), 
           stat="count",position = "dodge") + theme_replace()
total

sexo=total + geom_bar(datos1, mapping= aes(x=Nivel.del.Candidato, fill=sexo), position = "dodge")
sexo


#Faltaria agregar la categoria de joven y no joven




