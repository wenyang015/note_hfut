`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 16:58:57
// Design Name: 
// Module Name: Booth_top_tb
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


module Booth_top_tb();
	reg [9:0] sw;
    reg clk;
    wire   [7:0]      smg_duan;
	wire   [7:0]      smg_sel;

	 Booth_top Booth_top1(
	 .sw(sw),
	 .clk(clk),
	 .smg_duan(smg_duan),
	 .smg_sel(smg_sel)
	 );
initial
	begin
		sw=10'b0000000000;
		clk=0;
		
		#100 sw[8]=0;sw[3:0]=4'b0010;
		#100 sw[8]=1;sw[7:4]=4'b0111;
		#100 sw[9]=1;
		#100 sw[9]=0;
		#100 sw[8]=0;sw[3:0]=4'b1110;
		#100 sw[8]=1;sw[7:4]=4'b0111;
		#100 sw[9]=1;
		#100 sw[9]=0;
		#100 sw[8]=0;sw[3:0]=4'b1111;
    	#100 sw[8]=1;sw[7:4]=4'b1111;
		#100 sw[9]=1;
		#100 sw[9]=0;
	end
always #1 clk=~clk;
endmodule
