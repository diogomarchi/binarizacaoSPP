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
  i_CLK          : IN std_logic;
  i_CLR_N        : IN std_logic;
  i_DATA         : IN std_logic_vector(7 downto 0);    -- data input
  o_ADDR         : OUT std_logic_vector(12 downto 0);  -- output address
  o_R_EN_ROM     : OUT std_logic;                      -- output enable read rom
  o_WR_EN_RAM    : OUT std_logic;                      -- output enable write ram
  o_VALOR_WR_RAM : OUT std_logic_vector(7 downto 0);   -- output data write in ram
  o_READY        : OUT STD_LOGIC                       -- output larger or less that 4096
);
END bloco_funcional;

ARCHITECTURE rtl OF bloco_funcional IS

  component bloco_operacional IS
  PORT (
    i_CLK         : IN std_logic;
    i_CLR_N       : IN std_logic;
    i_INC_CONT    : IN std_logic;                     -- enable contador
    i_CLR_CONT    : IN std_logic;                     -- clear contador
    i_DATA        : IN std_logic_vector(7 downto 0);  -- data input
    i_R_EN_ROM    : IN std_logic;                     -- input read enable in rom memory
    i_EN_WR_RAM   : IN std_logic;                     -- data input 
    o_CONTINUE    : OUT std_logic;                    -- data output continue
	 o_R_EN_ROM    : OUT std_logic;                     -- output read enable in rom memory  
    o_VALOR_WR_RAM: OUT std_logic_Vector(7 DOWNTO 0); -- data output
    o_ADDR        : OUT std_logic_vector(12 downto 0);-- data output
    o_WR_EN_RAM   : OUT std_logic                     -- output write enable ram 
  );
  END component;
  
  component maquinaEstados IS
  PORT (
    i_CLK          : IN std_logic; -- input clock
    i_CLR_n        : IN std_logic; -- input clear/reset
	 i_CONTINUE     : IN std_logic; --input addres
	 o_CLR_CONT     : out std_logic; --output clear
	 o_READY        : OUT STD_LOGIC; -- output larger or less that 4096
	 o_INC_CONT     : out std_logic; --output inc contador
	 o_R_EN_ROM     : OUT std_logic; -- output read enable in rom memory
    o_WR_EN_RAM    : OUT std_logic -- output write enable in ram memory
  );
  END component;

  signal w_o_BO_CONTINUE, w_o_ME_CLR_CONT, w_o_ME_INC_CONT,w_o_ME_EN_ROM, w_o_ME_EN_RAM : std_logic;
	
BEGIN

  u_maquinaEstados : maquinaEstados port map(
    i_CLK       => i_CLK,
    i_CLR_n     => i_CLR_n,
    i_CONTINUE  => w_o_BO_CONTINUE,
    o_CLR_CONT  => w_o_ME_CLR_CONT,
    o_READY     => o_READY,
    o_INC_CONT  => w_o_ME_INC_CONT,
    o_R_EN_ROM  => w_o_ME_EN_ROM,
    o_WR_EN_RAM => w_o_ME_EN_RAM
  );
	
	u_bloco_operacional : bloco_operacional port map(
	  i_CLK          =>  i_CLK,  
	  i_CLR_N        =>  i_CLR_n,
	  i_INC_CONT     =>  w_o_ME_INC_CONT,
	  i_CLR_CONT     =>  w_o_ME_CLR_CONT,
	  i_DATA         =>  i_DATA,
	  i_R_EN_ROM     =>  w_o_ME_EN_ROM,
	  i_EN_WR_RAM    =>  w_o_ME_EN_RAM, 
	  o_CONTINUE     =>  w_o_BO_CONTINUE,
	  o_R_EN_ROM     =>  o_R_EN_ROM,
	  o_VALOR_WR_RAM =>  o_VALOR_WR_RAM,
	  o_ADDR         =>  o_ADDR,
	  o_WR_EN_RAM    =>  o_WR_EN_RAM   
	);
	

END rtl;