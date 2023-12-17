set_property PACKAGE_PIN W5 [get_ports i_clk_sys]

set_property PACKAGE_PIN B18 [get_ports i_uart_rx]


set_property IOSTANDARD LVCMOS33 [get_ports i_clk_sys]

set_property IOSTANDARD LVCMOS33 [get_ports i_uart_rx]

set_property IOSTANDARD LVCMOS33 [get_ports o_uart_tx]

set_property PACKAGE_PIN A18 [get_ports o_uart_tx]

set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports baud_speed]
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports parity_type_status]
#set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports data_width_s]

set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports parity_type]
#set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports data_width_status]

set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports rst]

##VGA Connector
set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[0]}]
set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[1]}]
set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[2]}]
set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[3]}]
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[0]}]
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[1]}]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[2]}]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[3]}]
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[0]}]
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[1]}]
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[2]}]
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[3]}]
set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports hsync]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports vsync]

set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports tx_send_vaild]