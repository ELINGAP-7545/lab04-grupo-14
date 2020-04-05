`timescale 1ns / 1ps

module testbench;

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
	 #10 rst=0;
	 num=16'h4321;
	 end
	 always #1 clk2 = ~clk2;

endmodule