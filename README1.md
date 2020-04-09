Johan Sebastian Gutierrez Espinosa
COD= 48984
Willy Steven Chaparro Nieto
COD= 62086
Deiby Andrés Moreno
COD= 31899


INTRODUCCIÓN

Este documento muestra el procedimiento que se realizó durante la elaboración del proyecto del display y demás cosas que se muestran en este documento por medio de la herramienta propuesta por el curso, manifestando todo tipo de ideas, tanto visuales como teóricas, la programación que se implemento fue algo compleja, pero la meta por cumplir siempre fue la misma que en este caso funcionara, se muestran pruebas, explicaciones, y conceptos llevados en clase para llevar un poco más el nivel de aprendizaje.
 
Objetivo
 El objetivo siempre fue realizar una buena programación con ánimo de llamar la atención y ser del agrado para la persona que le de utilidad, en este caso para el docente y compañeros de clase.

DESCRIPCION DE PROCESO
A.  Descripción del proceso del lab. BCD
Se obtiene una caja negra funcional en la cual describe primero que todo sus entradas y salidas en cuanto a la estructura de cada bloque propuesto, se implementa el primero modelo que se verá a continuación: 

 
Imagen 1 (caja negra del divisor)

En la imagen 1 se puede identificar la caja negra funcional identificando las entradas y salidas como tal estimadas para el laboratorio, se tiene lo siguiente:

CLK: es una unidad de reloj fija propuesta para llevar el sincronismo.
BCD:  el dato que se introducirá codificado a binario.
AN: Eventualmente se utiliza para conectar el ánodo del display.
SSEG: Visualización del numero dado por el BCD.  

Descriptivamente se tiene que esta caja se dividirá en varios bloques en los cuales se vean reflejados las funcionalidades dadas para la implementación del trabajo dado que se tiene: 

 
Imagen 2 (caja negra diagrama estructural)

Se tiene que en la imagen 2 se dividen los bloques funcionales que conectan cada una de las entradas y salidas correspondientes, en el primer bloque se obtiene como tal la DivFre que es la encargada de dividir el valor de la frecuencia dada por el reloj que en este caso es el CLK, esto aclarando que es debidamente en el tiempo requerido para cada cambio que se obtenga en el An.

Para el Sel An se tiene que toda la sincronización es llevada al mismo tiempo que se realiza el cambio en el anodo, adicionando que hay un desplazamiento dado desde el bit MS, y esto quedaría dado en el siguiente ejemplo como lo siguiente:


HDL 4 DISPLAY

lo primero que se realiza es el HDL para un solo display en el cual va a aumentar de 0 a 10 y luego va a seguir contando en hexadecimal hasta llegar a F, a continuacion se puede evidenciar el HDL un solo display.

 

luego de tener ya el HDL pude un display lo que se realiza es que se crea una entrada en la cual la llamamos num de 16 bit en la cual se va a dividir en 4 partes para que cada uno se visualice en los 4 display que se tienen de salida, a continuacion vemos el HDL para los 4 display utilizando tambien el de solo un display.

 
 

y por ultimo lo que se realizo fue crear el testbench para hacer que realice el funcionamiento de corrido.
 

SIMULACION

teniendo el testbench y todo el HDL que se necesita para encender los 4 display abrimos y comprobamos el funcionamiento con el simulador ModelSim-Altera.
