//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sat Dec  9 16:43:14 2023
//Host        : LAPTOP-A0ISF6QL running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (baud_speed,
    hsync,
    i_clk_sys,
    i_uart_rx,
    o_uart_tx,
    parity_type,
    parity_type_status,
    rst,
    tx_send_vaild,
    vgaBlue,
    vgaGreen,
    vgaRed,
    vsync);
  input baud_speed;
  output hsync;
  input i_clk_sys;
  input i_uart_rx;
  output o_uart_tx;
  input parity_type;
  output parity_type_status;
  input rst;
  input tx_send_vaild;
  output [3:0]vgaBlue;
  output [3:0]vgaGreen;
  output [3:0]vgaRed;
  output vsync;

  wire baud_speed;
  wire hsync;
  wire i_clk_sys;
  wire i_uart_rx;
  wire o_uart_tx;
  wire parity_type;
  wire parity_type_status;
  wire rst;
  wire tx_send_vaild;
  wire [3:0]vgaBlue;
  wire [3:0]vgaGreen;
  wire [3:0]vgaRed;
  wire vsync;

  design_1 design_1_i
       (.baud_speed(baud_speed),
        .hsync(hsync),
        .i_clk_sys(i_clk_sys),
        .i_uart_rx(i_uart_rx),
        .o_uart_tx(o_uart_tx),
        .parity_type(parity_type),
        .parity_type_status(parity_type_status),
        .rst(rst),
        .tx_send_vaild(tx_send_vaild),
        .vgaBlue(vgaBlue),
        .vgaGreen(vgaGreen),
        .vgaRed(vgaRed),
        .vsync(vsync));
endmodule
