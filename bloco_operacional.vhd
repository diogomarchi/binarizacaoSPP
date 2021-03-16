------------------------------------------------
-- Design: bloco operacional
-- Entity: bloco_operacional
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/16/2020
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY bloco_operacional IS
PORT (
  i_CLK         : IN std_logic;
  i_CLR_N       : IN std_logic;
  i_INC_CONT    : IN std_logic;                     -- enable contador
  i_CLR_CONT    : IN std_logic;                     -- clear contador
  i_DATA        : IN std_logic_vector(7 downto 0);  -- data input
  i_R_EN_ROM    : IN std_logic;                     -- input read enable in rom memory
  i_EN_WR_RAM   : IN std_logic;                     -- data input   
  o_VALOR_WR_RAM: OUT std_logic_Vector(7 DOWNTO 0); -- data output
  o_ADDR        : OUT std_logic_vector(12 downto 0);-- data output
  o_WR_EN_RAM   : OUT std_logic                     -- output write enable ram 
);
END bloco_operacional;

ARCHITECTURE rtl OF bloco_operacional IS
  
  component registrador1bit IS
  PORT (
    i_CLK   : IN std_logic;
    i_CLR_N : IN std_logic;
    i_A     : IN std_logic; -- data input       
    o_Q     : OUT std_logic); -- data output
  END component;

  component comparador is
  port ( 
    i_VALOR : in  std_logic_vector(7 downto 0);  -- selector	 
    o_Q     : out  std_logic);                   -- data output 
  end component;
  
  component multiplexador is
  port ( 
    i_COMPARE : in  std_logic;                      -- selector
    o_Q       : out  std_logic_Vector(7 downto 0)); -- data output
  end component;
  
  component contador IS
  PORT (
    i_CLR : IN std_logic; -- clear/reset
    i_CLK : IN std_logic; -- clock
    i_ENA : IN std_logic; -- enable 		 
    o_CONT : OUT std_logic_vector(12 DOWNTO 0) -- data output
  );
  END component;

  signal w_o_REGISTER, w_i_A_REGISTER : std_logic_vector(7 downto 0);
  signal w_o_C_CONT : std_logic_vector(12 downto 0);
  signal w_o_COMPARE, w_o_REG_1_bit : std_logic;
	
BEGIN
	
	u_registrador1bit : registrador1bit port map(
	  i_CLK   => i_CLK,
	  i_CLR_N => i_CLR_n,
	  i_A     => w_o_COMPARE,
	  o_Q     => w_o_REG_1_bit
	);
	
	u_multiplexador : multiplexador port map(
	  i_COMPARE => w_o_REG_1_bit,
	  o_Q       => w_i_A_REGISTER
	);
	
	u_comparador : comparador port map(
	  i_VALOR  => i_DATA,
	  o_Q      => w_o_COMPARE 
	);
	
	--connecting contador with bloco_controle and maquinaEstados
	u_contador : contador PORT MAP(
	  i_CLR  => i_CLR_CONT,
	  i_CLK  => i_CLK,
	  i_ENA  => i_INC_CONT,
	  o_CONT => w_o_C_CONT	
	);
	
	o_ADDR      <= w_o_C_CONT;
	o_WR_EN_RAM <= i_EN_WR_RAM;
	o_VALOR_WR_RAM <= w_i_A_REGISTER;

END rtl;