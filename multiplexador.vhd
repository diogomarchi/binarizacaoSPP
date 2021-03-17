------------------------------------------------
-- Design: multiplexador 2x1
-- Entity: multiplexador
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/16/2021
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity multiplexador is
port ( 
  i_SEL : in  std_logic;  -- selector
  i_A	  : in  std_logic_Vector(7 downto 0);  -- data A
  i_B	  : in  std_logic_Vector(7 downto 0);  -- data B
  o_Q   : out std_logic_Vector(7 downto 0)); -- data output
end multiplexador;


architecture arch_1 of multiplexador is

begin
   	      
  o_Q <= i_A when (i_SEL = '0') else i_B;
  
end arch_1;