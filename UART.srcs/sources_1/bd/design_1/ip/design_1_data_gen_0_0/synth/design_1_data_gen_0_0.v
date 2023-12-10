// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:data_gen:1.0
// IP Revision: 1

(* X_CORE_INFO = "data_gen,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "design_1_data_gen_0_0,data_gen,{}" *)
(* CORE_GENERATION_INFO = "design_1_data_gen_0_0,data_gen,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=data_gen,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,BLACK=0x000,RED=0xF00,GREEN=0x0F0,BLUE=0x00F,WHITE=0xFFF,GREY=0x888,FIREBRICK4=0x922,height=256,width=256,TOTAL=65536,POS_X=192,POS_Y=112}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_data_gen_0_0 (
  clk,
  rst_n,
  f_clk,
  h_addr,
  v_addr,
  data_i,
  pi_flag,
  data_disp
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 25000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME f_clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 f_clk CLK" *)
input wire f_clk;
input wire [10 : 0] h_addr;
input wire [10 : 0] v_addr;
input wire [15 : 0] data_i;
input wire pi_flag;
output wire [11 : 0] data_disp;

  data_gen #(
    .BLACK(12'H000),
    .RED(12'HF00),
    .GREEN(12'H0F0),
    .BLUE(12'H00F),
    .WHITE(12'HFFF),
    .GREY(12'H888),
    .FIREBRICK4(12'H922),
    .height(256),
    .width(256),
    .TOTAL(65536),
    .POS_X(192),
    .POS_Y(112)
  ) inst (
    .clk(clk),
    .rst_n(rst_n),
    .f_clk(f_clk),
    .h_addr(h_addr),
    .v_addr(v_addr),
    .data_i(data_i),
    .pi_flag(pi_flag),
    .data_disp(data_disp)
  );
endmodule
