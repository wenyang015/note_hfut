`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/12 00:06:19
// Design Name: 
// Module Name: adder1
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


module adder1(
	input a,
	input b,
	input c_in,
	output c_out,
	output sum);

assign {c_out, sum} = a + b + c_in;

endmodule

module adder16(
	input [15:0] a,
	input [15:0] b,
	input c_in,
	output c_out,
	output [15:0] sum);

	wire [3:0] C_out;
	adder4 adder16_0(a[3:0], b[3:0], c_in, C_out[0], sum[3:0]);
	genvar i;
	generate
		for(i=1; i<4; i=i+1) 
		begin: adderi
			adder4 adder16_i(a[i*4+3:4*i], b[i*4+3:4*i], C_out[i-1], C_out[i], sum[i*4+3:4*i]);
		end
	endgenerate
	assign c_out = C_out[3];
endmodule

module adder4(
	input [3:0] a,
	input [3:0] b,
	input c_in,
	output c_out,
	output [3:0] sum);

	wire [3:0] C_out;
	adder1 adder_0(a[0], b[0], c_in, C_out[0], sum[0]);
	genvar i;
	generate
		for(i=1; i<4; i=i+1) 
		begin: adderi
			adder1 adder_i(a[i], b[i], C_out[i-1], C_out[i], sum[i]);
		end
	endgenerate
	assign c_out = C_out[3];
endmodule
