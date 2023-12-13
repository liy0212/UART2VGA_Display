# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "H_Data_STA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_Data_STO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_SYNC_STA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_SYNC_STO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_Data_STA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_Data_STO" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_SYNC_STA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_SYNC_STO" -parent ${Page_0}


}

proc update_PARAM_VALUE.H_Data_STA { PARAM_VALUE.H_Data_STA } {
	# Procedure called to update H_Data_STA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_Data_STA { PARAM_VALUE.H_Data_STA } {
	# Procedure called to validate H_Data_STA
	return true
}

proc update_PARAM_VALUE.H_Data_STO { PARAM_VALUE.H_Data_STO } {
	# Procedure called to update H_Data_STO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_Data_STO { PARAM_VALUE.H_Data_STO } {
	# Procedure called to validate H_Data_STO
	return true
}

proc update_PARAM_VALUE.H_SYNC_STA { PARAM_VALUE.H_SYNC_STA } {
	# Procedure called to update H_SYNC_STA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_SYNC_STA { PARAM_VALUE.H_SYNC_STA } {
	# Procedure called to validate H_SYNC_STA
	return true
}

proc update_PARAM_VALUE.H_SYNC_STO { PARAM_VALUE.H_SYNC_STO } {
	# Procedure called to update H_SYNC_STO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_SYNC_STO { PARAM_VALUE.H_SYNC_STO } {
	# Procedure called to validate H_SYNC_STO
	return true
}

proc update_PARAM_VALUE.V_Data_STA { PARAM_VALUE.V_Data_STA } {
	# Procedure called to update V_Data_STA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_Data_STA { PARAM_VALUE.V_Data_STA } {
	# Procedure called to validate V_Data_STA
	return true
}

proc update_PARAM_VALUE.V_Data_STO { PARAM_VALUE.V_Data_STO } {
	# Procedure called to update V_Data_STO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_Data_STO { PARAM_VALUE.V_Data_STO } {
	# Procedure called to validate V_Data_STO
	return true
}

proc update_PARAM_VALUE.V_SYNC_STA { PARAM_VALUE.V_SYNC_STA } {
	# Procedure called to update V_SYNC_STA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_SYNC_STA { PARAM_VALUE.V_SYNC_STA } {
	# Procedure called to validate V_SYNC_STA
	return true
}

proc update_PARAM_VALUE.V_SYNC_STO { PARAM_VALUE.V_SYNC_STO } {
	# Procedure called to update V_SYNC_STO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_SYNC_STO { PARAM_VALUE.V_SYNC_STO } {
	# Procedure called to validate V_SYNC_STO
	return true
}


proc update_MODELPARAM_VALUE.H_SYNC_STA { MODELPARAM_VALUE.H_SYNC_STA PARAM_VALUE.H_SYNC_STA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_SYNC_STA}] ${MODELPARAM_VALUE.H_SYNC_STA}
}

proc update_MODELPARAM_VALUE.H_SYNC_STO { MODELPARAM_VALUE.H_SYNC_STO PARAM_VALUE.H_SYNC_STO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_SYNC_STO}] ${MODELPARAM_VALUE.H_SYNC_STO}
}

proc update_MODELPARAM_VALUE.H_Data_STA { MODELPARAM_VALUE.H_Data_STA PARAM_VALUE.H_Data_STA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_Data_STA}] ${MODELPARAM_VALUE.H_Data_STA}
}

proc update_MODELPARAM_VALUE.H_Data_STO { MODELPARAM_VALUE.H_Data_STO PARAM_VALUE.H_Data_STO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_Data_STO}] ${MODELPARAM_VALUE.H_Data_STO}
}

proc update_MODELPARAM_VALUE.V_SYNC_STA { MODELPARAM_VALUE.V_SYNC_STA PARAM_VALUE.V_SYNC_STA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_SYNC_STA}] ${MODELPARAM_VALUE.V_SYNC_STA}
}

proc update_MODELPARAM_VALUE.V_SYNC_STO { MODELPARAM_VALUE.V_SYNC_STO PARAM_VALUE.V_SYNC_STO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_SYNC_STO}] ${MODELPARAM_VALUE.V_SYNC_STO}
}

proc update_MODELPARAM_VALUE.V_Data_STA { MODELPARAM_VALUE.V_Data_STA PARAM_VALUE.V_Data_STA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_Data_STA}] ${MODELPARAM_VALUE.V_Data_STA}
}

proc update_MODELPARAM_VALUE.V_Data_STO { MODELPARAM_VALUE.V_Data_STO PARAM_VALUE.V_Data_STO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_Data_STO}] ${MODELPARAM_VALUE.V_Data_STO}
}

