`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/21 20:43:09
// Design Name: 
// Module Name: sequence_detector_top_tb
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


module sequence_detector_top_tb();
    reg clk;
    reg rst;
    reg din;
    wire result1;
    wire result2;
    wire result_on;
    sequence_detector_1 sd1 
    (
    .d_in(din), 
    .clk(clk), 
    .rst(rst), 
    .result(result1)
    );
    
    sequence_detector_2 sd2 (
    .d_in(din), 
    .clk(clk), 
    .rst(rst), 
    .result(result2)
    );
   assign  result_on=result1||result2;
 always@(*) rst=result_on; 
    
    
    initial                                                
        begin                                                  
            clk=0;rst=0;din=0;
            #15 rst=1;
            #10 din=1;
            #10 din=0;
            #10 din=1;
            #10 din=1;
            #10 din=1;
            #10 din=0;
            #10 din=0;
            #10 din=0;
            #10 din=1;
            #10 din=0;      
            #30 $stop;             
        end                                                    
    always                                                               
        begin                                                  
            #5 clk=~clk;                                     
        end     
endmodule
