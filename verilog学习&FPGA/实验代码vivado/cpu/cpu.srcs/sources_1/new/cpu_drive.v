`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/25 21:04:36
// Design Name: 
// Module Name: cpu_drive
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


module cpu_drive(
        input [11:0]sw,  
	    input clk,
	    output [39:0]data
	    );  
	    integer i;  
        reg[3:0]    data1;
        reg[3:0]    data2;
	    reg[7:0]    pc;
	    reg[7:0]    tempa;  
	    reg[7:0]  result;
	    	      
	   always @(posedge clk)  
	        begin  
	                    pc=sw[3:0]; 
	                    data1=sw[7:4]; 
	                    data2=sw[11:8]; 
	        if(!sw[0])  
	                   begin
	                    pc=8'b0000_0000;  
	                    result<=8'b0000_0000;
	      end
	        else   
	             begin  
	    case(pc[3:0])  
	    4'b0011:
	     begin  
	        result=0;  
	        result=data2+(~data1+1);
	        end  
	    
	    4'b0101:
	      begin  
	         result=0;  
	    result=data1+data2;  
	    end  
	   
    4'b1001:
	     begin  
	         result=0;  
	         result=data1&data2;  
	         end  
	  
	     4'b0111: 
	      begin  
	         result=0;  
	         tempa=data1;  
         for(i=0;i<4;i=i+1)  
	         if(data2[i]) 
	         result=result+(tempa<<i); 
	          end  
          
	    4'b1011: 
	    begin  
            result=0;  
	        result=data1|data2;  
	         end  
	        endcase   
	        end  
	      end  
	      assign data={10'h3ff,1'b0,result[7:4],1'b0,result[3:0],20'hfffff};
	endmodule  