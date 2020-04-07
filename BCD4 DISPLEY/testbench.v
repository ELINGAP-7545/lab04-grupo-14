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