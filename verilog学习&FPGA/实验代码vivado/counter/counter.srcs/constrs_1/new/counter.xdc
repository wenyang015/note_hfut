set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V2 [get_ports {sw[0]}]
set_property PACKAGE_PIN W1 [get_ports {sw[1]}]
set_property PACKAGE_PIN W2 [get_ports {sw[2]}]
####################################################################################
set_property CFGBVS VCCO [current_design]
####################################################################################
set_property CONFIG_VOLTAGE 3.3 [current_design]
####################################################################################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
####################################################################################
set_property PACKAGE_PIN Y19 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk_IBUF}]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets{clk}]
####################################################################################
set_property PACKAGE_PIN K21 [get_ports {smg_duan[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[0]}]

set_property PACKAGE_PIN H20 [get_ports {smg_duan[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[1]}]

set_property PACKAGE_PIN J22 [get_ports {smg_duan[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[2]}]

set_property PACKAGE_PIN K22 [get_ports {smg_duan[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[3]}]

set_property PACKAGE_PIN K19 [get_ports {smg_duan[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[4]}]

set_property PACKAGE_PIN J20 [get_ports {smg_duan[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[5]}]

set_property PACKAGE_PIN H19 [get_ports {smg_duan[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[6]}]

set_property PACKAGE_PIN J21 [get_ports {smg_duan[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_duan[7]}]

set_property PACKAGE_PIN L21 [get_ports {smg_sel[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[0]}]

set_property PACKAGE_PIN L20 [get_ports {smg_sel[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[1]}]

set_property PACKAGE_PIN M22 [get_ports {smg_sel[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[2]}]

set_property PACKAGE_PIN M21 [get_ports {smg_sel[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[3]}]

set_property PACKAGE_PIN T1 [get_ports {smg_sel[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[4]}]

set_property PACKAGE_PIN U1 [get_ports {smg_sel[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[5]}]

set_property PACKAGE_PIN G20 [get_ports {smg_sel[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[6]}]

set_property PACKAGE_PIN H22 [get_ports {smg_sel[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {smg_sel[7]}]

####################################################################################