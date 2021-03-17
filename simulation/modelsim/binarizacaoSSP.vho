-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "03/17/2021 10:17:36"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_entity IS
    PORT (
	i_CLK : IN std_logic;
	i_CLR_N : IN std_logic;
	i_GO : IN std_logic;
	o_READY : BUFFER std_logic
	);
END top_entity;

-- Design Ports Information
-- o_READY	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_CLK	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_CLR_N	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_GO	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_entity IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_CLK : std_logic;
SIGNAL ww_i_CLR_N : std_logic;
SIGNAL ww_i_GO : std_logic;
SIGNAL ww_o_READY : std_logic;
SIGNAL \i_CLR_N~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \o_READY~output_o\ : std_logic;
SIGNAL \i_CLK~input_o\ : std_logic;
SIGNAL \i_CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_GO~input_o\ : std_logic;
SIGNAL \u_bloco_controle|Selector0~0_combout\ : std_logic;
SIGNAL \i_CLR_N~input_o\ : std_logic;
SIGNAL \i_CLR_N~inputclkctrl_outclk\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_INIT~q\ : std_logic;
SIGNAL \u_bloco_controle|Selector1~0_combout\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_VERIFY_ADDR~q\ : std_logic;
SIGNAL \u_bloco_controle|w_NEXT.s_LOAD~0_combout\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_LOAD~q\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~feeder_combout\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~q\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_STORE~feeder_combout\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_STORE~q\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_INC_ADDR~feeder_combout\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_INC_ADDR~q\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[0]~36_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[1]~12_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[1]~13\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[2]~14_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[2]~15\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[3]~16_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[3]~17\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[4]~18_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[4]~19\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[5]~20_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[5]~21\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[6]~22_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[6]~23\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[7]~24_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[7]~25\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[8]~26_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[8]~27\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[9]~28_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[9]~29\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[10]~30_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[10]~31\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[11]~32_combout\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[11]~33\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER[12]~34_combout\ : std_logic;
SIGNAL \u_bloco_controle|w_NEXT.s_FINISH~0_combout\ : std_logic;
SIGNAL \u_bloco_controle|r_STATE.s_FINISH~q\ : std_logic;
SIGNAL \u_bloco_operacional|u_contador|w_COUNTER\ : std_logic_vector(12 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_CLK <= i_CLK;
ww_i_CLR_N <= i_CLR_N;
ww_i_GO <= i_GO;
o_READY <= ww_o_READY;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\i_CLR_N~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_CLR_N~input_o\);

\i_CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_CLK~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y7_N2
\o_READY~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_bloco_controle|r_STATE.s_FINISH~q\,
	devoe => ww_devoe,
	o => \o_READY~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\i_CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_CLK,
	o => \i_CLK~input_o\);

-- Location: CLKCTRL_G2
\i_CLK~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y9_N8
\i_GO~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_GO,
	o => \i_GO~input_o\);

-- Location: LCCOMB_X10_Y10_N28
\u_bloco_controle|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|Selector0~0_combout\ = (!\u_bloco_controle|r_STATE.s_FINISH~q\ & ((\i_GO~input_o\) # (\u_bloco_controle|r_STATE.s_INIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_GO~input_o\,
	datac => \u_bloco_controle|r_STATE.s_INIT~q\,
	datad => \u_bloco_controle|r_STATE.s_FINISH~q\,
	combout => \u_bloco_controle|Selector0~0_combout\);

-- Location: IOIBUF_X0_Y11_N15
\i_CLR_N~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_CLR_N,
	o => \i_CLR_N~input_o\);

-- Location: CLKCTRL_G4
\i_CLR_N~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_CLR_N~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_CLR_N~inputclkctrl_outclk\);

-- Location: FF_X10_Y10_N29
\u_bloco_controle|r_STATE.s_INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|Selector0~0_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_INIT~q\);

-- Location: LCCOMB_X10_Y10_N26
\u_bloco_controle|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|Selector1~0_combout\ = (\u_bloco_controle|r_STATE.s_INC_ADDR~q\) # ((\i_GO~input_o\ & !\u_bloco_controle|r_STATE.s_INIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_GO~input_o\,
	datac => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	datad => \u_bloco_controle|r_STATE.s_INIT~q\,
	combout => \u_bloco_controle|Selector1~0_combout\);

-- Location: FF_X10_Y10_N27
\u_bloco_controle|r_STATE.s_VERIFY_ADDR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|Selector1~0_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_VERIFY_ADDR~q\);

-- Location: LCCOMB_X9_Y10_N6
\u_bloco_controle|w_NEXT.s_LOAD~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|w_NEXT.s_LOAD~0_combout\ = (!\u_bloco_operacional|u_contador|w_COUNTER\(12) & \u_bloco_controle|r_STATE.s_VERIFY_ADDR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_bloco_operacional|u_contador|w_COUNTER\(12),
	datad => \u_bloco_controle|r_STATE.s_VERIFY_ADDR~q\,
	combout => \u_bloco_controle|w_NEXT.s_LOAD~0_combout\);

-- Location: FF_X9_Y10_N7
\u_bloco_controle|r_STATE.s_LOAD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|w_NEXT.s_LOAD~0_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_LOAD~q\);

-- Location: LCCOMB_X9_Y10_N12
\u_bloco_controle|r_STATE.s_VERIFY_PIXEL~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~feeder_combout\ = \u_bloco_controle|r_STATE.s_LOAD~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_bloco_controle|r_STATE.s_LOAD~q\,
	combout => \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~feeder_combout\);

-- Location: FF_X9_Y10_N13
\u_bloco_controle|r_STATE.s_VERIFY_PIXEL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~feeder_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~q\);

-- Location: LCCOMB_X9_Y10_N10
\u_bloco_controle|r_STATE.s_STORE~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|r_STATE.s_STORE~feeder_combout\ = \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_bloco_controle|r_STATE.s_VERIFY_PIXEL~q\,
	combout => \u_bloco_controle|r_STATE.s_STORE~feeder_combout\);

-- Location: FF_X9_Y10_N11
\u_bloco_controle|r_STATE.s_STORE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|r_STATE.s_STORE~feeder_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_STORE~q\);

-- Location: LCCOMB_X9_Y10_N16
\u_bloco_controle|r_STATE.s_INC_ADDR~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|r_STATE.s_INC_ADDR~feeder_combout\ = \u_bloco_controle|r_STATE.s_STORE~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \u_bloco_controle|r_STATE.s_STORE~q\,
	combout => \u_bloco_controle|r_STATE.s_INC_ADDR~feeder_combout\);

-- Location: FF_X9_Y10_N17
\u_bloco_controle|r_STATE.s_INC_ADDR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|r_STATE.s_INC_ADDR~feeder_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_INC_ADDR~q\);

-- Location: LCCOMB_X10_Y10_N30
\u_bloco_operacional|u_contador|w_COUNTER[0]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[0]~36_combout\ = \u_bloco_controle|r_STATE.s_INC_ADDR~q\ $ (\u_bloco_operacional|u_contador|w_COUNTER\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	datac => \u_bloco_operacional|u_contador|w_COUNTER\(0),
	combout => \u_bloco_operacional|u_contador|w_COUNTER[0]~36_combout\);

-- Location: FF_X10_Y10_N31
\u_bloco_operacional|u_contador|w_COUNTER[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[0]~36_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(0));

-- Location: LCCOMB_X10_Y10_N2
\u_bloco_operacional|u_contador|w_COUNTER[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[1]~12_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(0) & (\u_bloco_operacional|u_contador|w_COUNTER\(1) $ (VCC))) # (!\u_bloco_operacional|u_contador|w_COUNTER\(0) & 
-- (\u_bloco_operacional|u_contador|w_COUNTER\(1) & VCC))
-- \u_bloco_operacional|u_contador|w_COUNTER[1]~13\ = CARRY((\u_bloco_operacional|u_contador|w_COUNTER\(0) & \u_bloco_operacional|u_contador|w_COUNTER\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_operacional|u_contador|w_COUNTER\(0),
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(1),
	datad => VCC,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[1]~12_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[1]~13\);

-- Location: FF_X10_Y10_N3
\u_bloco_operacional|u_contador|w_COUNTER[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[1]~12_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(1));

-- Location: LCCOMB_X10_Y10_N4
\u_bloco_operacional|u_contador|w_COUNTER[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[2]~14_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(2) & (!\u_bloco_operacional|u_contador|w_COUNTER[1]~13\)) # (!\u_bloco_operacional|u_contador|w_COUNTER\(2) & 
-- ((\u_bloco_operacional|u_contador|w_COUNTER[1]~13\) # (GND)))
-- \u_bloco_operacional|u_contador|w_COUNTER[2]~15\ = CARRY((!\u_bloco_operacional|u_contador|w_COUNTER[1]~13\) # (!\u_bloco_operacional|u_contador|w_COUNTER\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(2),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[1]~13\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[2]~14_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[2]~15\);

-- Location: FF_X10_Y10_N5
\u_bloco_operacional|u_contador|w_COUNTER[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[2]~14_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(2));

-- Location: LCCOMB_X10_Y10_N6
\u_bloco_operacional|u_contador|w_COUNTER[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[3]~16_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(3) & (\u_bloco_operacional|u_contador|w_COUNTER[2]~15\ $ (GND))) # (!\u_bloco_operacional|u_contador|w_COUNTER\(3) & 
-- (!\u_bloco_operacional|u_contador|w_COUNTER[2]~15\ & VCC))
-- \u_bloco_operacional|u_contador|w_COUNTER[3]~17\ = CARRY((\u_bloco_operacional|u_contador|w_COUNTER\(3) & !\u_bloco_operacional|u_contador|w_COUNTER[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_operacional|u_contador|w_COUNTER\(3),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[2]~15\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[3]~16_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[3]~17\);

-- Location: FF_X10_Y10_N7
\u_bloco_operacional|u_contador|w_COUNTER[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[3]~16_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(3));

-- Location: LCCOMB_X10_Y10_N8
\u_bloco_operacional|u_contador|w_COUNTER[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[4]~18_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(4) & (!\u_bloco_operacional|u_contador|w_COUNTER[3]~17\)) # (!\u_bloco_operacional|u_contador|w_COUNTER\(4) & 
-- ((\u_bloco_operacional|u_contador|w_COUNTER[3]~17\) # (GND)))
-- \u_bloco_operacional|u_contador|w_COUNTER[4]~19\ = CARRY((!\u_bloco_operacional|u_contador|w_COUNTER[3]~17\) # (!\u_bloco_operacional|u_contador|w_COUNTER\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(4),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[3]~17\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[4]~18_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[4]~19\);

-- Location: FF_X10_Y10_N9
\u_bloco_operacional|u_contador|w_COUNTER[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[4]~18_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(4));

-- Location: LCCOMB_X10_Y10_N10
\u_bloco_operacional|u_contador|w_COUNTER[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[5]~20_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(5) & (\u_bloco_operacional|u_contador|w_COUNTER[4]~19\ $ (GND))) # (!\u_bloco_operacional|u_contador|w_COUNTER\(5) & 
-- (!\u_bloco_operacional|u_contador|w_COUNTER[4]~19\ & VCC))
-- \u_bloco_operacional|u_contador|w_COUNTER[5]~21\ = CARRY((\u_bloco_operacional|u_contador|w_COUNTER\(5) & !\u_bloco_operacional|u_contador|w_COUNTER[4]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_operacional|u_contador|w_COUNTER\(5),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[4]~19\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[5]~20_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[5]~21\);

-- Location: FF_X10_Y10_N11
\u_bloco_operacional|u_contador|w_COUNTER[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[5]~20_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(5));

-- Location: LCCOMB_X10_Y10_N12
\u_bloco_operacional|u_contador|w_COUNTER[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[6]~22_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(6) & (!\u_bloco_operacional|u_contador|w_COUNTER[5]~21\)) # (!\u_bloco_operacional|u_contador|w_COUNTER\(6) & 
-- ((\u_bloco_operacional|u_contador|w_COUNTER[5]~21\) # (GND)))
-- \u_bloco_operacional|u_contador|w_COUNTER[6]~23\ = CARRY((!\u_bloco_operacional|u_contador|w_COUNTER[5]~21\) # (!\u_bloco_operacional|u_contador|w_COUNTER\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_operacional|u_contador|w_COUNTER\(6),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[5]~21\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[6]~22_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[6]~23\);

-- Location: FF_X10_Y10_N13
\u_bloco_operacional|u_contador|w_COUNTER[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[6]~22_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(6));

-- Location: LCCOMB_X10_Y10_N14
\u_bloco_operacional|u_contador|w_COUNTER[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[7]~24_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(7) & (\u_bloco_operacional|u_contador|w_COUNTER[6]~23\ $ (GND))) # (!\u_bloco_operacional|u_contador|w_COUNTER\(7) & 
-- (!\u_bloco_operacional|u_contador|w_COUNTER[6]~23\ & VCC))
-- \u_bloco_operacional|u_contador|w_COUNTER[7]~25\ = CARRY((\u_bloco_operacional|u_contador|w_COUNTER\(7) & !\u_bloco_operacional|u_contador|w_COUNTER[6]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(7),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[6]~23\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[7]~24_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[7]~25\);

-- Location: FF_X10_Y10_N15
\u_bloco_operacional|u_contador|w_COUNTER[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[7]~24_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(7));

-- Location: LCCOMB_X10_Y10_N16
\u_bloco_operacional|u_contador|w_COUNTER[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[8]~26_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(8) & (!\u_bloco_operacional|u_contador|w_COUNTER[7]~25\)) # (!\u_bloco_operacional|u_contador|w_COUNTER\(8) & 
-- ((\u_bloco_operacional|u_contador|w_COUNTER[7]~25\) # (GND)))
-- \u_bloco_operacional|u_contador|w_COUNTER[8]~27\ = CARRY((!\u_bloco_operacional|u_contador|w_COUNTER[7]~25\) # (!\u_bloco_operacional|u_contador|w_COUNTER\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(8),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[7]~25\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[8]~26_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[8]~27\);

-- Location: FF_X10_Y10_N17
\u_bloco_operacional|u_contador|w_COUNTER[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[8]~26_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(8));

-- Location: LCCOMB_X10_Y10_N18
\u_bloco_operacional|u_contador|w_COUNTER[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[9]~28_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(9) & (\u_bloco_operacional|u_contador|w_COUNTER[8]~27\ $ (GND))) # (!\u_bloco_operacional|u_contador|w_COUNTER\(9) & 
-- (!\u_bloco_operacional|u_contador|w_COUNTER[8]~27\ & VCC))
-- \u_bloco_operacional|u_contador|w_COUNTER[9]~29\ = CARRY((\u_bloco_operacional|u_contador|w_COUNTER\(9) & !\u_bloco_operacional|u_contador|w_COUNTER[8]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_operacional|u_contador|w_COUNTER\(9),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[8]~27\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[9]~28_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[9]~29\);

-- Location: FF_X10_Y10_N19
\u_bloco_operacional|u_contador|w_COUNTER[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[9]~28_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(9));

-- Location: LCCOMB_X10_Y10_N20
\u_bloco_operacional|u_contador|w_COUNTER[10]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[10]~30_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(10) & (!\u_bloco_operacional|u_contador|w_COUNTER[9]~29\)) # (!\u_bloco_operacional|u_contador|w_COUNTER\(10) & 
-- ((\u_bloco_operacional|u_contador|w_COUNTER[9]~29\) # (GND)))
-- \u_bloco_operacional|u_contador|w_COUNTER[10]~31\ = CARRY((!\u_bloco_operacional|u_contador|w_COUNTER[9]~29\) # (!\u_bloco_operacional|u_contador|w_COUNTER\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(10),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[9]~29\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[10]~30_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[10]~31\);

-- Location: FF_X10_Y10_N21
\u_bloco_operacional|u_contador|w_COUNTER[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[10]~30_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(10));

-- Location: LCCOMB_X10_Y10_N22
\u_bloco_operacional|u_contador|w_COUNTER[11]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[11]~32_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(11) & (\u_bloco_operacional|u_contador|w_COUNTER[10]~31\ $ (GND))) # (!\u_bloco_operacional|u_contador|w_COUNTER\(11) & 
-- (!\u_bloco_operacional|u_contador|w_COUNTER[10]~31\ & VCC))
-- \u_bloco_operacional|u_contador|w_COUNTER[11]~33\ = CARRY((\u_bloco_operacional|u_contador|w_COUNTER\(11) & !\u_bloco_operacional|u_contador|w_COUNTER[10]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_bloco_operacional|u_contador|w_COUNTER\(11),
	datad => VCC,
	cin => \u_bloco_operacional|u_contador|w_COUNTER[10]~31\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[11]~32_combout\,
	cout => \u_bloco_operacional|u_contador|w_COUNTER[11]~33\);

-- Location: FF_X10_Y10_N23
\u_bloco_operacional|u_contador|w_COUNTER[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[11]~32_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(11));

-- Location: LCCOMB_X10_Y10_N24
\u_bloco_operacional|u_contador|w_COUNTER[12]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_operacional|u_contador|w_COUNTER[12]~34_combout\ = \u_bloco_operacional|u_contador|w_COUNTER[11]~33\ $ (\u_bloco_operacional|u_contador|w_COUNTER\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \u_bloco_operacional|u_contador|w_COUNTER\(12),
	cin => \u_bloco_operacional|u_contador|w_COUNTER[11]~33\,
	combout => \u_bloco_operacional|u_contador|w_COUNTER[12]~34_combout\);

-- Location: FF_X10_Y10_N25
\u_bloco_operacional|u_contador|w_COUNTER[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_operacional|u_contador|w_COUNTER[12]~34_combout\,
	clrn => \u_bloco_controle|r_STATE.s_INIT~q\,
	ena => \u_bloco_controle|r_STATE.s_INC_ADDR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_operacional|u_contador|w_COUNTER\(12));

-- Location: LCCOMB_X10_Y10_N0
\u_bloco_controle|w_NEXT.s_FINISH~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_bloco_controle|w_NEXT.s_FINISH~0_combout\ = (\u_bloco_operacional|u_contador|w_COUNTER\(12) & \u_bloco_controle|r_STATE.s_VERIFY_ADDR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_bloco_operacional|u_contador|w_COUNTER\(12),
	datac => \u_bloco_controle|r_STATE.s_VERIFY_ADDR~q\,
	combout => \u_bloco_controle|w_NEXT.s_FINISH~0_combout\);

-- Location: FF_X10_Y10_N1
\u_bloco_controle|r_STATE.s_FINISH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_bloco_controle|w_NEXT.s_FINISH~0_combout\,
	clrn => \i_CLR_N~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_bloco_controle|r_STATE.s_FINISH~q\);

ww_o_READY <= \o_READY~output_o\;
END structure;


