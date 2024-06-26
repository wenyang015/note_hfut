`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 23:25:18
// Design Name: 
// Module Name: counter_top
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


module counter_top(
  input clk,
  input [2:0]sw,
  output   [7:0]      smg_duan,
  output   [7:0]      smg_sel
 );
wire [39:0]data;

counter counter_0
(
  .clk(clk),
  .sw(sw),
  .data(data)
);
//counter_2 counter_2_0
//(
//  .clk(clk),
//  .sw(sw),
//  .data(data)
//);

smg_drive smg_drive_0
(
	.clk(clk),
    .data(data),
    .dp_en(8'b00001111),
    .seg_sel(smg_sel),
    .seg_duan(smg_duan)
);
endmodule
