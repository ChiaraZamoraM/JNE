install.packages("ggplot2") #para gráficas
install.packages("readr") #para lectura de BD en CSV
library(ggplot2) # Cargar la librería gráfica "ggplot2"
library(readr) # Cargar la librería gráfica "readr"

#Llamar Base de Datos
datosACA=read.csv2("C:/Users/apoyo37dnef/Desktop/PerfilACA.csv", sep=",")
datosACA$nivelACAD= factor(datosACA$nivelACAD, 
                                  levels = c(0:7),
                                  labels = c("Sin educación", "Primaria", "Secundaria","Técnico", "Bachiller","Licenciado","Magister","Doctor"),
                                  ordered=T)

#Cambiar las etiquetas de los valores
datosACA$joven= factor(datosACA$joven, 
                           levels = c(0:1),
                           labels = c("No joven", "Joven"),
                           ordered=T)

datosACA$TXSEXO= factor(datosACA$TXSEXO, 
                       levels = c(1:2),
                       labels = c("Masculino", "Femenino"),
                       ordered=T)

#Cantidad de joven por nivel educativo
table(datosACA$nivelACAD,datosACA$joven)
juventudFinal=table(datosACA$nivelACAD,datosACA$joven)
juventudFinal=as.data.frame(juventudFinal)
juventudFinal
names(juventudFinal)=c("Nivel","Poblacion","Cantidad")
names(juventudFinal)

#Cantidad de hombres y mujeres por nivel educativo
table(datosACA$nivelACAD,datosACA$TXSEXO)
SexoFinal=table(datosACA$nivelACAD,datosACA$TXSEXO)
SexoFinal=as.data.frame(SexoFinal)
SexoFinal
names(SexoFinal)=c("Nivel","Sexo","Cantidad")
names(SexoFinal)

#Gráfica de nivel educativo por sexo
Sexo=ggplot(data=SexoFinal, aes(x=Nivel, y=Cantidad, fill=Sexo)) + 
  geom_bar(stat="identity", position="dodge") +
  xlab("") + ylab("") +
  ggtitle("Nivel educativo de las candidaturas congresales por sexo") +
  theme(plot.title = element_text(vjust=2, hjust = 0.5)) +
  theme (legend.position = "bottom",text = element_text(size=16)) +  
  scale_fill_manual(values = c("#0072B2","#CC79A7")) + 
  geom_text(aes(label=Cantidad), position=position_dodge(width=0.9), vjust=-0.4, size=4)

#Gráfica de nivel educativo por tipo de poblacion (joven y no joven)
Jovenes=ggplot(data=juventudFinal, aes(x=Nivel, y=Cantidad, fill=Poblacion)) + 
  geom_bar(stat="identity", position="dodge") +
  xlab("") + ylab("") +
  ggtitle("Nivel educativo de las candidaturas congresales por problación") +
  theme(plot.title = element_text(vjust=2, hjust = 0.5)) +
  theme (legend.position = "bottom",text = element_text(size=16)) +  
  scale_fill_manual(name="Población",values = c("#009E73","#F0E442"))+
  geom_text(aes(label=Cantidad), position=position_dodge(width=0.9), vjust=-0.4, size=4)

#Guardar gráficas en png
aspect_ratio=3
ggsave("Sexo.png", plot = Sexo, height = 9, width = 7* aspect_ratio)
ggsave("Jovenes.png", plot = Jovenes, height = 9, width = 7 * aspect_ratio)


