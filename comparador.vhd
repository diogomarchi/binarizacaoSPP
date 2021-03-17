------------------------------------------------
-- Design: comparador 8 bits
-- Entity: comparador
-- Author: Diogo & George
-- Rev. : 1.0
-- Date : 03/15/2021
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY comparador IS
  PORT (
<<<<<<< HEAD
    i_VALOR : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- selector	 
    o_Q     : OUT STD_LOGIC                     -- data output
=======
    i_VALOR : IN std_logic_vector(7 DOWNTO 0); -- selector
    o_Q : OUT std_logic -- data output
>>>>>>> ef1f14d774c95c6c2a34c511c0db054f8890660d
  );
END comparador;
ARCHITECTURE arch_1 OF comparador IS

BEGIN
  -- SAIDA
  o_Q <= '1' WHEN (i_VALOR > "10000000") ELSE '0';

<<<<<<< HEAD
END arch_1;
=======
END arch_1;
>>>>>>> ef1f14d774c95c6c2a34c511c0db054f8890660d
