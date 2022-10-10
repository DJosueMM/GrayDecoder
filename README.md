# GrayDecoder

## Descripción general ##

Como parte del proceso de diseño del decodificador de código de Gray a código binario se dividió la solución en tres subsistemas, con la finalidad de simplificar el proceso de diseño, implementación y ensamblaje.

![image](https://user-images.githubusercontent.com/81501061/194925774-38dacc09-9e16-4fd7-a97c-b341c5ed96a1.png)


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

A nivel de código, se programó un bloque always que se mantiene "a la espera" de cambios en las tres señales de entrada (inSwitch, read, y clk). En caso de cumplirse los requisitos expuestos anteriormente, se sincroniza la entrada de los switches y la salida binNum es actualizada mediante un bloque de tipo case.

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

### Tercer subsistema: convertidor de código binario a display de siete segmentos
Este subsistema recibe las siguientes entradas:
- binNum: representación binaria de cuatro bits resultado de la decodificación del código de Gray.
- clk: señal de reloj del sistema sincrónico. Este subsistema trabaja en los flancos positivos del reloj (posedge).

Este subsistema tiene las siguientes salidas:
- digitoCentena: enable del ánodo en el display del dígito de las centenas. Siempre en 1.
- digitoDecena: enable del ánodo en el display del dígito de las decenas.
- digitoUnidad: enable del ánodo en el display dígito de las unidades.
- digitoMilesima: enable del ánodo en el display dígito de las milésimas. Simpre en 1.
- 7Segments: representación binaria de siete bits de las partes del display de siete segmentos que deben encenderse o apagarse.

El funcionamiento del subsistema se basa en igualar la salida 7Segments en función a lo que se debe mostrar según el valor actual de la entrada binNum, siempre y cuando se cumpla que:
1. El subsistema se encuentra bajo el flanco positivo del reloj.

A nivel de código, se programó un bloque always que se mantiene "a la espera" de cambios en las dos señales de entrada (binNum y clk). Una vez que binNum ha cambiado, se valida que partes del display de siete segmentos deben encenderse o apagarse, con el fin de colocar en alto (1) o en bajo (0) los cátodos en función de cada bit de la salida 7Segments.

Debido a que los displays de siete segmentos en la FPGA son de cátodo común, fue necesario dividir la ruta de datos en unidades y decenas. De esta manera al multiplexar la salida se podrá mostrar en cada display un número distinto. El control de estos datos se realiza mediante una FSM de Moore que tiene como entrada un dato d, que es 1 si hay decenas o 0 si solamente hay unidades, esta detección de decenas es realizada por medio de un bloque combinacional que recibe la entrada en binario. Por otro lado las salidas de la FSM corresponden a los enables de los ánodos en las unidades y decenas (digitoUnidad) (digitoDecena).




- Si el número no tiene decenas: la FSM se mantiene en el estado S0, habilita el display de las unidades con 0, deshabilita el display de las decenas con un 1 y da paso en el multiplexor de salida al dígito de las unidades.

- Si el número tiene decenas: la FSM cambia cada 2ms del estado S0 al S1 y viceversa. En el estado S0 habilita el display de las unidades con 0, deshabilita el display de las decenas con un 1 y da paso en el multiplexor de salida al dígito de las unidades, en contraste, en el estado S1 deshabilita el display de las unidades con 1, habilita el display de las decenas con un 0 y da paso en el multiplexor de salida al dígito de las decenas. Gracias al muestreo cada 2ms, el ojo humano percibe tanto el dígito de las unidades como el de las decenas al mismo tiempo. Este timer de 2ms se derivó del clk por medio de un contador de flancos.

 
### Funcionamiento general del circuito:
1. Primero, el circuito recibe los valores colocados en los cuatro switches de entrada de la FPGA.
2. Estos valores son una representación en código de Gray. La conversión a código binario no ocurre hasta que no se presione la señal de entrada read.
3. Cuando la señal de read está en alto, el primer subsistema se encarga de decodificar el código de Gray a código binario.
4. Este código binario resultante es colocado en el segundo y el tercer subsistema, para mostrar en los LEDS el resultado en código binario, además de mostrarlo también en el display de siete segmentos.


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
