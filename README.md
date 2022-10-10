# GrayDecoder

## Descripción general ##

Como parte del proceso de diseño del decodificador de código de Gray a código binario se dividió la solución en tres subsistemas independientes, con la finalidad de simplificar el proceso de diseño, implementación y ensamblaje.

### Primer subsistema: decodificador de código de Gray a código binario
Este subsistema recibe las siguientes entradas:
- inSwitch: representación binaria de cuatro bits del código de Gray colocado en los switches de la FPGA.
- read: señal que se activa cuando se debe empezar el proceso de decodificación de código de Gray a código binario. Se espera un cero cuando no debe empezar la decodificación y un uno cuando se debe comenzar.
- clk: señal de reloj del sistema sincrónico. Este subsistema trabaja en los flancos positivos del reloj (posedge).

Este subsistema tiene la siguiente salida:
- binNum: representación binaria de cuatro bits de código de Gray decodificado a código binario.

El funcionamiento del subsistema se basa en estar pendiente de cambios en la señal de entrada inSwitch, para hacer la conversión necesaria a código binario para la salida binNum, siempre y cuando se cumpla que:
1. El subsistema se encuentra bajo un flanco positivo del reloj.
2. La señal de read es uno. Si la señal de read es cero el binNum no cambia, mantiene su valor previo.

A nivel de código, se programó un bloque always que se mantiene "a la espera" de cambios en las tres señales de entrada (inSwitch, read, y clk). En caso de cumplirse los requisitos expuestos anteriormente, la salida binNum es actualizada mediante un bloque de tipo case.

### Segundo subsistema: controlador de luces LED
Este subsistema recibe las siguientes entradas:
- binNum: representación binaria de cuatro bits resultado de la decodificación del código de Gray.
- clk: señal de reloj del sistema sincrónico. Este subsistema trabaja en los flancos positivos del reloj (posedge).

Este subsistema tiene las siguientes salidas:
- LED1: representación binaria de un bit del primer LED de la FPGA que debe encenderse en función del resultado de la decodificación de código de Gray a código binario.
- LED2: representación binaria de un bit del segundo LED de la FPGA que debe encenderse en función del resultado de la decodificación de código de Gray a código binario.
- LED4: representación binaria de un bit del tercer LED de la FPGA que debe encenderse en función del resultado de la decodificación de código de Gray a código binario.
- LED8: representación binaria de un bit del cuarto LED de la FPGA que debe encenderse en función del resultado de la decodificación de código de Gray a código binario.

El funcionamiento del subsistema se basa en igualar las salidas LED1, LED2, LED4 y LED8 a los cuatro bits de la entrada binNum siempre y cuando se cumpla que:
1. El subsistema se encuentra bajo el flanco positivo del reloj.

A nivel de código, se programó un bloque always que se mantiene "a la espera" de cambios en las dos señales de entrada (binNum y clk). En caso de cumplirse los requisitos expuestos anteriormente, las salidas LED1, LED2, LED4 y LED8 son igualadas a los cuatro bits de la entrada binNum.



## Diagrama de bloques de cada subsistema ##

### Diagrama de bloques del primer subsistema:
![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/submoduloUno.png?raw=true)

### Diagrama de bloques del segundo subsistema:
![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/submoduloDos.png?raw=true)

### Diagrama de bloques del tercer subsistema
![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/submoduloTres.png?raw=true)

## Análisis de la simulación funcional completa ##

Texto

## Consumo de recursos y consumo de potencia ##

En la carpeta "datos del informe" se presenta el archivo .txt generado con la herramienta Vivado respecto al consumo de potencia y recursos en la FPGA. De dicho archivo se extrae la siguiente información. 

La FPGA utilizada es la Nexys A7, familia Artix-7, empaquetado CSG324, modelo XC7A100TCSG324-1. De los recursos disponibles en dicha FPGA se utilizaron los siguientes, los cuales se muestran en la siguiente imagen.

![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/recursosUtilizadosFPGA.JPG?raw=true)

De dicha imagen se aprecia que la mayor parte de recursos utilizados son registros. Esto es porque, al utilizar lógica secuencial, se necesitann elementos de memoria para almacenar variables por un cierto tiempo. Considerando la cantidad de registros disponibles en la FPGA, se afirma que el diseño implementado y la cantidad de registros utilizados es proporcional al proyecto desarrollado.

Ahora bien, la cantidad de potencia total consumida se reporta en la imagen a continuación. Este dato se obtuvo gracias a las herramientas provistas por Vivado, luego de realizar la síntesis e implementación del diseño.

![potenciaGeneral](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/potenciaGeneral.jpeg?raw=true)

Una parte importante es la potencia dinámica, sin embargo, predomina la potencia estática en el diseño implementado. Esto considerando una temperatura ambiente de 25 °C aproximadamente.


## Reporte de velocidades máximas de reloj ##

Texto

## Problemas encontrados durante el trabajo ##

Texto
