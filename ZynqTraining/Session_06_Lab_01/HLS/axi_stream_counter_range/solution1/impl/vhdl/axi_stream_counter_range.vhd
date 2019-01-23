-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity axi_stream_counter_range is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    count_range_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    count_range_TVALID : IN STD_LOGIC;
    count_range_TREADY : OUT STD_LOGIC;
    counter_output_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    counter_output_TVALID : OUT STD_LOGIC;
    counter_output_TREADY : IN STD_LOGIC;
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of axi_stream_counter_range is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "axi_stream_counter_range,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.522312,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=233,HLS_SYN_LUT=180,HLS_VERSION=2018_3}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal count_range_0_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal count_range_0_vld_in : STD_LOGIC;
    signal count_range_0_vld_out : STD_LOGIC;
    signal count_range_0_ack_in : STD_LOGIC;
    signal count_range_0_ack_out : STD_LOGIC;
    signal count_range_0_payload_A : STD_LOGIC_VECTOR (31 downto 0);
    signal count_range_0_payload_B : STD_LOGIC_VECTOR (31 downto 0);
    signal count_range_0_sel_rd : STD_LOGIC := '0';
    signal count_range_0_sel_wr : STD_LOGIC := '0';
    signal count_range_0_sel : STD_LOGIC;
    signal count_range_0_load_A : STD_LOGIC;
    signal count_range_0_load_B : STD_LOGIC;
    signal count_range_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal count_range_0_state_cmp_full : STD_LOGIC;
    signal counter_output_1_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal counter_output_1_vld_in : STD_LOGIC;
    signal counter_output_1_vld_out : STD_LOGIC;
    signal counter_output_1_ack_in : STD_LOGIC;
    signal counter_output_1_ack_out : STD_LOGIC;
    signal counter_output_1_payload_A : STD_LOGIC_VECTOR (31 downto 0);
    signal counter_output_1_payload_B : STD_LOGIC_VECTOR (31 downto 0);
    signal counter_output_1_sel_rd : STD_LOGIC := '0';
    signal counter_output_1_sel_wr : STD_LOGIC := '0';
    signal counter_output_1_sel : STD_LOGIC;
    signal counter_output_1_load_A : STD_LOGIC;
    signal counter_output_1_load_B : STD_LOGIC;
    signal counter_output_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal counter_output_1_state_cmp_full : STD_LOGIC;
    signal count_range_TDATA_blk_n : STD_LOGIC;
    signal counter_output_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal tmp_fu_59_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal count_range_read_reg_70 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal counterValue_cast_fu_54_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state2_io : BOOLEAN;
    signal counterValue_1_fu_64_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal counterValue_1_reg_83 : STD_LOGIC_VECTOR (30 downto 0);
    signal counterValue_reg_43 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    count_range_0_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                count_range_0_sel_rd <= ap_const_logic_0;
            else
                if (((count_range_0_ack_out = ap_const_logic_1) and (count_range_0_vld_out = ap_const_logic_1))) then 
                                        count_range_0_sel_rd <= not(count_range_0_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    count_range_0_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                count_range_0_sel_wr <= ap_const_logic_0;
            else
                if (((count_range_0_ack_in = ap_const_logic_1) and (count_range_0_vld_in = ap_const_logic_1))) then 
                                        count_range_0_sel_wr <= not(count_range_0_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    count_range_0_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                count_range_0_state <= ap_const_lv2_0;
            else
                if ((((count_range_0_state = ap_const_lv2_2) and (count_range_0_vld_in = ap_const_logic_0)) or ((count_range_0_state = ap_const_lv2_3) and (count_range_0_vld_in = ap_const_logic_0) and (count_range_0_ack_out = ap_const_logic_1)))) then 
                    count_range_0_state <= ap_const_lv2_2;
                elsif ((((count_range_0_state = ap_const_lv2_1) and (count_range_0_ack_out = ap_const_logic_0)) or ((count_range_0_state = ap_const_lv2_3) and (count_range_0_ack_out = ap_const_logic_0) and (count_range_0_vld_in = ap_const_logic_1)))) then 
                    count_range_0_state <= ap_const_lv2_1;
                elsif (((not(((count_range_0_vld_in = ap_const_logic_0) and (count_range_0_ack_out = ap_const_logic_1))) and not(((count_range_0_ack_out = ap_const_logic_0) and (count_range_0_vld_in = ap_const_logic_1))) and (count_range_0_state = ap_const_lv2_3)) or ((count_range_0_state = ap_const_lv2_1) and (count_range_0_ack_out = ap_const_logic_1)) or ((count_range_0_state = ap_const_lv2_2) and (count_range_0_vld_in = ap_const_logic_1)))) then 
                    count_range_0_state <= ap_const_lv2_3;
                else 
                    count_range_0_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    counter_output_1_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                counter_output_1_sel_rd <= ap_const_logic_0;
            else
                if (((counter_output_1_vld_out = ap_const_logic_1) and (counter_output_1_ack_out = ap_const_logic_1))) then 
                                        counter_output_1_sel_rd <= not(counter_output_1_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    counter_output_1_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                counter_output_1_sel_wr <= ap_const_logic_0;
            else
                if (((counter_output_1_vld_in = ap_const_logic_1) and (counter_output_1_ack_in = ap_const_logic_1))) then 
                                        counter_output_1_sel_wr <= not(counter_output_1_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    counter_output_1_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                counter_output_1_state <= ap_const_lv2_0;
            else
                if ((((counter_output_1_state = ap_const_lv2_2) and (counter_output_1_vld_in = ap_const_logic_0)) or ((counter_output_1_state = ap_const_lv2_3) and (counter_output_1_vld_in = ap_const_logic_0) and (counter_output_1_ack_out = ap_const_logic_1)))) then 
                    counter_output_1_state <= ap_const_lv2_2;
                elsif ((((counter_output_1_state = ap_const_lv2_1) and (counter_output_1_ack_out = ap_const_logic_0)) or ((counter_output_1_state = ap_const_lv2_3) and (counter_output_1_ack_out = ap_const_logic_0) and (counter_output_1_vld_in = ap_const_logic_1)))) then 
                    counter_output_1_state <= ap_const_lv2_1;
                elsif (((not(((counter_output_1_vld_in = ap_const_logic_0) and (counter_output_1_ack_out = ap_const_logic_1))) and not(((counter_output_1_ack_out = ap_const_logic_0) and (counter_output_1_vld_in = ap_const_logic_1))) and (counter_output_1_state = ap_const_lv2_3)) or ((counter_output_1_state = ap_const_lv2_1) and (counter_output_1_ack_out = ap_const_logic_1)) or ((counter_output_1_state = ap_const_lv2_2) and (counter_output_1_vld_in = ap_const_logic_1)))) then 
                    counter_output_1_state <= ap_const_lv2_3;
                else 
                    counter_output_1_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    counterValue_reg_43_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state3) and (counter_output_1_ack_in = ap_const_logic_1))) then 
                counterValue_reg_43 <= counterValue_1_reg_83;
            elsif ((not(((count_range_0_vld_out = ap_const_logic_0) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                counterValue_reg_43 <= ap_const_lv31_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((count_range_0_load_A = ap_const_logic_1)) then
                count_range_0_payload_A <= count_range_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((count_range_0_load_B = ap_const_logic_1)) then
                count_range_0_payload_B <= count_range_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((count_range_0_vld_out = ap_const_logic_0) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                count_range_read_reg_70 <= count_range_0_data_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((counter_output_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                counterValue_1_reg_83 <= counterValue_1_fu_64_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((counter_output_1_load_A = ap_const_logic_1)) then
                counter_output_1_payload_A <= counterValue_cast_fu_54_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((counter_output_1_load_B = ap_const_logic_1)) then
                counter_output_1_payload_B <= counterValue_cast_fu_54_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, count_range_0_vld_out, counter_output_1_ack_in, counter_output_1_state, ap_CS_fsm_state2, tmp_fu_59_p2, ap_CS_fsm_state3, ap_block_state2_io)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((count_range_0_vld_out = ap_const_logic_0) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((counter_output_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_fu_59_p2 = ap_const_lv1_0) and (counter_output_1_state(0) = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not(((counter_output_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_fu_59_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (counter_output_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state1_assign_proc : process(ap_start, count_range_0_vld_out)
    begin
                ap_block_state1 <= ((count_range_0_vld_out = ap_const_logic_0) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state2_io_assign_proc : process(counter_output_1_ack_in, tmp_fu_59_p2)
    begin
                ap_block_state2_io <= ((tmp_fu_59_p2 = ap_const_lv1_1) and (counter_output_1_ack_in = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(counter_output_1_ack_in, counter_output_1_state, ap_CS_fsm_state2, tmp_fu_59_p2, ap_block_state2_io)
    begin
        if ((not(((counter_output_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_fu_59_p2 = ap_const_lv1_0) and (counter_output_1_state(0) = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(counter_output_1_ack_in, counter_output_1_state, ap_CS_fsm_state2, tmp_fu_59_p2, ap_block_state2_io)
    begin
        if ((not(((counter_output_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_fu_59_p2 = ap_const_lv1_0) and (counter_output_1_state(0) = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= ap_const_lv32_0;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    count_range_0_ack_in <= count_range_0_state(1);

    count_range_0_ack_out_assign_proc : process(ap_start, ap_CS_fsm_state1, count_range_0_vld_out)
    begin
        if ((not(((count_range_0_vld_out = ap_const_logic_0) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            count_range_0_ack_out <= ap_const_logic_1;
        else 
            count_range_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    count_range_0_data_out_assign_proc : process(count_range_0_payload_A, count_range_0_payload_B, count_range_0_sel)
    begin
        if ((count_range_0_sel = ap_const_logic_1)) then 
            count_range_0_data_out <= count_range_0_payload_B;
        else 
            count_range_0_data_out <= count_range_0_payload_A;
        end if; 
    end process;

    count_range_0_load_A <= (not(count_range_0_sel_wr) and count_range_0_state_cmp_full);
    count_range_0_load_B <= (count_range_0_state_cmp_full and count_range_0_sel_wr);
    count_range_0_sel <= count_range_0_sel_rd;
    count_range_0_state_cmp_full <= '0' when (count_range_0_state = ap_const_lv2_1) else '1';
    count_range_0_vld_in <= count_range_TVALID;
    count_range_0_vld_out <= count_range_0_state(0);

    count_range_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, count_range_0_state)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            count_range_TDATA_blk_n <= count_range_0_state(0);
        else 
            count_range_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    count_range_TREADY <= count_range_0_state(1);
    counterValue_1_fu_64_p2 <= std_logic_vector(unsigned(counterValue_reg_43) + unsigned(ap_const_lv31_1));
    counterValue_cast_fu_54_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(counterValue_reg_43),32));
    counter_output_1_ack_in <= counter_output_1_state(1);
    counter_output_1_ack_out <= counter_output_TREADY;

    counter_output_1_data_out_assign_proc : process(counter_output_1_payload_A, counter_output_1_payload_B, counter_output_1_sel)
    begin
        if ((counter_output_1_sel = ap_const_logic_1)) then 
            counter_output_1_data_out <= counter_output_1_payload_B;
        else 
            counter_output_1_data_out <= counter_output_1_payload_A;
        end if; 
    end process;

    counter_output_1_load_A <= (not(counter_output_1_sel_wr) and counter_output_1_state_cmp_full);
    counter_output_1_load_B <= (counter_output_1_state_cmp_full and counter_output_1_sel_wr);
    counter_output_1_sel <= counter_output_1_sel_rd;
    counter_output_1_state_cmp_full <= '0' when (counter_output_1_state = ap_const_lv2_1) else '1';

    counter_output_1_vld_in_assign_proc : process(counter_output_1_ack_in, ap_CS_fsm_state2, tmp_fu_59_p2, ap_block_state2_io)
    begin
        if ((not(((counter_output_1_ack_in = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_fu_59_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            counter_output_1_vld_in <= ap_const_logic_1;
        else 
            counter_output_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    counter_output_1_vld_out <= counter_output_1_state(0);
    counter_output_TDATA <= counter_output_1_data_out;

    counter_output_TDATA_blk_n_assign_proc : process(counter_output_1_state, ap_CS_fsm_state2, tmp_fu_59_p2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((tmp_fu_59_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            counter_output_TDATA_blk_n <= counter_output_1_state(1);
        else 
            counter_output_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    counter_output_TVALID <= counter_output_1_state(0);
    tmp_fu_59_p2 <= "1" when (signed(counterValue_cast_fu_54_p1) < signed(count_range_read_reg_70)) else "0";
end behav;
