------------------------------------------------
-- Design: rom
-- Entity: single_port_rom
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 06/22/2020
------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE STD.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY ROM IS
  GENERIC (
    D_Width : INTEGER := 16; -- data width
    A_Width : INTEGER := 16); -- address width
  PORT (
    addr : IN std_logic_vector(15 DOWNTO 0);
    q : OUT std_logic_vector(15 DOWNTO 0)
  );

END ENTITY;

ARCHITECTURE rtl OF ROM IS

  -- Build a 2-D array type for the RoM
  SUBTYPE word_t IS std_logic_vector(D_Width - 9 DOWNTO 0);
  TYPE memory_t IS ARRAY (0 TO 2 ** A_Width - 1) OF word_t;


  impure function rom_init(filename : string) return memory_t is
    file rom_file : text open read_mode is filename;
    variable rom_line : line;
    variable rom_value : bit_vector(D_Width - 9 downto 0);
    variable temp : memory_t;
  begin
    for rom_index in 0 to 2**A_Width-1 loop
      readline(rom_file, rom_line);
      read(rom_line, rom_value);
      temp(rom_index) := to_stdlogicvector(rom_value);
    end loop;
    return temp;
  end function;
 
  constant rom : memory_t := rom_init(filename => "teste.txt");


BEGIN

  --q <= rom(to_integer(unsigned(addr)));

end rtl;