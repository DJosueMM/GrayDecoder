#Señal de reloj
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
    
#Display 7 seg
set_property PACKAGE_PIN W4 [get_ports Digito_milesima]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_milesima]
set_property PACKAGE_PIN V4 [get_ports Digito_centena]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_centena]
set_property PACKAGE_PIN U4 [get_ports Digito_decima]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_decima]
set_property PACKAGE_PIN U2 [get_ports Digito_unidad]
set_property IOSTANDARD LVCMOS33 [get_ports Digito_unidad]


set_property PACKAGE_PIN U7 [get_ports {cSeg7[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[0]}]

set_property PACKAGE_PIN V5 [get_ports {cSeg7[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[1]}]

set_property PACKAGE_PIN U5 [get_ports {cSeg7[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[2]}]

set_property PACKAGE_PIN V8 [get_ports {cSeg7[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[3]}]

set_property PACKAGE_PIN U8 [get_ports {cSeg7[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[4]}]

set_property PACKAGE_PIN W6 [get_ports {cSeg7[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[5]}]

set_property PACKAGE_PIN W7 [get_ports {cSeg7[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cSeg7[6]}]
