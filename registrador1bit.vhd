------------------------------------------------
-- Design: register
-- Entity: register1bit
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/15/2021
------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registrador1bit IS
  PORT (
    i_CLK   : IN  STD_LOGIC;
    i_CLR_N : IN  STD_LOGIC;
    i_A     : IN  STD_LOGIC;  -- data input       
    o_Q     : OUT STD_LOGIC); -- data output
END registrador1bit;

ARCHITECTURE arch1 OF registrador1bit IS

  SIGNAL saida : STD_LOGIC;

BEGIN

  PROCESS (i_CLR_N, i_CLK)
  BEGIN
    IF (i_CLR_N = '0') THEN
      saida <= '0';
    ELSIF (rising_edge(i_CLK)) THEN
      saida <= i_A;
    END IF;
  END PROCESS;

  o_Q <= saida;

END arch1;
