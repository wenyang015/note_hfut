`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/13 23:46:43
// Design Name: 
// Module Name: conuter_1HZ
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


module conuter_1HZ(
    input clk,
    output reg clk_1Hz
    );
     reg [26:0]cnt;
    initial begin
        clk_1Hz = 0;
        cnt = 0;
    end
    always@(posedge clk)begin
        if(cnt == 27'd49999999)begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    always@(posedge clk)begin
        if(cnt < 27'd24999999)begin
            clk_1Hz <= 1'b0;
        end
        else begin
            clk_1Hz <= 1'b1;
        end
    end
    
    
endmodule
