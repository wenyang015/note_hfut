`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/21 20:57:23
// Design Name: 
// Module Name: cpu_top
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


module cpu_top(
  input clk,
  input [11:0]sw,
  output   [7:0]      smg_duan,
  output   [7:0]      smg_sel
);
wire [39:0]data;
cpu_drive cpu_drive_0
(
  .clk(clk),
  .sw(sw),
  .data(data)
);
smg_drive smg_drive_0
(
	.clk(clk),
    .data(data),
    .dp_en(8'b11111111),
    .seg_sel(smg_sel),
    .seg_duan(smg_duan)
);
endmodule
