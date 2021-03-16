------------------------------------------------
-- Design: ALU 16bits
-- Entity: ALU
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/16/2021
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity multiplexador is
port ( 
  i_COMPARE : in  std_logic;  -- selector
  o_Q       : out  std_logic_Vector(7 downto 0)); -- data output
end multiplexador;


architecture arch_1 of multiplexador is

begin
   	      
  o_Q <= "11111111" when (i_COMPARE = '1') else "00000000";
  
end arch_1;