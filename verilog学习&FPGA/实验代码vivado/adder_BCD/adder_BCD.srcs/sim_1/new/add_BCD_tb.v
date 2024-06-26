`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/12 16:10:38
// Design Name: 
// Module Name: add_BCD_tb
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


module add_BCD_tb();
	reg [5:0] sw;
    reg clk;
    wire   [7:0]      smg_duan;
	wire   [7:0]      smg_sel;

	 add_BCD add_BCD1(
	 .sw(sw),
	 .clk(clk),
	 .smg_duan(smg_duan),
	 .smg_sel(smg_sel));

initial
	begin
		sw=6'b000000;
		clk=0;
		#1000 sw[4]=1;sw[3:0]=4'b0011;
		#1000 sw[4]=0;sw[3:0]=4'b0101;
		#1000 sw[5]=1;
		#1000 sw[5]=0;
		#1000 sw[4]=1;sw[3:0]=4'b0111;
		#1000 sw[4]=0;sw[3:0]=4'b0110;
		#1000 sw[5]=1;
		#1000 sw[5]=0;
		#1000 sw[4]=1;sw[3:0]=4'b0001;
		#1000 sw[4]=0;sw[3:0]=4'b1011;
	end
always #1 clk=~clk;

endmodule
