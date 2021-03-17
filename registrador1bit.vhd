-----------------------------------------------
-- Design: register
-- Entity: register1bit
-- Author: Diogo & George
-- Rev. : 1.0
-- Date : 03/15/2021
------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registrador1bit IS
  PORT (
<<<<<<< HEAD
    i_CLK   : IN  STD_LOGIC;
    i_CLR_N : IN  STD_LOGIC;
    i_A     : IN  STD_LOGIC;  -- data input       
    o_Q     : OUT STD_LOGIC); -- data output
=======
    i_CLK : IN std_logic;
    i_CLR_N : IN std_logic;
    i_A : IN std_logic; -- data input
  o_Q : OUT std_logic); -- data output
>>>>>>> ef1f14d774c95c6c2a34c511c0db054f8890660d
END registrador1bit;

ARCHITECTURE arch1 OF registrador1bit IS

<<<<<<< HEAD
  SIGNAL saida : STD_LOGIC;
=======
  SIGNAL saida : std_logic;
>>>>>>> ef1f14d774c95c6c2a34c511c0db054f8890660d

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
