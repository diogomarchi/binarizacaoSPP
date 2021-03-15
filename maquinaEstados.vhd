------------------------------------------------
-- Design: maquinaEstados
-- Entity: maquinaEstados
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/14/2020
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY maquinaEstados IS
  PORT (
    i_CLK   : IN std_logic; -- input clock
    i_CLR_n : IN std_logic; -- input clear/reset
	 i_ADDR  : IN std_logic_vector(11 downto 0); --input addres
    i_MAIOR128  : IN std_logic; -- input larger or less that 128
	 i_MAIOR4096 : IN std_logic; -- input larger or less that 4096
	 o_CLR       : out std_logic; --output clear
    o_ADDR      : OUT std_logic_vector(11 downto 0); -- output addr
    o_MAIOR128  : OUT std_logic; -- output verify if is larger 128
	 o_MAIOR4096 : out std_logic; -- output verify if is larger 4096
	 o_READY     : OUT STD_LOGIC; -- output larger or less that 4096
    o_WR_EN_RAM : OUT std_logic -- output write enable in ram memory
  );
END maquinaEstados;

ARCHITECTURE rtl OF maquinaEstados IS
  -- s_INIT inicio
  -- s_finish finaliza ou nao
  -- s_LOAD pega valor no endereço
  -- s_VERIFY verfica se é maior que 128
  -- s_STORE0 armazena 0
  -- s_STORE1 armazena 1
  -- s_STORE_RAM escreve o valor na ram e incrementa contador
  -- s_READY sinaliza que terminou


  TYPE t_STATE IS (s_INIT, s_FINISH, s_LOAD, s_VERIFY, s_STORE0, s_STORE1, s_STORE_RAM, s_READY);
  SIGNAL r_STATE : t_STATE; -- state register
  SIGNAL w_NEXT : t_STATE; -- next state  

BEGIN

  p_STATE : PROCESS (i_CLK, i_CLR_n, i_MAIOR128, i_MAIOR4096)
  BEGIN
    IF (i_CLR_n = '0') THEN
      r_STATE <= s_INIT; --initial state
    ELSIF (rising_edge(i_CLK)) THEN
      r_STATE <= w_NEXT; --next state
    END IF;
  END PROCESS;
  
  p_NEXT : PROCESS (r_STATE, i_MAIOR128)
  BEGIN
    CASE (r_STATE) IS
      WHEN s_INIT =>
        w_NEXT <= s_FINISH; --vai para o proximo passando clear em 1  

      WHEN s_FINISH =>
        if(i_MAIOR4096 = '0') then
		    w_NEXT <= s_LOAD;
		  else 
		    w_NEXT <= s_READY;
		  end if;

      WHEN s_LOAD =>
        w_NEXT <= s_VERIFY;
		  
		when s_VERIFY =>
		  if(i_MAIOR128 = '1') then
		    w_NEXT <= s_STORE1;
		  else
		    w_NEXT <= s_STORE0;
		  end if;
		
		when s_STORE0 =>
		  w_NEXT <= s_STORE_RAM;
		  
		when s_STORE1 =>
		  w_NEXT <= s_STORE_RAM;
		  
		when s_STORE_RAM =>
		  w_NEXT <= s_FINISH;  

      WHEN OTHERS =>
        w_NEXT <= s_INIT;
    END CASE;
  END PROCESS;



  --atribuição do valor de constante
  
  o_ADDR      <= i_ADDR when(r_STATE = s_LOAD) else "000000000000";     
  
  o_MAIOR128  <= '1' when(r_STATE = s_STORE1) else '0';
  
  o_MAIOR4096 <= '1' when(r_STATE = s_FINISH) else '0';
  
  o_READY     <= '1' WHEN (r_STATE = s_READY) else '0';
  
  o_WR_EN_RAM <= '1' when(r_STATE = s_STORE_RAM) else '0';

  o_CLR    <= '1' WHEN (r_STATE = s_INIT) ELSE '0';
  
END rtl;