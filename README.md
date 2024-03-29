# GrayDecoder

![image](https://user-images.githubusercontent.com/81501061/194925774-38dacc09-9e16-4fd7-a97c-b341c5ed96a1.png)

## Descripción general ##

Como parte del proceso de diseño del decodificador de código de Gray a código binario se dividió la solución en tres subsistemas, con la finalidad de simplificar el proceso de diseño, implementación y ensamblaje.


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

![image](https://user-images.githubusercontent.com/81501061/194927986-5c0af917-c1e1-40bd-be86-8c0e9c3ef6f5.png)


- Si el número no tiene decenas: la FSM se mantiene en el estado S0, habilita el display de las unidades con 0, deshabilita el display de las decenas con un 1 y da paso en el multiplexor de salida al dígito de las unidades.

- Si el número tiene decenas: la FSM cambia cada 2ms del estado S0 al S1 y viceversa. En el estado S0 habilita el display de las unidades con 0, deshabilita el display de las decenas con un 1 y da paso en el multiplexor de salida al dígito de las unidades, en contraste, en el estado S1 deshabilita el display de las unidades con 1, habilita el display de las decenas con un 0 y da paso en el multiplexor de salida al dígito de las decenas. Gracias al muestreo cada 2ms, el ojo humano percibe tanto el dígito de las unidades como el de las decenas al mismo tiempo. Este timer de 2ms se derivó del clk por medio de un contador de flancos.

 
### Funcionamiento general del circuito:
1. Primero, el circuito recibe los valores colocados en los cuatro switches de entrada de la FPGA.
2. Estos valores son una representación en código de Gray. La conversión a código binario no ocurre hasta que no se presione la señal de entrada read.
3. Cuando la señal de read está en alto, el primer subsistema se encarga de decodificar el código de Gray a código binario.
4. Este código binario resultante es colocado en el segundo y el tercer subsistema, para mostrar en los LEDS el resultado en código binario, además de mostrarlo también en el display de siete segmentos.


## Diagrama de bloques de cada subsistema ##

### Diagrama de bloques del primer subsistema:


![image](https://user-images.githubusercontent.com/81501061/194933694-2b0c3bf4-45ac-4948-b24e-bd3f1ff6a595.png)


### Diagrama de bloques del segundo subsistema:


![image](https://user-images.githubusercontent.com/81501061/194933573-7c668503-7922-4675-a063-abfd760a03ca.png)


### Diagrama de bloques del tercer subsistema


![image](https://user-images.githubusercontent.com/81501061/194933400-3d4d612b-8ad4-431e-a83b-7404d23b1e0e.png)


## Análisis de la simulación funcional completa ##

Para comprobar el funcionamiento del diseño se creó un testbench de todo el decodificador. Este contempla desde el estímulo de entrada hasta el manejo del display de 7 segmentos. El mismo se encuentra en Proyecto_GrayDecoder/GrayDecoder/GrayDecoder.srcs/sim_1/Testbench_Completo.sv . Esta simulación se realizó con las entradas 0, 1 y 2 en formato Gray. Se espera que el display de 7 segmentos cambie sus bits de acuerdo con estas entradas y, asimismo, los LEDs se enciendan cuando correspondan para representar estas entradas en número binario.

Al ejecutar la simulación, se obtiene un archivo .wcfg que representa las formas de onda para cada variable involucrada en el diseño. La siguiente imagen permite ver estas ondas:

![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/ondasTestbench.JPG?raw=true)

Cabe destacar que la señal de reloj (clk), pese a que en la imagen se visualiza continua, no es continua puesto que es una onda cuadrada con flancos. Sin embargo, se visualiza de esta forma por el Zoom-Fit aplicado para apreciar todas las ondas de la simulación.

En la imagen se observa que al ingresar un número en formato Gray y presionar el switch para leer la entrada (readIt), los LEDs correspondientes se encienden en cada caso. Para el 0, ningún LED se enciende. Para el 1, se enciende el LED1. Finalmente para el 0011 en Gray, se enciende el LED2. Esto indica que se realizó exitosamente la conversión a binario. Por otro lado, el display de 7 segmentos (representado como un número binario de 7 bits) cambia su valor. Considerando la terminación ABCDEF para cada segmento de display, se afirma que este representa correctamente los números de Gray traducidos a binario. 

De esta forma se cumplen los objetivos del proyecto, al programar un diseño en HDL SystemVerilog capaz de representar tanto en LEDs como en un display de 7 segmentos las entradas en formato Gray.



## Consumo de recursos y consumo de potencia ##

En la carpeta "datos del informe" se presenta el archivo .txt generado con la herramienta Vivado respecto al consumo de potencia y recursos en la FPGA. De dicho archivo se extrae la siguiente información. 

La FPGA utilizada es la Nexys A7, familia Artix-7, empaquetado CSG324, modelo XC7A100TCSG324-1. De los recursos disponibles en dicha FPGA se utilizaron los siguientes, los cuales se muestran en la siguiente imagen.

![recursosUtilizadosFPGA](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/recursosUtilizadosFPGA.JPG?raw=true)

De dicha imagen se aprecia que la mayor parte de recursos utilizados son registros. Esto es porque, al utilizar lógica secuencial, se necesitan elementos de memoria para almacenar variables por un cierto tiempo. Considerando la cantidad de registros disponibles en la FPGA, se afirma que el diseño implementado y la cantidad de registros utilizados es proporcional al proyecto desarrollado.

Ahora bien, la cantidad de potencia total consumida se reporta en la imagen a continuación. Este dato se obtuvo gracias a las herramientas provistas por Vivado, luego de realizar la síntesis e implementación del diseño.

![potenciaGeneral](https://github.com/DJosueMM/GrayDecoder/blob/main/Im%C3%A1genes%20Informe/potenciaGeneral.jpeg?raw=true)

Una parte importante es la potencia dinámica, sin embargo, predomina la potencia estática en el diseño implementado. Esto considerando una temperatura ambiente de 25 °C aproximadamente.


## Reporte de velocidades máximas de reloj ##

El requerimiento de la velocidad de reloj para este proyecto se definió a una velocidad mínima de 50Mhz, el diseño implementado corre a una velocidad de reloj de 100Mhz, todos los datos obtenidos fueron a esta frecuencia.

Parámetros del único reloj utilizado en la implementación:

![image](https://user-images.githubusercontent.com/81501061/194942635-69adfd84-7e67-422e-b8b5-7360852a882e.png)


Se obtuvieron los siguientes tiempos de slack

![image](https://user-images.githubusercontent.com/81501061/194942671-d40430e4-b931-4872-bcb6-9a10de103aa5.png)

Como en la FPGA es muy dificil tener problemas o violaciones del thold, se analizará el tiempo de set-up. De los datos anteriores se puede apreciar que el WS para el setup es de 6.198ns, al tener un periodo de reloj de 10ns implica que de cierta manera al sistema le "sobran" 6.198ns después de completar las tareas y es por esto que no hay violaciones de tsetup. De este análisis se puede inferir que la velocidad del reloj se puede aumentar ya que hay margen de reducir el periodo total.

Tomando como el periodo mínimo el periodo actual (10ns) - WS de setup (6.198ns), se obtiene una frecuencia máxima aproximada de 260MHz.

Datos del camino con el delay máximo:

![image](https://user-images.githubusercontent.com/81501061/194942781-4fa54cbd-2be7-438f-804c-dfb287b5f031.png)




## Problemas encontrados durante el trabajo ##

El primer problema estuvo relacionado al software de Vivado. Al inicio se utilizaba por medio del VMware de la Escuela de Electrónica, sin embargo, había problemas en generar las simulaciones de los testbench. Este problema no solo retrasó el desarrollo del proyecto sino que también generó distintos problemas en la organización. Para solucionar esto se instaló de de manera local el software de Vivado, sin embargo, debido a nuestra posición geográfica hubo dificultades en activar las cuentas. Una vez con el software en el dispositivo se logró simular los testbench y corregir los errores de cada submódulo. 


El resto de problemas se dieron en la implementación e informe del proyecto. 

En cuanto a la implementación se presentaron problemas a la hora de definir los constraints en el archivo .xdc, lo que se hizo fue copiar de cada submodulo el .xdc para generar el constraint completo, sin embargo, en la acción de copiar y pegar se generaron caractéres invisibles o modificaciones de los existentes, lo que impedía correr la implementación satisfactoriamente. Esto se corrigió al usar el constraint wizard de Vivado, donde por medio de una interfaz muy amigable con el usuario se definieron las respectivas entradas y salidas del Artix-7 y la señal de reloj.

En cuanto al informe, se presentaron problemas con la obtención de datos correctos. Esto fue causado por una mala definición del reloj. Al inicio solamente se asumió que la salida E3 tenía la señal de reloj, pero nunca se definió el comando: create_clock -period 10.000 -name clk_1 -waveform {0.000 5.000} [get_ports clk]. Esto provocaba que los reportes de timing fueran nulos y los de potencia erróneos. Al agregar el comando faltante, se corrigieron los datos de timing y potencia y se logró concluir el informe con los datos correctos. 
