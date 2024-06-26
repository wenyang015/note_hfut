`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 13:52:29
// Design Name: 
// Module Name: counter_2
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


module counter_2(
       input clk,
       input [2:0]sw,
       output [39:0]  data
    );
      reg[5:0]minute_cnt;
      reg[5:0]second_cnt;
      wire second_0_flag;
      wire minute_0_flag;
      wire clk_1Hz;
      reg [7:0]minute;
      reg [7:0]second;
      reg [5:0]i;
      
    initial begin
        minute_cnt = 0;
        second_cnt = 0;
        minute=0;
        second=0;
        i=0;
    end
    
    conuter_1HZ conuter_1HZ_0(
        .clk(clk),
        .clk_1Hz(clk_1Hz)
    );
    assign minute_0_flag = (minute_cnt == 6'd0)?1'b1:1'b0;
    assign second_0_flag = (second_cnt == 6'd0)?1'b1:1'b0;
    
  
    always@(posedge clk_1Hz)begin
       if(sw[2])begin
        if(i==0)
            minute_cnt = 6'b000010;
            else begin
          if(!sw[1])begin
//           if(i==5 && second_0_flag)begin
//               minute_cnt <= 6'd0;
//              second_cnt <= 6'd0;
//           end
//           else minute_cnt <= minute_cnt;
            if(second_0_flag) begin
                minute_cnt <= minute_cnt - 6'b000001;
               i<=i+6'd1;
                end
            else 
                minute_cnt = minute_cnt;
       end
        else  minute_cnt = minute_cnt;
        end
        end
    end
    
     always@(posedge clk_1Hz)begin
       if(sw[2])begin
         second_cnt = 6'd0;
         if(!sw[1])begin
            if(second_0_flag)begin
                second_cnt <= 6'd59;
            end
            else begin
                second_cnt <= second_cnt - 6'd1;
            end
        end
        else 
        second_cnt <= second_cnt;
        end
        
    end
    
    always@(*)begin
    if(second_cnt[5:0]>=50)
    second=second_cnt+5'b11110;
    else if(second_cnt[5:0]>=40)
    second=second_cnt+5'b11000;
    else if(second_cnt[5:0]>=30)
    second=second_cnt+5'b10010;
    else if(second_cnt[5:0]>=20)
    second=second_cnt+5'b01100;
    else if(second_cnt[5:0]>=10)
    second=second_cnt++5'b00110;
    else 
    second=second_cnt;
    end
    
    always@(*)begin
    if(minute_cnt[5:0]>=50)
    minute=minute_cnt+5'b11110;
    else if(minute_cnt[5:0]>=40)
    minute=minute_cnt+5'b11000;
    else if(minute_cnt[5:0]>=30)
    minute=minute_cnt+5'b10010;
    else if(minute_cnt[5:0]>=20)
    minute=minute_cnt+5'b01100;
    else if(minute_cnt[5:0]>=10)
    minute=minute_cnt+5'b00110;
    else 
    minute=minute_cnt;
    end
    
    assign data={1'b0,minute[7:4],1'b0,minute[3:0],1'b0,second[7:4],1'b0,second[3:0],20'b11111_11111_11111_11111};
endmodule

