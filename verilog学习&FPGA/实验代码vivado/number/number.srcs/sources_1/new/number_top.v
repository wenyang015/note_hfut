`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/21 14:06:37
// Design Name: 
// Module Name: number_top
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


module number_top(
input clk,
output reg [7:0]max,
output reg [4:0]k
    );
reg[7:0]mem[31:0];
integer i;
initial 
  begin
      mem[0]<=8'b00000001;
	  mem[1]<=8'b00000010;
	  mem[2]<=8'b00000011;
	  mem[3]<=8'b00000100;
	  mem[4]<=8'b00000101;
	  mem[5]<=8'b00000110;
	  mem[6]<=8'b00000111;
	  mem[7]<=8'b00001000;
	  mem[8]<=8'b00001001;
	  mem[9]<=8'b00001010;
      mem[10]<=8'b00001011;
	  mem[11]<=8'b00001100;
      mem[12]<=8'b00001101;	 
      mem[13]<=8'b00001110;
	  mem[14]<=8'b00001111;
	  mem[15]<=8'b00010000;
	  mem[16]<=8'b00010001;
	  mem[17]<=8'b00010010;
	  mem[18]<=8'b00010011;
	  mem[19]<=8'b00010100;
	  mem[20]<=8'b00010101;
	  mem[21]<=8'b00010110;
	  mem[22]<=8'b00010111;
      mem[23]<=8'b00011000;
	  mem[24]<=8'b11111111;
      mem[25]<=8'b00011010;
	  mem[26]<=8'b11000000;
	  mem[27]<=8'b00011100;
	  mem[28]<=8'b00011101;
	  mem[29]<=8'b00111001;
	  mem[30]<=8'b10011111;
	  mem[31]<=8'b01000000;
  end
		
always@( posedge clk )begin
  for(i=0;i<32;i=i+1)
	if(max<=mem[i])
	    begin
		   max=mem[i];
		   k=i;
		  end
	else
		   begin
		     max=max;
		     k=k;
		   end
		   end
endmodule
