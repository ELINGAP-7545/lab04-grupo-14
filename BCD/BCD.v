module BCD (input [3:0] bcd, output reg [6:0] seg);


always @ (*) begin 
  case(bcd)                      
      4'b0000: seg = 7'b1111110; //cero 
		4'b0001: seg = 7'b0110000; //uno
		4'b0010: seg = 7'b1101101; //dos
		4'b0011: seg = 7'b1111001: //tres
		4'b0100: seg = 7'b0110011; //cuatro
		4'b0101: seg = 7'b1011011; //cinco
		4'b0110: seg = 7'b0011111; //seis
		4'b0111: seg = 7'b1110000; //siete
		4'b1000: seg = 7'b1111111; //ocho
	   4'b1001: seg = 7'b1110011; //nueve
	   4'b1010: seg = 7'b1110111; //diez-A
	   4'b1011: seg = 7'b0011111; //once-b
	   4'b1100: seg = 7'b1001110; //doce-C
	   4'b1101: seg = 7'b0111101; //trece-d
		4'b1110: seg = 7'b1001111; //catorce-E
		4'b1111: seg = 7'b1000111; //quince-F
  
  endcase
  end
endmodule