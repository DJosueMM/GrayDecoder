# GrayDecoder

## Descripción general ##

A continuación, se explicará el funcionamiento del circuito completo y cada subsistema.

## Diagrama de bloques de cada subsistema ##

Texto

## Análisis de la simulación funcional completa ##

Texto

## Consumo de recursos y consumo de potencia ##

En la carpeta "datos del informe" se presenta el archivo .txt generado con la herramienta Vivado respecto al consumo de potencia y recursos en la FPGA. De dicho archivo se extrae la siguiente información. 

La FPGA utilizada es la Nexys A7, familia Artix-7, empaquetado CSG324, modelo XC7A100TCSG324-1. De los recursos disponibles en dicha FPGA se utilizaron los siguientes, los cuales se muestran en la siguiente imagen.

![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/recursosUtilizadosFPGA.jpeg?raw=true)

De dicha imagen se aprecia que la mayor parte de recursos utilizados son registros. Esto es porque, al utilizar lógica secuencial, se necesitann elementos de memoria para almacenar variables por un cierto tiempo. Considerando la cantidad de registros disponibles en la FPGA, se afirma que el diseño implementado y la cantidad de registros utilizados es proporcional al proyecto desarrollado.

Ahora bien, la cantidad de potencia total consumida se reporta en la imagen a continuación. Este dato se obtuvo gracias a las herramientas provistas por Vivado, luego de realizar la síntesis e implementación del diseño.

![potenciaGeneral](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/potenciaGeneral.jpeg?raw=true)

Una parte importante es la potencia dinámica, sin embargo, predomina la potencia estática en el diseño implementado. Esto considerando una temperatura ambiente de 25 °C aproximadamente.


## Reporte de velocidades máximas de reloj ##

Texto

## Problemas encontrados durante el trabajo ##

Texto
