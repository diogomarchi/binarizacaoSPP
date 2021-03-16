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

ENTITY bloco_funcional IS
PORT (
  i_CLK         : IN std_logic;
  i_CLR_N       : IN std_logic;
  i_DATA        : IN std_logic_vector(7 downto 0);  -- data input
  o_READY       : OUT STD_LOGIC -- output larger or less that 4096
);
END bloco_funcional;

ARCHITECTURE rtl OF bloco_funcional IS

  component bloco_operacional IS
  PORT (
    i_CLK         : IN std_logic;
    i_CLR_N       : IN std_logic;
    i_ADDR        : IN std_logic_vector(12 downto 0); -- data input addres
    i_DATA        : IN std_logic_vector(7 downto 0);  -- data input
    i_R_EN_ROM    : IN std_logic;                     -- input read enable in rom memory
    i_EN_REGISTER : IN std_logic;                     -- data input  
    i_WR_EN_RAM   : OUT std_logic;                    -- output write enable ram  
    o_REGISTER    : OUT std_logic_Vector(7 DOWNTO 0); -- data output
    o_ADDR        : OUT std_logic_vector(12 downto 0);-- data output
    o_COMPARE     : out  std_logic                    -- data output
  );
  END component;
  
  component bloco_controle IS
  PORT (
    i_CLK   		: IN std_logic; -- input clock
    i_CLR_n 		: IN std_logic; -- input clear/reset
    i_MAIOR_PIXEL : IN std_logic; -- input larger or less that 128
    o_WR_EN_RAM   : OUT std_logic; -- output write enable in ram memory
    o_R_EN_ROM    : OUT std_logic; -- output read enable in rom memory
    o_ADDR        : OUT std_logic_vector(12 downto 0); -- output addr
    o_READY       : OUT STD_LOGIC -- output larger or less that 4096
	);
  END component;

  signal w_o_ADDR : std_logic_vector(12 downto 0);
  signal w_o_WR_EN_RAM, w_o_R_EN_ROM, w_i_MAIOR_PIXEL : std_logic;
	
BEGIN

	--connecting contador with bloco_controle and maquinaEstados
	u_bloco_controle : bloco_controle PORT MAP(
	  i_CLK   		 => i_CLK,
	  i_CLR_n 		 => i_CLR_n,
	  i_MAIOR_PIXEL => w_i_MAIOR_PIXEL,
	  o_WR_EN_RAM   => w_o_WR_EN_RAM,
	  o_R_EN_ROM    => w_o_R_EN_ROM,
	  o_ADDR        => w_o_ADDR,
	  o_READY       => o_READY
	);
	--
	--u_bloco_operacional : bloco_operacional port map(
	--  i_CLK         => i_CLK,
	 -- i_CLR_N       => i_CLR_n,
	 -- i_ADDR        => 
	--  i_DATA        => i_DATA,
	--  i_R_EN_ROM    => w_o_R_EN_ROM
	--  i_EN_REGISTER => w_o_WR_EN_RAM
	--  i_WR_EN_RAM   => w_o_WR_EN_RAM
	--  o_REGISTER    => 
	--  o_ADDR        => 
  --   o_COMPARE     => 
	--);
	--

END rtl;