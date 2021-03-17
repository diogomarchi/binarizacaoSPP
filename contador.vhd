------------------------------------------------
-- Design: contador
-- Entity: contador
-- Author: Diogo & George
-- Rev. : 1.0
-- Date : 03/14/2021
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY contador IS
  PORT (
<<<<<<< HEAD
    i_CLR  : IN  STD_LOGIC;                    -- clear/reset
    i_CLK  : IN  STD_LOGIC;                    -- clock
    i_ENA  : IN  STD_LOGIC;                    -- enable 		 
    o_CONT : OUT STD_LOGIC_VECTOR(12 DOWNTO 0) -- data output
=======
    i_CLR : IN std_logic; -- clear/reset
    i_CLK : IN std_logic; -- clock
    i_ENA : IN std_logic; -- enable
    o_CONT : OUT std_logic_vector(12 DOWNTO 0) -- data output
>>>>>>> ef1f14d774c95c6c2a34c511c0db054f8890660d
  );
END contador;

ARCHITECTURE rtl OF contador IS

  SIGNAL w_COUNTER : STD_LOGIC_VECTOR(12 DOWNTO 0);

BEGIN
  PROCESS (i_CLR, i_CLK)
  BEGIN
    IF (i_CLR = '1') THEN
      w_COUNTER <= "0000000000000";
    ELSIF (rising_edge(i_CLK)) THEN
      IF (i_ENA = '1') THEN
        w_COUNTER <= w_COUNTER + "1";
      END IF;
    END IF;
  END PROCESS;

  o_CONT <= w_COUNTER;

END rtl;
