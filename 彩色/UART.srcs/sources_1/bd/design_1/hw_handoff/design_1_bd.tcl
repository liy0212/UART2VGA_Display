
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# data_gen, speed_select, uart_rx, uart_tx, vga_ctrl

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set baud_speed [ create_bd_port -dir I -type data baud_speed ]
  set hsync [ create_bd_port -dir O hsync ]
  set i_clk_sys [ create_bd_port -dir I -type clk i_clk_sys ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] $i_clk_sys
  set i_uart_rx [ create_bd_port -dir I -type data i_uart_rx ]
  set o_uart_tx [ create_bd_port -dir O -type data o_uart_tx ]
  set parity_type [ create_bd_port -dir I parity_type ]
  set parity_type_status [ create_bd_port -dir O parity_type_status ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst
  set tx_send_vaild [ create_bd_port -dir I tx_send_vaild ]
  set vgaBlue [ create_bd_port -dir O -from 3 -to 0 vgaBlue ]
  set vgaGreen [ create_bd_port -dir O -from 3 -to 0 vgaGreen ]
  set vgaRed [ create_bd_port -dir O -from 3 -to 0 -type data vgaRed ]
  set vsync [ create_bd_port -dir O -type data vsync ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_DRIVES {BUFG} \
   CONFIG.CLKOUT1_JITTER {183.467} \
   CONFIG.CLKOUT1_PHASE_ERROR {105.461} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25} \
   CONFIG.CLKOUT2_DRIVES {BUFG} \
   CONFIG.CLKOUT2_JITTER {137.681} \
   CONFIG.CLKOUT2_PHASE_ERROR {105.461} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_DRIVES {BUFG} \
   CONFIG.CLKOUT3_JITTER {219.371} \
   CONFIG.CLKOUT3_PHASE_ERROR {105.461} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {10} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_DRIVES {BUFG} \
   CONFIG.CLKOUT5_DRIVES {BUFG} \
   CONFIG.CLKOUT6_DRIVES {BUFG} \
   CONFIG.CLKOUT7_DRIVES {BUFG} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {9} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {36} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {9} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {90} \
   CONFIG.MMCM_COMPENSATION {ZHOLD} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.PRIMITIVE {PLL} \
 ] $clk_wiz_0

  # Create instance: data_gen_0, and set properties
  set block_name data_gen
  set block_cell_name data_gen_0
  if { [catch {set data_gen_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $data_gen_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: speed_select_0, and set properties
  set block_name speed_select
  set block_cell_name speed_select_0
  if { [catch {set speed_select_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $speed_select_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: uart_rx_0, and set properties
  set block_name uart_rx
  set block_cell_name uart_rx_0
  if { [catch {set uart_rx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $uart_rx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: uart_tx_0, and set properties
  set block_name uart_tx
  set block_cell_name uart_tx_0
  if { [catch {set uart_tx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $uart_tx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: vga_ctrl_0, and set properties
  set block_name vga_ctrl
  set block_cell_name vga_ctrl_0
  if { [catch {set vga_ctrl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vga_ctrl_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net baud_speed_1 [get_bd_ports baud_speed] [get_bd_pins speed_select_0/speed_se]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins data_gen_0/clk] [get_bd_pins vga_ctrl_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins data_gen_0/f_clk] [get_bd_pins speed_select_0/clk] [get_bd_pins uart_rx_0/i_clk_sys] [get_bd_pins uart_tx_0/i_clk_sys]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins speed_select_0/slow_clk]
  connect_bd_net -net data_gen_0_data_disp [get_bd_pins data_gen_0/data_disp] [get_bd_pins vga_ctrl_0/data_disp]
  connect_bd_net -net i_clk_sys_1 [get_bd_ports i_clk_sys] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net parity_type_1 [get_bd_ports parity_type] [get_bd_pins speed_select_0/parity_type] [get_bd_pins uart_rx_0/parity_type] [get_bd_pins uart_tx_0/parity_type]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins clk_wiz_0/reset] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net rx_1 [get_bd_ports i_uart_rx] [get_bd_pins uart_rx_0/i_uart_rx]
  connect_bd_net -net speed_select_0_cycle_baud [get_bd_pins speed_select_0/cycle_baud] [get_bd_pins uart_rx_0/cycle_baud] [get_bd_pins uart_tx_0/cycle_baud]
  connect_bd_net -net speed_select_0_o_tx_send_vaild [get_bd_pins speed_select_0/o_tx_send_vaild] [get_bd_pins uart_tx_0/i_data_valid]
  connect_bd_net -net speed_select_0_parity_type_status [get_bd_ports parity_type_status] [get_bd_pins speed_select_0/parity_type_status]
  connect_bd_net -net tx_send_vaild_1 [get_bd_ports tx_send_vaild] [get_bd_pins speed_select_0/i_tx_send_vaild]
  connect_bd_net -net uart_rx_0_o_rx_done [get_bd_pins data_gen_0/pi_flag] [get_bd_pins uart_rx_0/dout_vld]
  connect_bd_net -net uart_rx_0_o_uart_data [get_bd_pins data_gen_0/data_i] [get_bd_pins uart_rx_0/dout]
  connect_bd_net -net uart_tx_0_o_uart_tx [get_bd_ports o_uart_tx] [get_bd_pins uart_tx_0/o_uart_tx]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins data_gen_0/rst_n] [get_bd_pins speed_select_0/rst_n] [get_bd_pins uart_rx_0/i_rst_n] [get_bd_pins uart_tx_0/i_rst_n] [get_bd_pins util_vector_logic_0/Res] [get_bd_pins vga_ctrl_0/rst_n]
  connect_bd_net -net vga_ctrl_0_h_addr [get_bd_pins data_gen_0/h_addr] [get_bd_pins vga_ctrl_0/h_addr]
  connect_bd_net -net vga_ctrl_0_hsync [get_bd_ports hsync] [get_bd_pins vga_ctrl_0/hsync]
  connect_bd_net -net vga_ctrl_0_v_addr [get_bd_pins data_gen_0/v_addr] [get_bd_pins vga_ctrl_0/v_addr]
  connect_bd_net -net vga_ctrl_0_vga_b [get_bd_ports vgaBlue] [get_bd_pins vga_ctrl_0/vga_b]
  connect_bd_net -net vga_ctrl_0_vga_g [get_bd_ports vgaGreen] [get_bd_pins vga_ctrl_0/vga_g]
  connect_bd_net -net vga_ctrl_0_vga_r [get_bd_ports vgaRed] [get_bd_pins vga_ctrl_0/vga_r]
  connect_bd_net -net vga_ctrl_0_vsync [get_bd_ports vsync] [get_bd_pins vga_ctrl_0/vsync]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


