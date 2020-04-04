`timescale 1ns / 1ps  //el clock o tiempo de cambio

module testbench;

reg [3:0] bcd;  // entrada

wire [6:0] seg;  //salida

BCD uut (
      .bcd(bcd),
		.seg(seg)
		);
initial begin 
       bcd =0; #5;
		 bcd =1; #5;
		 bcd =2; #5;
		 bcd =3; #5;
		 bcd =4; #5;
		 bcd =5; #5;
		 bcd =6; #5;
		 bcd =7; #5;
		 bcd =8; #5;
		 bcd =9; #5;
		 bcd =10; #5;
		 bcd =11; #5;
		 bcd =12; #5;
		 bcd =13; #5;
		 bcd =14; #5;
		 bcd =15; #5;

  end 
	
endmodule
		 