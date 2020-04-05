`timescale 1ns / 1ps

module BCD4DISPLAY(input [15:0] num, input clk, output [0:6] seg, output reg [3:0] An, input rst );

reg [3:0] bcd=0;

BCD uut ( .BCD(bcd), .Seg(seg) );

reg [1:0] count=0;

always @(posedge clk) begin
		if(rst==1) begin
			count<= 0;
			An<=4'b1111; 
		end
		else begin 
			count<= count+1; 
			case (count) 
				2'h0: begin bcd <= num[3:0];   An<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   An<=4'b1101; end 
				2'h2: begin bcd <= num[11:8];  An<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; An<=4'b0111; end 
			endcase
		end
end

endmodule