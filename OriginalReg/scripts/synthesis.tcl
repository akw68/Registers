# setup name of the clock in your design.
set clkname clk

 set CLK_PER  2
 set REDUCE   0.01
 set CLK_SKEW 0.01
 create_clock -name $clkname -period $CLK_PER -waveform "0 [expr $CLK_PER / 2]" $clkname
 set_clock_uncertainty $CLK_SKEW $clkname

 set DFF_CKQ 0.010
 #set IP_DELAY [expr 0.1 + $DFF_CKQ]
 set IP_DELAY $DFF_CKQ
 set_input_delay $IP_DELAY -clock $clkname [remove_from_collection [all_inputs] $clkname]

 set DFF_SETUP 0.015
 set OP_DELAY $DFF_SETUP
 set_output_delay $OP_DELAY -clock $clkname [all_outputs]

