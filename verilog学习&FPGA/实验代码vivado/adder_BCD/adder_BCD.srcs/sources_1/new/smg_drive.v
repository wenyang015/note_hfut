`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 12:14:17
// Design Name: 
// Module Name: smg_drive
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


module smg_drive
(
    input		 clk,
    input [39:0] data,	
    input  [7:0] dp_en,		
    
    output reg [7:0] seg_sel,		
    output reg [7:0] seg_duan	
);

reg [31:0] cnt;
always @(posedge clk)
	cnt <= cnt + 1'b1;



reg [4:0] HEX;				
always  @ (posedge clk)
begin
	case(cnt[18:16])		
		3'b000 : begin HEX <= data[39:35]; seg_sel<=8'b10000000;end
		3'b001 : begin HEX <= data[34:30];seg_sel<=8'b01000000;end
		3'b010 : begin HEX <= data[29:25];seg_sel<=8'b00100000;end
		3'b011 : begin HEX <= data[24:20];seg_sel<=8'b00010000;end
		3'b100 : begin HEX <= data[19:15];seg_sel<=8'b00001000;end
		3'b101 : begin HEX <= data[14:10];seg_sel<=8'b00000100;end
		3'b110 : begin HEX <= data[9:5];seg_sel<=8'b00000010;end
		3'b111 : begin HEX <= data[4:0];seg_sel<=8'b00000001;end
		default : ;
	endcase
end




always  @ (posedge clk)
begin
	case(cnt[18:16])
		3'b000 : seg_duan[7] <= dp_en[7];
		3'b001 : seg_duan[7] <= dp_en[6];
		3'b010 : seg_duan[7] <= dp_en[5];
		3'b011 : seg_duan[7] <= dp_en[4];	
		3'b100 : seg_duan[7] <= dp_en[3];
		3'b101 : seg_duan[7] <= dp_en[2];
		3'b110 : seg_duan[7] <= dp_en[1];
		3'b111 : seg_duan[7] <= dp_en[0];
		default : ;
	endcase
end


always @ (HEX)
begin
	case(HEX)
      5'd0: seg_duan[6:0] <= 7'b1000000;    
      5'd1: seg_duan[6:0] <= 7'b1111001;
      5'd2: seg_duan[6:0] <= 7'b0100100;
      5'd3: seg_duan[6:0] <= 7'b0110000;
      5'd4: seg_duan[6:0] <= 7'b0011001;
      5'd5: seg_duan[6:0] <= 7'b0010010;
      5'd6: seg_duan[6:0] <= 7'b0000010;
      5'd7: seg_duan[6:0] <= 7'b1111000;
      5'd8: seg_duan[6:0] <= 7'b0000000;
      5'd9: seg_duan[6:0] <= 7'b0010000;
      5'd15: seg_duan[6:0] <= 7'b0000110;
      default:seg_duan[6:0] <= 7'b1111111;
    endcase
end
		
endmodule



