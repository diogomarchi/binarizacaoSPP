------------------------------------------------
-- Design: bloco operacional
-- Entity: bloco_operacional
-- Author: Diogo & George
-- Rev. : 1.0
-- Date : 03/16/2021
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY bloco_operacional IS
	PORT (
		i_CLK : IN std_logic;
		i_CLR_N : IN std_logic;
		i_INC_CONT : IN std_logic; -- enable contador
		i_CLR_CONT : IN std_logic; -- clear contador
		i_DATA : IN std_logic_vector(7 DOWNTO 0); -- data input
		i_R_EN_ROM : IN std_logic; -- input read enable in rom memory
		i_EN_WR_RAM : IN std_logic; -- data input
		o_CONTINUE_n : OUT std_logic; -- data output continue
		o_R_EN_ROM : OUT std_logic; -- output read enable in rom memory 
		o_VALOR_WR_RAM : OUT std_logic_Vector(7 DOWNTO 0); -- data output
		o_ADDR : OUT std_logic_vector(11 DOWNTO 0);-- data output
		o_WR_EN_RAM : OUT std_logic -- output write enable ram
	);
END bloco_operacional;

ARCHITECTURE rtl OF bloco_operacional IS
 
	COMPONENT registrador1bit IS
		PORT (
			i_CLK : IN std_logic;
			i_CLR_N : IN std_logic;
			i_A : IN std_logic; -- data input 
		o_Q : OUT std_logic); -- data output
	END COMPONENT;

	COMPONENT comparador IS
		PORT (
			i_VALOR : IN std_logic_vector(7 DOWNTO 0); -- selector 
		o_Q : OUT std_logic); -- data output
	END COMPONENT;
 
	COMPONENT multiplexador IS
		PORT (
			i_SEL : IN std_logic; -- selector
			i_A : IN std_logic_Vector(7 DOWNTO 0); -- data A
			i_B : IN std_logic_Vector(7 DOWNTO 0); -- data B
		o_Q : OUT std_logic_Vector(7 DOWNTO 0)); -- data output
	END COMPONENT;
 
	COMPONENT contador IS
		PORT (
			i_CLR : IN std_logic; -- clear/reset
			i_CLK : IN std_logic; -- clock
			i_ENA : IN std_logic; -- enable 
			o_CONT : OUT std_logic_vector(12 DOWNTO 0) -- data output
		);
	END COMPONENT;

	SIGNAL w_o_REGISTER : std_logic_vector(7 DOWNTO 0);
	SIGNAL w_o_C_CONT : std_logic_vector(12 DOWNTO 0);
	SIGNAL w_o_COMPARE, w_o_REG_1_bit : std_logic;
 
BEGIN
	u_registrador1bit : registrador1bit
	PORT MAP(
		i_CLK => i_CLK, 
		i_CLR_N => i_CLR_n, 
		i_A => w_o_COMPARE, 
		o_Q => w_o_REG_1_bit
	);
 
	u_multiplexador : multiplexador
	PORT MAP(
		i_SEL => w_o_REG_1_bit, 
		i_A => "00000000", 
		i_B => "11111111", 
		o_Q => o_VALOR_WR_RAM
	);
 
	u_comparador : comparador
	PORT MAP(
		i_VALOR => i_DATA, 
		o_Q => w_o_COMPARE
	);
 
	--connecting contador with bloco_controle and maquinaEstados
	u_contador : contador
	PORT MAP(
		i_CLR => i_CLR_CONT, 
		i_CLK => i_CLK, 
		i_ENA => i_INC_CONT, 
		o_CONT => w_o_C_CONT 
	);
 
	o_ADDR <= w_o_C_CONT(11 DOWNTO 0);
	o_WR_EN_RAM <= i_EN_WR_RAM;
	o_R_EN_ROM <= i_R_EN_ROM;
	o_CONTINUE_n <= w_o_C_CONT(12);

END rtl;