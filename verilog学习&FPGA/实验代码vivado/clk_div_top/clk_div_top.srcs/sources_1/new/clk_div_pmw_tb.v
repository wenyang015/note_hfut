`timescale 1ns/1ns
//include"clk_div_pmw.v"
module tb_div_pmw();
    reg clk;  
    reg rst;
    reg [1:0] div;
    reg [1:0] pmw;
    wire clkout;
   
    top_module clk_out(clk, rst, div, pmw, clkout);
    always #20 clk=~clk;    
    initial
    begin
        clk=1'b0;
        rst=1'b0;
	div=2'b00;pmw=2'b00;
        #400 rst =1'b1;
	#20000 div=2'b01;pmw=2'b01;rst=1'b0;
	#40 rst =1'b1;
	#20000 div=2'b10;pmw=2'b01;rst=1'b0;
	#40 rst =1'b1;
	#20000 div=2'b11;pmw=2'b10;rst=1'b0;
	#400 rst=1'b1;
	#20000 div=2'b01;pmw=2'b11;rst=1'b0;
	#40 rst =1'b1;
	#20000 div=2'b10;pmw=2'b11;rst=1'b0;
	#40 rst =1'b1;
	#20000 div=2'b10;pmw=2'b10;rst=1'b0;
	#40 rst=1'b1;		
    end
endmodule
