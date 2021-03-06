
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $coutputgroup]
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_return -into $return_group -radix hex
set counter_output_group [add_wave_group counter_output(axis) -into $coutputgroup]
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/counter_output_TREADY -into $counter_output_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/counter_output_TVALID -into $counter_output_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/counter_output_TDATA -into $counter_output_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set count_range_group [add_wave_group count_range(axis) -into $cinputgroup]
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/count_range_TREADY -into $count_range_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/count_range_TVALID -into $count_range_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/count_range_TDATA -into $count_range_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_start -into $blocksiggroup
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_done -into $blocksiggroup
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_idle -into $blocksiggroup
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_axi_stream_counter_range_top/AESL_inst_axi_stream_counter_range/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_axi_stream_counter_range_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_axi_stream_counter_range_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_axi_stream_counter_range_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_axi_stream_counter_range_top/LENGTH_count_range -into $tb_portdepth_group -radix hex
add_wave /apatb_axi_stream_counter_range_top/LENGTH_counter_output -into $tb_portdepth_group -radix hex
add_wave /apatb_axi_stream_counter_range_top/LENGTH_ap_return -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(wire) -into $tbcoutputgroup]
add_wave /apatb_axi_stream_counter_range_top/ap_return -into $tb_return_group -radix hex
set tb_counter_output_group [add_wave_group counter_output(axis) -into $tbcoutputgroup]
add_wave /apatb_axi_stream_counter_range_top/counter_output_TREADY -into $tb_counter_output_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/counter_output_TVALID -into $tb_counter_output_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/counter_output_TDATA -into $tb_counter_output_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_count_range_group [add_wave_group count_range(axis) -into $tbcinputgroup]
add_wave /apatb_axi_stream_counter_range_top/count_range_TREADY -into $tb_count_range_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/count_range_TVALID -into $tb_count_range_group -color #ffff00 -radix hex
add_wave /apatb_axi_stream_counter_range_top/count_range_TDATA -into $tb_count_range_group -radix hex
save_wave_config axi_stream_counter_range.wcfg
run all
quit

