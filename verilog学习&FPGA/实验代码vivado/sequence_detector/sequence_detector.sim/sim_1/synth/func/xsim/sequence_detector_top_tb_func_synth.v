// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Jun 26 01:42:39 2024
// Host        : PC01 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {D:/电脑管家迁移文件/QQ聊天记录搬家/Tencent
//               Files/1805024988/FileRecv/MobileFile/verilog_exp/verilog/sequence_detector/sequence_detector.sim/sim_1/synth/func/xsim/sequence_detector_top_tb_func_synth.v}
// Design      : sequence_detector_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* s0 = "3'b000" *) (* s1 = "3'b001" *) (* s2 = "3'b010" *) 
(* s3 = "3'b011" *) (* s4 = "3'b100" *) (* s5 = "3'b101" *) 
(* s6 = "3'b110" *) 
(* NotValidForBitStream *)
module sequence_detector_1
   (d_in,
    clk,
    rst,
    result);
  input d_in;
  input clk;
  input rst;
  output result;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire d_in;
  wire d_in_IBUF;
  wire \next_state[0]_i_1_n_0 ;
  wire \next_state[1]_i_1_n_0 ;
  wire \next_state[2]_i_1_n_0 ;
  wire \next_state_reg_n_0_[0] ;
  wire \next_state_reg_n_0_[1] ;
  wire \next_state_reg_n_0_[2] ;
  wire p_0_in;
  wire result;
  wire result_OBUF;
  wire result_i_2_n_0;
  wire rst;
  wire rst_IBUF;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF d_in_IBUF_inst
       (.I(d_in),
        .O(d_in_IBUF));
  LUT5 #(
    .INIT(32'hCAAA8EAA)) 
    \next_state[0]_i_1 
       (.I0(d_in_IBUF),
        .I1(\next_state_reg_n_0_[2] ),
        .I2(\next_state_reg_n_0_[0] ),
        .I3(rst_IBUF),
        .I4(\next_state_reg_n_0_[1] ),
        .O(\next_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hE2006000)) 
    \next_state[1]_i_1 
       (.I0(d_in_IBUF),
        .I1(\next_state_reg_n_0_[2] ),
        .I2(\next_state_reg_n_0_[0] ),
        .I3(rst_IBUF),
        .I4(\next_state_reg_n_0_[1] ),
        .O(\next_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hD0004400)) 
    \next_state[2]_i_1 
       (.I0(d_in_IBUF),
        .I1(\next_state_reg_n_0_[2] ),
        .I2(\next_state_reg_n_0_[0] ),
        .I3(rst_IBUF),
        .I4(\next_state_reg_n_0_[1] ),
        .O(\next_state[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\next_state[0]_i_1_n_0 ),
        .Q(\next_state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \next_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\next_state[1]_i_1_n_0 ),
        .Q(\next_state_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \next_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\next_state[2]_i_1_n_0 ),
        .Q(\next_state_reg_n_0_[2] ),
        .R(1'b0));
  OBUF result_OBUF_inst
       (.I(result_OBUF),
        .O(result));
  LUT1 #(
    .INIT(2'h1)) 
    result_i_1
       (.I0(rst_IBUF),
        .O(p_0_in));
  LUT3 #(
    .INIT(8'h08)) 
    result_i_2
       (.I0(\next_state_reg_n_0_[1] ),
        .I1(\next_state_reg_n_0_[2] ),
        .I2(\next_state_reg_n_0_[0] ),
        .O(result_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    result_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(result_i_2_n_0),
        .Q(result_OBUF),
        .R(p_0_in));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
