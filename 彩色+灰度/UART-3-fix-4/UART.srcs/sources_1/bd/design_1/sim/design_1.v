//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Dec 13 17:21:53 2023
//Host        : LAPTOP-A0ISF6QL running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BAUD_SPEED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BAUD_SPEED, LAYERED_METADATA undef" *) input baud_speed;
  output hsync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.I_CLK_SYS CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.I_CLK_SYS, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input i_clk_sys;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.I_UART_RX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.I_UART_RX, LAYERED_METADATA undef" *) input i_uart_rx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.O_UART_TX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.O_UART_TX, LAYERED_METADATA undef" *) output o_uart_tx;
  input parity_type;
  output parity_type_status;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  input tx_send_vaild;
  output [3:0]vgaBlue;
  output [3:0]vgaGreen;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VGARED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VGARED, LAYERED_METADATA undef" *) output [3:0]vgaRed;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VSYNC DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VSYNC, LAYERED_METADATA undef" *) output vsync;

  wire baud_speed_1;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_clk_out3;
  wire [11:0]data_gen_0_data_disp;
  wire i_clk_sys_1;
  wire parity_type_1;
  wire rgb2gray_0_oValid;
  wire rst_1;
  wire rx_1;
  wire [7:0]speed_select_0_cycle_baud;
  wire speed_select_0_o_tx_send_vaild;
  wire speed_select_0_parity_type_status;
  wire tx_send_vaild_1;
  wire uart_rx_0_dout_vld;
  wire [7:0]uart_rx_0_o_dout_b;
  wire [7:0]uart_rx_0_o_dout_g;
  wire [7:0]uart_rx_0_o_dout_r;
  wire [7:0]uart_rx_0_o_uart_data;
  wire uart_tx_0_o_uart_tx;
  wire [0:0]util_vector_logic_0_Res;
  wire [10:0]vga_ctrl_0_h_addr;
  wire vga_ctrl_0_hsync;
  wire [10:0]vga_ctrl_0_v_addr;
  wire [3:0]vga_ctrl_0_vga_b;
  wire [3:0]vga_ctrl_0_vga_g;
  wire [3:0]vga_ctrl_0_vga_r;
  wire vga_ctrl_0_vsync;

  assign baud_speed_1 = baud_speed;
  assign hsync = vga_ctrl_0_hsync;
  assign i_clk_sys_1 = i_clk_sys;
  assign o_uart_tx = uart_tx_0_o_uart_tx;
  assign parity_type_1 = parity_type;
  assign parity_type_status = speed_select_0_parity_type_status;
  assign rst_1 = rst;
  assign rx_1 = i_uart_rx;
  assign tx_send_vaild_1 = tx_send_vaild;
  assign vgaBlue[3:0] = vga_ctrl_0_vga_b;
  assign vgaGreen[3:0] = vga_ctrl_0_vga_g;
  assign vgaRed[3:0] = vga_ctrl_0_vga_r;
  assign vsync = vga_ctrl_0_vsync;
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(i_clk_sys_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2),
        .clk_out3(clk_wiz_0_clk_out3),
        .reset(rst_1));
  design_1_data_gen_0_0 data_gen_0
       (.clk(clk_wiz_0_clk_out1),
        .data_disp(data_gen_0_data_disp),
        .data_i(uart_rx_0_o_uart_data),
        .f_clk(clk_wiz_0_clk_out2),
        .h_addr(vga_ctrl_0_h_addr),
        .pi_flag(rgb2gray_0_oValid),
        .pixel_b(uart_rx_0_o_dout_b),
        .pixel_g(uart_rx_0_o_dout_g),
        .pixel_r(uart_rx_0_o_dout_r),
        .rst_n(util_vector_logic_0_Res),
        .v_addr(vga_ctrl_0_v_addr));
  design_1_rgb2gray_0_0 rgb2gray_0
       (.blue(uart_rx_0_o_dout_b),
        .clk(clk_wiz_0_clk_out2),
        .gray(uart_rx_0_o_uart_data),
        .green(uart_rx_0_o_dout_g),
        .iValid(uart_rx_0_dout_vld),
        .oValid(rgb2gray_0_oValid),
        .red(uart_rx_0_o_dout_r),
        .rst_n(util_vector_logic_0_Res));
  design_1_speed_select_0_0 speed_select_0
       (.clk(clk_wiz_0_clk_out2),
        .cycle_baud(speed_select_0_cycle_baud),
        .i_tx_send_vaild(tx_send_vaild_1),
        .o_tx_send_vaild(speed_select_0_o_tx_send_vaild),
        .parity_type(parity_type_1),
        .parity_type_status(speed_select_0_parity_type_status),
        .rst_n(util_vector_logic_0_Res),
        .slow_clk(clk_wiz_0_clk_out3),
        .speed_se(baud_speed_1));
  design_1_uart_rx_0_0 uart_rx_0
       (.cycle_baud(speed_select_0_cycle_baud),
        .dout_vld(uart_rx_0_dout_vld),
        .i_clk_sys(clk_wiz_0_clk_out2),
        .i_rst_n(util_vector_logic_0_Res),
        .i_uart_rx(rx_1),
        .o_dout_b(uart_rx_0_o_dout_b),
        .o_dout_g(uart_rx_0_o_dout_g),
        .o_dout_r(uart_rx_0_o_dout_r),
        .parity_type(parity_type_1));
  design_1_uart_tx_0_0 uart_tx_0
       (.cycle_baud(speed_select_0_cycle_baud),
        .i_clk_sys(clk_wiz_0_clk_out2),
        .i_data_valid(speed_select_0_o_tx_send_vaild),
        .i_rst_n(util_vector_logic_0_Res),
        .o_uart_tx(uart_tx_0_o_uart_tx),
        .parity_type(parity_type_1));
  design_1_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(rst_1),
        .Res(util_vector_logic_0_Res));
  design_1_vga_ctrl_0_0 vga_ctrl_0
       (.clk(clk_wiz_0_clk_out1),
        .data_disp(data_gen_0_data_disp),
        .h_addr(vga_ctrl_0_h_addr),
        .hsync(vga_ctrl_0_hsync),
        .rst_n(util_vector_logic_0_Res),
        .v_addr(vga_ctrl_0_v_addr),
        .vga_b(vga_ctrl_0_vga_b),
        .vga_g(vga_ctrl_0_vga_g),
        .vga_r(vga_ctrl_0_vga_r),
        .vsync(vga_ctrl_0_vsync));
endmodule
