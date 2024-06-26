`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 11:35:36
// Design Name: 
// Module Name: counter_top_tb
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


module counter_top_tb( );
  reg clk;
  reg [2:0]sw;
  wire  [7:0]      smg_duan;
  wire  [7:0]      smg_sel;
  
  counter_top counter_top_1
  (
    .clk(clk),
    .sw(sw),
    .smg_duan(smg_duan),
    .smg_sel(smg_sel)
  );
  
  
  
initial
	begin
		sw=3'b000;
		clk=0;
		#100000 sw[2]=1;
		
	end
always #10 clk=~clk;
endmodule
