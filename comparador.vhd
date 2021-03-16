------------------------------------------------
-- Design: comparador 8 bits
-- Entity: comparador
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/15/2021
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity comparador is
port ( 
  i_VALOR : in  std_logic_vector(7 downto 0);  -- selector	 
  o_Q     : out  std_logic -- data output
); 
end comparador;


architecture arch_1 of comparador is

begin
  -- SAIDA
  o_Q <= '1' when (i_VALOR > "10000000") else '0';			
  
end arch_1;