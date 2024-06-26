`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/21 20:40:38
// Design Name: 
// Module Name: sequence_detector_top
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


module sequence_detector_1(
  input d_in,
    input clk,
    input rst,
    output reg result
    );
 localparam s0 = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011,
            s4 = 3'b100,
            s5 = 3'b101,
            s6 = 3'b110;
    reg [2:0] state;
    reg [2:0]next_state;
    always@(*) begin
        if(!rst)
		    state <= s0;
		else
			state <= next_state;
    end

    always@(posedge clk) begin
        case(state)
            s0: if(d_in==0)
                    next_state <= s0;
                else
                    next_state <= s1;
            s1: if(d_in==0)
                    next_state <= s0;
                else
                    next_state <= s2;
            s2: if(d_in==0)
                    next_state <= s0;
                else 
                    next_state <= s3;
            s3: if(d_in==0)
                    next_state <= s4;
                else
                    next_state <= s2;
            s4: if(d_in==0)
                    next_state <= s5;
                else
                    next_state <= s1;
            s5: if(d_in==0)
                    next_state <= s6;
                else
                    next_state <= s1;
            s6: if(d_in==0)
                    next_state <= s0;
                else
                    next_state <= s1;      
        endcase
    end

    always@(posedge clk) begin
		if(!rst)
			result <= 1'b0;
		else
			case(next_state)
				s0: result <= 1'b0;
				s1: result <= 1'b0;
				s2: result <= 1'b0;
				s3: result <= 1'b0;
				s4: result <= 1'b0;
				s5: result <= 1'b0;
                s6: result <= 1'b1;
				default:result = 1'b0;
			endcase
    end
endmodule

module sequence_detector_2(
    input d_in,
    input clk,
    input rst,
    output reg result);
 localparam s0 = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011,
            s4 = 3'b100,
            s5 = 3'b101,
            s6 = 3'b110;
    reg [2:0] state;
    reg [2:0]next_state;
    always@(posedge clk) begin
        if(!rst)
		    state <= s0;
		else
			state <= next_state;
    end

    always@(*) begin
        case(state)
            s0: if(d_in==0)
                    next_state <= s0;
                else
                    next_state <= s1;
            s1: if(d_in==0)
                    next_state <= s2;
                else
                    next_state <= s0;
            s2: if(d_in==0)
                    next_state <= s0;
                else 
                    next_state <= s3;
            s3: if(d_in==0)
                    next_state <= s2;
                else
                    next_state <= s4;
            s4: if(d_in==0)
                    next_state <= s2;
                else
                    next_state <= s5;
            s5: if(d_in==0)
                    next_state <= s6;
                else
                    next_state <= s0;
            s6: if(d_in==0)
                    next_state <= s0;
                else
                    next_state <= s1;      
        endcase
    end

    always@(posedge clk) begin
		if(!rst)
			result <= 1'b0;
		else
			case(next_state)
				s0: result <= 1'b0;
				s1: result <= 1'b0;
				s2: result <= 1'b0;
				s3: result <= 1'b0;
				s4: result <= 1'b0;
				s5: result <= 1'b0;
                s6: result <= 1'b1;
				default:result <= 1'b0;
			endcase
    end
endmodule
