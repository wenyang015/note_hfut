`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/21 19:47:14
// Design Name: 
// Module Name: number_top_tb
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


module number_top_tb();
reg clk;

wire [7:0]max;
wire [4:0]k;
number_top number1
(
.clk(clk),
.max(max),
.k(k)
);
initial begin
clk<=0;
end
always #1 clk=~clk;
endmodule
