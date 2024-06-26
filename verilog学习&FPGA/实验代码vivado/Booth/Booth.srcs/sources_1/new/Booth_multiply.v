`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 16:37:49
// Design Name: 
// Module Name: Booth_multiply
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


module Booth_multiply(
    input clk,
    input  [9:0]sw,
    output [39:0]data
    );
    reg [4:0] c_out_a;
    reg [4:0] c_out_b;
    reg [9:0] c_out;
    reg [9:0] c_out_booth;
    reg [3:0] a;
    reg [3:0] b;
    reg [7:0] booth;
    reg [7:0] a_0;
    reg [7:0] a_1;
    reg [7:0] a_2;
    reg [7:0] a_3;
    reg [7:0] a_booth;
    always@(posedge clk)begin
    if(!sw[9])begin
    booth<=0;
     a_0<=0;
     a_1<=0;
     a_2<=0;
     a_3<=0;
     a_booth<=0;
    if(!sw[8])begin
    a=sw[3:0];
    c_out_a[3:0]=a;
    c_out={6'b10000_0,c_out_a};
    end
    else begin
    b=sw[7:4];
    c_out_b[3:0]=b;
    c_out={6'b10000_0,c_out_b};
    end
    end
    else begin
    if(b>=4'd8)begin
    a_3=a<<3;
    b=b-4'd8;
    end
    else if(b>=4'd4)begin
    a_2=a<<2;
    b=b-4'd4;
    end
    else if(b>=4'd2)begin
    a_1=a<<1;
    b=b-4'd2;
    end
    else if(b>=4'd1)begin
    a_0=a;
    b=b-4'd1;
    end
    a_booth=a_0+a_1+a_2+a_3;
    booth=a_booth[7:0];
  //  booth=a*b;
    c_out_booth={1'b0,booth[7:4],1'b0,booth[3:0]};
    c_out=c_out_booth;
    end
    end
    assign data={10'b10000_10000,c_out,20'b10000_10000_10000_10000};

    initial begin
 c_out_a<=0;
 c_out_b<=0;
 c_out<=0;
 c_out_booth<=0;
 a<=0;
 b<=0;
 booth<=0;
 a_0<=0;
 a_1<=0;
 a_2<=0;
 a_3<=0;
 a_booth<=0;
  end
    
endmodule
