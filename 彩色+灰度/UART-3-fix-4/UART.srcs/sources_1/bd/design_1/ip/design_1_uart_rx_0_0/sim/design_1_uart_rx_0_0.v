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


// IP VLNV: xilinx.com:module_ref:uart_rx:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_uart_rx_0_0 (
  i_clk_sys,
  i_rst_n,
  i_uart_rx,
  cycle_baud,
  parity_type,
  o_dout_r,
  o_dout_g,
  o_dout_b,
  o_ld_parity,
  dout_vld
);

input wire i_clk_sys;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst_n RST" *)
input wire i_rst_n;
input wire i_uart_rx;
input wire [7 : 0] cycle_baud;
input wire parity_type;
output wire [7 : 0] o_dout_r;
output wire [7 : 0] o_dout_g;
output wire [7 : 0] o_dout_b;
output wire o_ld_parity;
output wire dout_vld;

  uart_rx #(
    .DATA_WIDTH(8),
    .PARITY_ON(0)
  ) inst (
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_uart_rx(i_uart_rx),
    .cycle_baud(cycle_baud),
    .parity_type(parity_type),
    .o_dout_r(o_dout_r),
    .o_dout_g(o_dout_g),
    .o_dout_b(o_dout_b),
    .o_ld_parity(o_ld_parity),
    .dout_vld(dout_vld)
  );
endmodule
