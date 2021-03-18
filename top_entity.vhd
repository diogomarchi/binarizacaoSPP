------------------------------------------------
-- Design: top_entity
-- Entity: top_entity
-- Author: Diogo & George
-- Rev. : 1.0
-- Date : 03/16/2021
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY top_entity IS
  PORT (
    i_CLK   : IN  STD_LOGIC;
    i_CLR_N : IN  STD_LOGIC;
    i_GO    : IN  STD_LOGIC; -- go signal to start processing
    o_READY : OUT STD_LOGIC  -- ready signal to sinalize ending
  );
END top_entity;

ARCHITECTURE rtl OF top_entity IS

  COMPONENT bloco_operacional IS
    PORT (
      i_CLK          : IN  STD_LOGIC;
      i_CLR_n        : IN  STD_LOGIC;
      i_INC_CONT     : IN  STD_LOGIC;                    -- enable contador
      i_CLR_CONT     : IN  STD_LOGIC;                    -- clear contador
      i_DATA         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- data input
      i_R_EN_ROM     : IN  STD_LOGIC;                    -- input read enable in rom memory
      i_EN_WR_RAM    : IN  STD_LOGIC;                    -- data input 
      o_CONTINUE_n   : OUT STD_LOGIC;                    -- data output continue
      o_R_EN_ROM     : OUT STD_LOGIC;                    -- output read enable in rom memory  
      o_VALOR_WR_RAM : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- data output
      o_ADDR         : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);-- data output
      o_WR_EN_RAM    : OUT STD_LOGIC -- output write enable ram 
    );
  END COMPONENT;

  COMPONENT bloco_controle IS
    PORT (

      i_CLK        : IN  STD_LOGIC; -- input clock
      i_CLR_n      : IN  STD_LOGIC; -- input clear/reset
      i_CONTINUE_n : IN  STD_LOGIC; -- input addres
      i_GO         : IN  STD_LOGIC; -- go signal
      o_CLR_CONT   : OUT STD_LOGIC; -- output clear
      o_READY      : OUT STD_LOGIC; -- output larger or less that 4096
      o_INC_CONT   : OUT STD_LOGIC; -- output inc contador
      o_R_EN_ROM   : OUT STD_LOGIC; -- output read enable in rom memory
      o_WR_EN_RAM  : OUT STD_LOGIC  -- output write enable in ram memory
    );
  END COMPONENT;
  COMPONENT ROM
    PORT (
      aclr    : IN  STD_LOGIC := '0';
      address : IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
      clken   : IN  STD_LOGIC := '1';
      clock   : IN  STD_LOGIC := '1';
      rden    : IN  STD_LOGIC := '1';
      q       : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT RAM
    PORT (
      aclr    : IN  STD_LOGIC := '0';
      address : IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
      clken   : IN  STD_LOGIC := '1';
      clock   : IN  STD_LOGIC := '1';
      data    : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
      rden    : IN  STD_LOGIC := '1';
      wren    : IN  STD_LOGIC;
      q       : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL w_o_BO_CONTINUE, w_o_ME_CLR_CONT, w_o_ME_INC_CONT   : STD_LOGIC;
  SIGNAL w_o_ME_EN_ROM, w_o_ME_EN_RAM, w_READ_EN, w_WRITE_EN : STD_LOGIC;

  SIGNAL w_PIXEL, w_NEW_PIXEL : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL w_ADDR               : STD_LOGIC_VECTOR (11 DOWNTO 0);

  SIGNAL w_o_RAM : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

  u_bloco_controle : bloco_controle PORT MAP(
    i_CLK        => i_CLK,
    i_CLR_n      => i_CLR_n,
    i_CONTINUE_n => w_o_BO_CONTINUE,
    i_GO         => i_GO,
    o_CLR_CONT   => w_o_ME_CLR_CONT,
    o_READY      => o_READY,
    o_INC_CONT   => w_o_ME_INC_CONT,
    o_R_EN_ROM   => w_o_ME_EN_ROM,
    o_WR_EN_RAM  => w_o_ME_EN_RAM
  );

  u_bloco_operacional : bloco_operacional PORT MAP(
    i_CLK          => i_CLK,
    i_CLR_N        => i_CLR_n,
    i_INC_CONT     => w_o_ME_INC_CONT,
    i_CLR_CONT     => w_o_ME_CLR_CONT,
    i_DATA         => w_PIXEL,
    i_R_EN_ROM     => w_o_ME_EN_ROM,
    i_EN_WR_RAM    => w_o_ME_EN_RAM,
    o_CONTINUE_n   => w_o_BO_CONTINUE,
    o_R_EN_ROM     => w_READ_EN,
    o_VALOR_WR_RAM => w_NEW_PIXEL,
    o_ADDR         => w_ADDR,
    o_WR_EN_RAM    => w_WRITE_EN
  );
  u_RAM : RAM PORT MAP(
    aclr    => '0',
    address => w_ADDR,
    clken   => '1',
    clock   => i_CLK,
    data    => w_NEW_PIXEL,
    rden    => '0',
    wren    => w_WRITE_EN,
    q       => w_o_RAM
  );

  u_ROM : ROM PORT MAP(
    aclr    => '0',
    address => w_ADDR,
    clken   => '1',
    clock   => i_CLK,
    rden    => w_READ_EN,
    q       => w_PIXEL
  );
END rtl;

