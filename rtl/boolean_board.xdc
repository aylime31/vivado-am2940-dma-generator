
# ceas Manual legat la Push Button BTN0
set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33 } [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]

# reset legat la SW15
set_property -dict { PACKAGE_PIN K1   IOSTANDARD LVCMOS33 } [get_ports res]

# datele de Intrare (D_IN[3:0]) legate la switch-urile SW7, SW6, SW5, SW4
set_property -dict { PACKAGE_PIN P2   IOSTANDARD LVCMOS33 } [get_ports {D_IN[3]}]
set_property -dict { PACKAGE_PIN R1   IOSTANDARD LVCMOS33 } [get_ports {D_IN[2]}]
set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports {D_IN[1]}]
set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS33 } [get_ports {D_IN[0]}]

# instrucțiunea (I[2:0]) legate la switch-urile SW2, SW1, SW0
set_property -dict { PACKAGE_PIN U1   IOSTANDARD LVCMOS33 } [get_ports {I[2]}]
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {I[1]}]
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports {I[0]}]

# carry in (ACI, WCI) legate la switch-urile SW9, SW8
set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports WCI]
set_property -dict { PACKAGE_PIN P1   IOSTANDARD LVCMOS33 } [get_ports ACI]

# nOEA (Output Enable Address) legat la switch-ul SW10
set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports nOEA]

# adresa (A[3:0]) legata la LED-urile LD3, LD2, LD1, LD0
set_property -dict { PACKAGE_PIN F2   IOSTANDARD LVCMOS33 } [get_ports {A[3]}]
set_property -dict { PACKAGE_PIN F1   IOSTANDARD LVCMOS33 } [get_ports {A[2]}]
set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports {A[1]}]
set_property -dict { PACKAGE_PIN G1   IOSTANDARD LVCMOS33 } [get_ports {A[0]}]

# datele de iesire (D_OUT[3:0]) legate la LED-urile LD7, LD6, LD5, LD4
set_property -dict { PACKAGE_PIN E5   IOSTANDARD LVCMOS33 } [get_ports {D_OUT[3]}]
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports {D_OUT[2]}]
set_property -dict { PACKAGE_PIN E2   IOSTANDARD LVCMOS33 } [get_ports {D_OUT[1]}]
set_property -dict { PACKAGE_PIN E1   IOSTANDARD LVCMOS33 } [get_ports {D_OUT[0]}]

# carry out (ACO, WCO) legate la LED-urile LD9, LD8
set_property -dict { PACKAGE_PIN C3   IOSTANDARD LVCMOS33 } [get_ports WCO]
set_property -dict { PACKAGE_PIN E6   IOSTANDARD LVCMOS33 } [get_ports ACO]

# status (DONE, OEDATA_LED) legate la LED-urile LD11, LD10
set_property -dict { PACKAGE_PIN A2   IOSTANDARD LVCMOS33 } [get_ports OEDATA_LED]
set_property -dict { PACKAGE_PIN B2   IOSTANDARD LVCMOS33 } [get_ports DONE]