------------------------------------------------
-- Design: contador
-- Entity: reg_PC
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/14/2021
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador IS
  PORT (
    i_CLR : IN std_logic; -- clear/reset
    i_CLK    : IN std_logic; -- clock
    i_INC : IN std_logic; -- enable 		 
    o_CONT     : OUT std_logic_vector(11 DOWNTO 0) -- data output
  );
END contador;
ARCHITECTURE rtl OF contador IS

  SIGNAL w_COUNTER : std_logic_vector(11 DOWNTO 0);

BEGIN

  PROCESS (i_CLR, i_CLK, i_INC)
  BEGIN
    IF (i_CLR = '1') THEN
      w_COUNTER <= "000000000000";
    ELSIF (rising_edge(i_CLK)) THEN
      IF (i_INC = '1') THEN
        w_COUNTER <= w_COUNTER + "1";
      END IF;
    END IF;
  END PROCESS;

  o_CONT <= w_COUNTER;

END rtl;