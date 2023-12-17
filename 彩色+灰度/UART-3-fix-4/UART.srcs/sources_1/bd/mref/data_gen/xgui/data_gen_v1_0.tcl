# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BLACK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BLUE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIREBRICK4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GREEN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GREY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_X" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_X1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_Y" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POS_Y1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RED" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TOTAL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WHITE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "height" -parent ${Page_0}
  ipgui::add_param $IPINST -name "width" -parent ${Page_0}


}

proc update_PARAM_VALUE.BLACK { PARAM_VALUE.BLACK } {
	# Procedure called to update BLACK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BLACK { PARAM_VALUE.BLACK } {
	# Procedure called to validate BLACK
	return true
}

proc update_PARAM_VALUE.BLUE { PARAM_VALUE.BLUE } {
	# Procedure called to update BLUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BLUE { PARAM_VALUE.BLUE } {
	# Procedure called to validate BLUE
	return true
}

proc update_PARAM_VALUE.FIREBRICK4 { PARAM_VALUE.FIREBRICK4 } {
	# Procedure called to update FIREBRICK4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIREBRICK4 { PARAM_VALUE.FIREBRICK4 } {
	# Procedure called to validate FIREBRICK4
	return true
}

proc update_PARAM_VALUE.GREEN { PARAM_VALUE.GREEN } {
	# Procedure called to update GREEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GREEN { PARAM_VALUE.GREEN } {
	# Procedure called to validate GREEN
	return true
}

proc update_PARAM_VALUE.GREY { PARAM_VALUE.GREY } {
	# Procedure called to update GREY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GREY { PARAM_VALUE.GREY } {
	# Procedure called to validate GREY
	return true
}

proc update_PARAM_VALUE.POS_X { PARAM_VALUE.POS_X } {
	# Procedure called to update POS_X when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_X { PARAM_VALUE.POS_X } {
	# Procedure called to validate POS_X
	return true
}

proc update_PARAM_VALUE.POS_X1 { PARAM_VALUE.POS_X1 } {
	# Procedure called to update POS_X1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_X1 { PARAM_VALUE.POS_X1 } {
	# Procedure called to validate POS_X1
	return true
}

proc update_PARAM_VALUE.POS_Y { PARAM_VALUE.POS_Y } {
	# Procedure called to update POS_Y when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_Y { PARAM_VALUE.POS_Y } {
	# Procedure called to validate POS_Y
	return true
}

proc update_PARAM_VALUE.POS_Y1 { PARAM_VALUE.POS_Y1 } {
	# Procedure called to update POS_Y1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POS_Y1 { PARAM_VALUE.POS_Y1 } {
	# Procedure called to validate POS_Y1
	return true
}

proc update_PARAM_VALUE.RED { PARAM_VALUE.RED } {
	# Procedure called to update RED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RED { PARAM_VALUE.RED } {
	# Procedure called to validate RED
	return true
}

proc update_PARAM_VALUE.TOTAL { PARAM_VALUE.TOTAL } {
	# Procedure called to update TOTAL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TOTAL { PARAM_VALUE.TOTAL } {
	# Procedure called to validate TOTAL
	return true
}

proc update_PARAM_VALUE.WHITE { PARAM_VALUE.WHITE } {
	# Procedure called to update WHITE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WHITE { PARAM_VALUE.WHITE } {
	# Procedure called to validate WHITE
	return true
}

proc update_PARAM_VALUE.height { PARAM_VALUE.height } {
	# Procedure called to update height when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.height { PARAM_VALUE.height } {
	# Procedure called to validate height
	return true
}

proc update_PARAM_VALUE.width { PARAM_VALUE.width } {
	# Procedure called to update width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.width { PARAM_VALUE.width } {
	# Procedure called to validate width
	return true
}


proc update_MODELPARAM_VALUE.BLACK { MODELPARAM_VALUE.BLACK PARAM_VALUE.BLACK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BLACK}] ${MODELPARAM_VALUE.BLACK}
}

proc update_MODELPARAM_VALUE.RED { MODELPARAM_VALUE.RED PARAM_VALUE.RED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RED}] ${MODELPARAM_VALUE.RED}
}

proc update_MODELPARAM_VALUE.GREEN { MODELPARAM_VALUE.GREEN PARAM_VALUE.GREEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GREEN}] ${MODELPARAM_VALUE.GREEN}
}

proc update_MODELPARAM_VALUE.BLUE { MODELPARAM_VALUE.BLUE PARAM_VALUE.BLUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BLUE}] ${MODELPARAM_VALUE.BLUE}
}

proc update_MODELPARAM_VALUE.WHITE { MODELPARAM_VALUE.WHITE PARAM_VALUE.WHITE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WHITE}] ${MODELPARAM_VALUE.WHITE}
}

proc update_MODELPARAM_VALUE.GREY { MODELPARAM_VALUE.GREY PARAM_VALUE.GREY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GREY}] ${MODELPARAM_VALUE.GREY}
}

proc update_MODELPARAM_VALUE.FIREBRICK4 { MODELPARAM_VALUE.FIREBRICK4 PARAM_VALUE.FIREBRICK4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIREBRICK4}] ${MODELPARAM_VALUE.FIREBRICK4}
}

proc update_MODELPARAM_VALUE.height { MODELPARAM_VALUE.height PARAM_VALUE.height } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.height}] ${MODELPARAM_VALUE.height}
}

proc update_MODELPARAM_VALUE.width { MODELPARAM_VALUE.width PARAM_VALUE.width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.width}] ${MODELPARAM_VALUE.width}
}

proc update_MODELPARAM_VALUE.TOTAL { MODELPARAM_VALUE.TOTAL PARAM_VALUE.TOTAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TOTAL}] ${MODELPARAM_VALUE.TOTAL}
}

proc update_MODELPARAM_VALUE.POS_X { MODELPARAM_VALUE.POS_X PARAM_VALUE.POS_X } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_X}] ${MODELPARAM_VALUE.POS_X}
}

proc update_MODELPARAM_VALUE.POS_Y { MODELPARAM_VALUE.POS_Y PARAM_VALUE.POS_Y } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_Y}] ${MODELPARAM_VALUE.POS_Y}
}

proc update_MODELPARAM_VALUE.POS_X1 { MODELPARAM_VALUE.POS_X1 PARAM_VALUE.POS_X1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_X1}] ${MODELPARAM_VALUE.POS_X1}
}

proc update_MODELPARAM_VALUE.POS_Y1 { MODELPARAM_VALUE.POS_Y1 PARAM_VALUE.POS_Y1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POS_Y1}] ${MODELPARAM_VALUE.POS_Y1}
}

