# lab04
BCD2SSeg


Johan Sebastian Gutierrez Espinosa
COD= 48984
Willy Steven Chaparro Nieto
COD= 62086
Deiby Andrés Moreno 
COD= 31899


INTRODUCCIÓN 

Este documento muestra el procedimiento que se realizó durante la elaboración del proyecto del display y demás cosas que se muestran en este documento por medio de la herramienta propuesta por el curso, manifestando todo tipo de ideas, tanto visuales como teóricas, la programación que se implemento fue algo compleja, pero la meta por cumplir siempre fue la misma que en este caso funcionara, se muestran pruebas, explicaciones, y conceptos llevados en clase para llevar un poco más el nivel de aprendizaje.
 
Objetivo: El objetivo siempre fue realizar una buena programación con ánimo de llamar la atención y ser del agrado para la persona que le de utilidad, en este caso para el docente y compañeros de clase.

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

module BCD (input [3:0] BCD, output reg [6:0] Seg, output [3:0] An);


always @ (*) begin 
  case(BCD)                      
      4'b0000: Seg = 7'b1111110; //cero 
		4'b0001: Seg = 7'b0110000; //uno
		4'b0010: Seg = 7'b1101101; //dos
		4'b0011: Seg = 7'b1111001; //tres
		4'b0100: Seg = 7'b0110011; //cuatro
		4'b0101: Seg = 7'b1011011; //cinco
		4'b0110: Seg = 7'b0011111; //seis
		4'b0111: Seg = 7'b1110000; //siete
		4'b1000: Seg = 7'b1111111; //ocho
	   4'b1001: Seg = 7'b1110011; //nueve
	   4'b1010: Seg = 7'b1110111; //diez-A
	   4'b1011: Seg = 7'b0011111; //once-b
	   4'b1100: Seg = 7'b1001110; //doce-C
	   4'b1101: Seg = 7'b0111101; //trece-d
		4'b1110: Seg = 7'b1001111; //catorce-E
		4'b1111: Seg = 7'b1000111; //quince-F
  
  endcase
  end
endmodule
 

luego de tener ya el HDL pude un display lo que se realiza es que se crea una entrada en la cual la llamamos num de 16 bit en la cual se va a dividir en 4 partes para que cada uno se visualice en los 4 display que se tienen de salida, a continuacion vemos el HDL para los 4 display utilizando tambien el de solo un display.

`timescale 1ns / 1ps

module BCD4DISPLAY(input [15:0] num, input clk, output [0:6] seg, output reg [3:0] An, input rst );
//se crean las entradas y salidas tambien el registro bcd
reg [3:0] bcd=0;
BCD uut ( .BCD(bcd), .Seg(seg) );
reg [26:0] cfreq=0;//se crea un registro cfreq q se va a 
                   //utilizar para el divisor de la frecuencia
wire enable;// cable
// Divisor de frecuecia
// se realiza estadivision de frecuencia para que se pueda visualizar
// los digitos el los 4 display durante un tiempo de 16ms
assign enable = cfreq[16];
assign led =enable;
always @(posedge clk) begin
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end
reg [1:0] count=0;// este registro es el que se utiliza para 
                  //escojer en cual de los display se va a 
					   // visualizar el digito, se inicia en cero.
always @(posedge enable) begin
		if(rst==1) begin
			count<= 0;
			An<=4'b1111; //se escoge que en ningun display se visualice ningun dato
		end
		else begin 
			count<= count+1;//se aumenta el count para variar 
		                   // el display donde se va a visualizar
								//el dato 
			case (count) 
				2'h0: begin bcd <= num[3:0];   An<=4'b1110; end
			   //se van a bisualizar los primeros 4 bit de num	
				2'h1: begin bcd <= num[7:4];   An<=4'b1101; end
			   //se visualiza los siguientes 4 bit y asi hasta
				// llegar a los 15 bits que es el maximo de num
				2'h2: begin bcd <= num[11:8];  An<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; An<=4'b0111; end 
			endcase
		end
end

endmodule

 

y por ultimo lo que se realizo fue crear el testbench para hacer que realice el funcionamiento de corrido.
`timescale 1ns / 1ps

module testbench;
// se crea los registros 
reg [15:0] num;
reg clk2;
reg rst;


wire [0:6] seg;
wire [3:0] An;

BCD4DISPLAY uut (.num(num), 
                 .clk(clk2), 
					  .seg(seg), 
					  .An(An), 
					  .rst(rst));

initial begin 
    clk2=0;
	 rst=1;
	 #10 rst=0;//se toma un tiempo de espera
	 num=16'h4321;//se llaman los display 
	 end
	 always #1 clk2 = ~clk2;

endmodule
 

SIMULACION 

teniendo el testbench y todo el HDL que se necesita para encender los 4 display abrimos y comprobamos el funcionamiento con el simulador ModelSim-Altera.



 
 



 


