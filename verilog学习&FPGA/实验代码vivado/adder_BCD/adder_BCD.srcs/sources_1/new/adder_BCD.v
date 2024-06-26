`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/12 16:00:40
// Design Name: 
// Module Name: adder_BCD
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


module add_BCD(
    input [5:0] sw,
    input clk,
    output   [7:0]      smg_duan,
	output   [7:0]      smg_sel

    );
    reg [4:0] c_out_a;
    reg [4:0] c_out_b;
    reg [4:0] c_out;
    reg [4:0]cout_flag;
    reg [4:0] c_out_sum;
    reg [4:0] error_flag;
    reg [3:0] a;
    reg [3:0] b;
    reg [4:0] sum;
    wire[39:0]data;


always @ (posedge clk)begin
 if(!sw[5])begin
 sum<=0;
 cout_flag<=0;
 error_flag<=0;
 if(sw[4])begin
a=sw[3:0];
c_out_a[3:0]=a;
c_out=c_out_a;
end

else begin
b=sw[3:0];
c_out_b[3:0]=b;
c_out=c_out_b;
end
if(a>9||b>9) 
error_flag<=5'd15;
else error_flag<=5'd0;

end

else begin
sum=a+b;
if(sum>=10)begin
cout_flag=5'b00001;
sum=sum+5'b00110;
end
else sum<=sum;

c_out_sum[3:0]=sum[3:0];
c_out=c_out_sum;
end
end

assign data={10'b10000_10000,cout_flag,c_out,error_flag,15'b10000_10000_10000};

smg_drive smg_drive_0
(
	.clk(clk),
    .data(data),
    .dp_en(8'b11111111),
    .seg_sel(smg_sel),
    .seg_duan(smg_duan)
);

initial begin
 c_out_a<=0;
 c_out_b<=0;
 c_out<=0;
 cout_flag<=0;
 c_out_sum<=0;
 error_flag<=0;
 a<=0;
 b<=0;
 sum<=0;
  end
endmodule
