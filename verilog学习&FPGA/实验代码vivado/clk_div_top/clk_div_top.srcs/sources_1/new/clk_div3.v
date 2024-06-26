module div3_pmw1(
	input clk,
	input rst,
	output reg clk_div);
       	reg [6:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==7'd45)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==7'd90)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module div3_pmw2(
	input clk,
	input rst,
	output reg clk_div);
       	reg [6:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==7'd60)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==7'd90)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module div3_pmw3(
	input clk,
	input rst,
	output reg clk_div);
       	reg [6:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==7'd30)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==7'd90)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module div3_pmw4(
	input clk,
	input rst,
	output reg clk_div);
       	reg [6:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==7'd36)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==7'd90)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module top_module3(
	input clk,
	input rst,
	input [1:0] pmw,
	output reg clk_div_pmw);

   	wire clkout1;
   	wire clkout2;
   	wire clkout3;
	wire clkout4;
    	div3_pmw1 clk1(clk, rst, clkout1);
    	div3_pmw2 clk2(clk, rst, clkout2);
    	div3_pmw3 clk3(clk, rst, clkout3);
    	div3_pmw4 clk4(clk, rst, clkout4);

	always@(*)
	case(pmw)
		2'b00: clk_div_pmw <= clkout1;
		2'b01: clk_div_pmw <= clkout2;
		2'b10: clk_div_pmw <= clkout3;
		2'b11: clk_div_pmw <= clkout4;
	endcase
endmodule
