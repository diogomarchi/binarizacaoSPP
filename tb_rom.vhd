-- tb rom


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_rom is
end entity;

architecture arch of tb_rom is

component rom_template IS
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		address		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		clken		: IN STD_LOGIC  := '1';
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;  

  --Inputs
  signal w_addr : std_logic_vector(11 downto 0) := (others => '0');

  --Outputs
  signal w_B : std_logic_vector(7 downto 0) := (others => '0');  


  signal w_clr, w_CLK, w_clken : std_logic;

  constant c_CLK_period : time := 2 ns;

begin

    --Instantiate the Device Under Test (DUT)
  DUT : rom_template
  port map(
    aclr	=> w_clr,
    address	=> w_addr,
    clken	=> w_CLKEN,
    clock	=> w_CLK,
     q		=> w_B
  );
  
   p_CLK: process
  begin
    w_CLK <= '1';
    wait for c_CLK_PERIOD/2;  
    w_CLK <= '0';
    wait for c_CLK_PERIOD/2;  
  end process p_CLK;


  p_TEST : process
  begin

  w_CLKEN <= '1';

  w_addr  <= "000000000000"; --- addres
  wait for 2*c_CLK_PERIOD;
  
  w_addr  <= "000000000001"; --- addres
  wait for 2*c_CLK_PERIOD;

  w_addr  <= "000000000010"; --- addres
  wait for 2*c_CLK_PERIOD;


  -- TEST DONE
  assert false report "Test done." severity note;
  wait;

  end process;
end architecture;