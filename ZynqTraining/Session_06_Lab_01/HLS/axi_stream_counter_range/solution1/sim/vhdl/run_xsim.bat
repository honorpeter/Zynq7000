
set PATH=
call C:/xilinx/Vivado/2018.3/bin/xelab xil_defaultlib.apatb_axi_stream_counter_range_top glbl -prj axi_stream_counter_range.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims -L xpm --initfile "C:/xilinx/Vivado/2018.3/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s axi_stream_counter_range -debug wave
call C:/xilinx/Vivado/2018.3/bin/xsim --noieeewarnings axi_stream_counter_range -tclbatch axi_stream_counter_range.tcl

