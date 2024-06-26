`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/12 00:11:25
// Design Name: 
// Module Name: adder1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module adder1_tb();
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;
	wire [15:0] sum;
	wire c_out;

	adder16 adder_tb(a, b, c_in, c_out, sum);

initial
	begin
		#0 a=16'b1111000011110000;b=16'b0000010100000101;c_in=1'b1;
		#100 a=16'b1111110011111100;b=16'b0000010010001001;c_in=1'b0;
		#200 a=16'b1111110011111100;b=16'b0000100100001001;c_in=1'b1;
		#300 a=16'b1010010110100101;b=16'b0101101001011010;c_in=1'b0;
		#400 a=16'b1010010110100101;b=16'b0101101001011010;c_in=1'b1;
	end
endmodule

