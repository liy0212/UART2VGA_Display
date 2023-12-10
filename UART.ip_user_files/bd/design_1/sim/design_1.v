//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Fri Dec  8 12:25:15 2023
//Host        : LAPTOP-A0ISF6QL running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (baud_speed,
    data_width_s,
    data_width_status,
    hsync,
    i_clk_sys,
    i_uart_rx,
    parity_type,
    parity_type_status,
    rst,
    vgaBlue,
    vgaGreen,
    vgaRed,
    vsync);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BAUD_SPEED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BAUD_SPEED, LAYERED_METADATA undef" *) input baud_speed;
  input data_width_s;
  output data_width_status;
  output hsync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.I_CLK_SYS CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.I_CLK_SYS, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input i_clk_sys;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.I_UART_RX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.I_UART_RX, LAYERED_METADATA undef" *) input i_uart_rx;
  input parity_type;
  output parity_type_status;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  output [3:0]vgaBlue;
  output [3:0]vgaGreen;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VGARED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VGARED, LAYERED_METADATA undef" *) output [3:0]vgaRed;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VSYNC DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VSYNC, LAYERED_METADATA undef" *) output vsync;

  wire baud_speed_1;
  wire clk_1;
  wire clk_wiz_0_clk_out1;
  wire [11:0]data_gen_0_data_disp;
  wire data_width_s_1;
  wire parity_type_1;
  wire rst_1;
  wire rx_1;
  wire [15:0]speed_select_0_cycle_baud;
  wire speed_select_0_data_width_status;
  wire speed_select_0_parity_type_status;
  wire uart_rx_0_o_rx_done;
  wire [7:0]uart_rx_0_o_uart_data;
  wire [0:0]util_vector_logic_0_Res;
  wire [10:0]vga_ctrl_0_h_addr;
  wire vga_ctrl_0_hsync;
  wire [10:0]vga_ctrl_0_v_addr;
  wire [3:0]vga_ctrl_0_vga_b;
  wire [3:0]vga_ctrl_0_vga_g;
  wire [3:0]vga_ctrl_0_vga_r;
  wire vga_ctrl_0_vsync;

  assign baud_speed_1 = baud_speed;
  assign clk_1 = i_clk_sys;
  assign data_width_s_1 = data_width_s;
  assign data_width_status = speed_select_0_data_width_status;
  assign hsync = vga_ctrl_0_hsync;
  assign parity_type_1 = parity_type;
  assign parity_type_status = speed_select_0_parity_type_status;
  assign rst_1 = rst;
  assign rx_1 = i_uart_rx;
  assign vgaBlue[3:0] = vga_ctrl_0_vga_b;
  assign vgaGreen[3:0] = vga_ctrl_0_vga_g;
  assign vgaRed[3:0] = vga_ctrl_0_vga_r;
  assign vsync = vga_ctrl_0_vsync;
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .reset(rst_1));
  design_1_data_gen_0_0 data_gen_0
       (.clk(clk_wiz_0_clk_out1),
        .data_disp(data_gen_0_data_disp),
        .data_i(uart_rx_0_o_uart_data),
        .f_clk(clk_1),
        .h_addr(vga_ctrl_0_h_addr),
        .pi_flag(uart_rx_0_o_rx_done),
        .rst_n(util_vector_logic_0_Res),
        .v_addr(vga_ctrl_0_v_addr));
  design_1_speed_select_0_0 speed_select_0
       (.clk(clk_1),
        .cycle_baud(speed_select_0_cycle_baud),
        .data_width_s(data_width_s_1),
        .data_width_status(speed_select_0_data_width_status),
        .parity_type(parity_type_1),
        .parity_type_status(speed_select_0_parity_type_status),
        .rst_n(util_vector_logic_0_Res),
        .speed_se(baud_speed_1));
  design_1_uart_rx_0_0 uart_rx_0
       (.cycle_baud(speed_select_0_cycle_baud),
        .data_width_s(data_width_s_1),
        .i_clk_sys(clk_1),
        .i_rst_n(util_vector_logic_0_Res),
        .i_uart_rx(rx_1),
        .o_rx_done(uart_rx_0_o_rx_done),
        .o_uart_data(uart_rx_0_o_uart_data),
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
