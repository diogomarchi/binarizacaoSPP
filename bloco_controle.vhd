------------------------------------------------
-- Design: bloco de controle
-- Entity: mdc_control 
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/15/2020
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY bloco_controle IS
	PORT (
	  i_CLK   		: IN std_logic; -- input clock
     i_CLR_n 		: IN std_logic; -- input clear/reset
	  i_MAIOR_PIXEL  : IN std_logic; -- input larger or less that 128
     o_WR_EN_RAM  : OUT std_logic; -- output write enable in ram memory
	  o_ADDR       : OUT std_logic_vector(12 downto 0); -- output addr
	  o_READY      : OUT STD_LOGIC -- output larger or less that 4096
	);
END bloco_controle;

ARCHITECTURE rtl OF bloco_controle IS

  component maquinaEstados IS
  PORT (
    i_CLK          : IN std_logic; -- input clock
    i_CLR_n        : IN std_logic; -- input clear/reset
	 i_ADDR         : IN std_logic_vector(12 downto 0); --input addres
    i_MAIOR_PIXEL  : IN std_logic; -- input larger or less that 128
	 o_CLR_CONT     : out std_logic; --output clear
    o_ADDR         : OUT std_logic_vector(12 downto 0); -- output addr
	 o_READY        : OUT STD_LOGIC; -- output larger or less that 4096
	 o_INC_CONT     : out std_logic; --output inc contador
    o_WR_EN_RAM    : OUT std_logic -- output write enable in ram memory
  );
  END component;

  component contador IS
  PORT (
    i_CLR : IN std_logic; -- clear/reset
    i_CLK : IN std_logic; -- clock
    i_ENA : IN std_logic; -- enable 		 
    o_CONT : OUT std_logic_vector(12 DOWNTO 0) -- data output
  );
  END component;

  signal w_o_ME_INC_CONT, w_o_ME_CLR_CONT : std_logic;
  signal w_o_C_CONT : std_logic_vector(12 downto 0);
	
BEGIN

	--connecting contador with bloco_controle and maquinaEstados
	u_contador : contador PORT MAP(
		i_CLR  => w_o_ME_CLR_CONT,
		i_CLK  => i_CLK,
		i_ENA  => w_o_ME_INC_CONT,
		o_CONT => w_o_C_CONT	
	);
	
	u_maquinaEstados : maquinaEstados port map(
	  i_CLK         => i_CLK,
	  i_CLR_n       => i_CLR_n,
	  i_ADDR        => w_o_C_CONT,
	  i_MAIOR_PIXEL => i_MAIOR_PIXEL,
	  o_CLR_CONT    => w_o_ME_CLR_CONT,
	  o_ADDR        => o_ADDR,
	  o_READY       => o_READY,
     o_INC_CONT    => w_o_ME_INC_CONT,
	  o_WR_EN_RAM   => o_WR_EN_RAM
	);

END rtl;