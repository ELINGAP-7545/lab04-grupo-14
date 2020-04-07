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