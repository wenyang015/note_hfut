
module top_module(
	input clk,
	input rst,
	input [1:0] div,
	input [1:0] pmw,
	output reg clk_out);

	wire clkout1;
 	wire clkout2;
    	wire clkout3;
    	wire clkout4;
	top_module1 clk_out1(clk, rst, pmw, clkout1);
	top_module2 clk_out2(clk, rst, pmw, clkout2);
	top_module3 clk_out3(clk, rst, pmw, clkout3);
	top_module4 clk_out4(clk, rst, pmw, clkout4);
	
	always@(*)
	begin
	case(div)
		2'b00: clk_out <= clkout1;
		2'b01: clk_out <= clkout2;
		2'b10: clk_out <= clkout3;
		2'b11: clk_out <= clkout4;
	endcase
	end
endmodule
	