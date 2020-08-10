# api de datos economicos
# @elcontrafactual

# librerias
library(httr)
library(jsonlite)
library(rjson)
library(lubridate)

# pib
url <- 'https://www.inegi.org.mx/app/api/indicadores/desarrolladores/jsonxml/INDICATOR/493621/es/0700/false/BIE/2.0/dafd0053-9a71-1cb4-f58d-4a7071445df0?type=json'
respuesta <- GET(url)
(datosGenerales <- content(respuesta,"text"))
(flujoDatos <- paste(datosGenerales,collapse = " "))

(flujoDatos <- fromJSON(flujoDatos))
(flujoDatos <- flujoDatos$Series)
(flujoDatos <- flujoDatos[[1]]$OBSERVATIONS)
View(flujoDatos)
datos <- 0
periodo <- 0
for (i in 1:length(flujoDatos)){
  datos[i]<-flujoDatos[[i]]$OBS_VALUE
  periodo[i] <- flujoDatos[[i]]$TIME_PERIOD
}

datos<-as.numeric(datos)
periodo <- as.Date(periodo)
df <- data.frame(periodo,datos)

as.Date(periodo)

print(mean(datos))



