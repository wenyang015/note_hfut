`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 15:45:12
// Design Name: 
// Module Name: Booth_top
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


module Booth_top(
    input clk,
    input  [9:0]sw,
    output   [7:0]      smg_duan,
	output   [7:0]      smg_sel
    );
     wire[39:0]data;
     Booth_multiply Booth_multiply0
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
