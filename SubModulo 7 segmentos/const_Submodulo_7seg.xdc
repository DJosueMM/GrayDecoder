#Señal de reloj
set_property PACKAGE_PIN E3 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
    
#Display 7 seg
set_property PACKAGE_PIN J14 [get_ports Digito_milesima]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_milesima]
set_property PACKAGE_PIN T9 [get_ports Digito_centena]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_centena]
set_property PACKAGE_PIN J18 [get_ports Digito_decena]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_decena]
set_property PACKAGE_PIN J17 [get_ports Digito_unidad]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_unidad]

set_property PACKAGE_PIN U13 [get_ports Digito_milesima]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_milesima]
set_property PACKAGE_PIN K2 [get_ports Digito_centena]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_centena]

set_property PACKAGE_PIN T14 [get_ports Digito_milesima]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_milesima]
set_property PACKAGE_PIN P14 [get_ports Digito_centena]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_centena]


set_property PACKAGE_PIN L18 [get_ports {cSeg7[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[0]}]

set_property PACKAGE_PIN T11 [get_ports {cSeg7[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[1]}]

set_property PACKAGE_PIN P15 [get_ports {cSeg7[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[2]}]

set_property PACKAGE_PIN K13 [get_ports {cSeg7[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[3]}]

set_property PACKAGE_PIN K16 [get_ports {cSeg7[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[4]}]

set_property PACKAGE_PIN R10 [get_ports {cSeg7[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[5]}]

set_property PACKAGE_PIN T10 [get_ports {cSeg7[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[6]}]
