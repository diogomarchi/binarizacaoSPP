------------------------------------------------
-- Design: register
-- Entity: register
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/15/2021
------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_8bit IS
  PORT (
    i_CLK : IN std_logic;
    i_CLR_N : IN std_logic;
    i_ENA : IN std_logic; -- enable
    i_A : IN std_logic_Vector(7 DOWNTO 0); -- data input       
    o_Q : OUT std_logic_Vector(7 DOWNTO 0)); -- data output
END register_8bit;
ARCHITECTURE arch1 OF register_8bit IS

  SIGNAL saida: std_logic_vector(7 DOWNTO 0);

BEGIN

  PROCESS (i_CLR_N, i_CLK)
  BEGIN
    IF (i_CLR_N = '0') THEN
      saida <= "00000000";
    ELSIF (rising_edge(i_CLK)) THEN
      IF (i_ENA = '1') THEN
        saida <= i_A;
      END IF;
    END IF;
  END PROCESS;

  o_Q <= saida;

END arch1;