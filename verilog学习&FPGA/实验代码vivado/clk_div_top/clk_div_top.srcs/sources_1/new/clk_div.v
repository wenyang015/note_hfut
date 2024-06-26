module div1_pmw1(
	input clk,
	input rst,
	output reg clk_div);
       	reg [4:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==5'd15)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==5'd30)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module div1_pmw2(
	input clk,
	input rst,
	output reg clk_div);
       	reg [4:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==5'd20)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==5'd30)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module div1_pmw3(
	input clk,
	input rst,
	output reg clk_div);
       	reg [4:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==5'd10)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==5'd30)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module div1_pmw4(
	input clk,
	input rst,
	output reg clk_div);
       	reg [4:0] cnt;
	always@(posedge clk) begin
	if(!rst)
	begin
		clk_div<=0;
		cnt = 0;
	end
	else cnt = cnt + 1;
	if(cnt==5'd12)
	begin
		clk_div <= ~clk_div;
	end
	if(cnt==5'd30)
	begin
		cnt = 0;	
		clk_div <= ~clk_div;
	end	
end
endmodule

module top_module1(
	input clk,
	input rst,
	input [1:0] pmw,
	output reg clk_div_pmw);

   	wire clkout1;
   	wire clkout2;
   	wire clkout3;
	wire clkout4;
    	div1_pmw1 clk1(clk, rst, clkout1);
    	div1_pmw2 clk2(clk, rst, clkout2);
    	div1_pmw3 clk3(clk, rst, clkout3);
    	div1_pmw4 clk4(clk, rst, clkout4);

	always@(*)
	case(pmw)
		2'b00: clk_div_pmw <= clkout1;
		2'b01: clk_div_pmw <= clkout2;
		2'b10: clk_div_pmw <= clkout3;
		2'b11: clk_div_pmw <= clkout4;
	endcase
endmodule


