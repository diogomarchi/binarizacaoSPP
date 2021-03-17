------------------------------------------------
-- Design: maquinaEstados
-- Entity: maquinaEstados
-- Author: Diogo & George
-- Rev.  : 1.0
-- Date  : 03/14/2020
------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;

ENTITY maquinaEstados IS
  PORT (
    i_CLK          : IN std_logic; -- input clock
    i_CLR_n        : IN std_logic; -- input clear/reset
	 i_GO           : in std_logic; -- go 
	 i_CONTINUE_n   : IN std_logic; --input addres
	 o_CLR_CONT     : out std_logic; --output clear
	 o_READY        : OUT STD_LOGIC; -- output larger or less that 4096
	 o_INC_CONT     : out std_logic; --output inc contador
	 o_R_EN_ROM     : OUT std_logic; -- output read enable in rom memory
    o_WR_EN_RAM    : OUT std_logic -- output write enable in ram memory
  );
END maquinaEstados;

ARCHITECTURE rtl OF maquinaEstados IS
  -- s_INIT     
  -- s_INIT deve zerar o contador de endereco e aguardar sinal de GO
  
  
  -- s_VERIFY_ADDR 
  -- s_VERIFY_ADDR deve verificar se o endereco é maior/menor que ALGUM VALOR (GENÉRICO)
  -- SE FOR MENOR VAI PARA s_LOAD
  -- SE FOR MAIOR VAI PARA s_FINISH
  
  -- s_LOAD 
  -- s_LOAD deve sinalizar leitura ROM e fornecer endereco de leitura
  
  -- s_VERIFY_PIXEL
  -- s_VERIFY_PIXEL deve verificar um sinal de entrada que indique se o valor é maior ou menor 
  -- SE FOR MENOR VAI PARA s_STORE0
  -- SE FOR MAIOR VAI PARA s_STORE1
  
  -- s_STORE 
  -- s_STORE deve sinalizar escrita na RAM, sinalizar que o valor é 0 e fornecer endereco de escrita  
  
  
  -- s_INC_ADDR
  -- s_INC_ADDR deve habilitar contador de endereco
  -- retornar para s_VERIFY_ADDR
  
 
  -- s_FINISH 
  -- s_FINISH deve sinalizar conclusão da operação
  -- retornar para s_INIT
  

	
  TYPE t_STATE IS (s_INIT, s_VERIFY_ADDR, s_LOAD, s_VERIFY_PIXEL, s_STORE, s_INC_ADDR, s_FINISH);
  SIGNAL r_STATE : t_STATE; -- state register
  SIGNAL w_NEXT : t_STATE; -- next state  

BEGIN

  p_STATE : PROCESS (i_CLK, i_CLR_n)
  BEGIN
    IF (i_CLR_n = '0') THEN
      r_STATE <= s_INIT; --initial state
    ELSIF (rising_edge(i_CLK)) THEN
      r_STATE <= w_NEXT; --next state
    END IF;
  END PROCESS;
  
  p_NEXT : PROCESS (r_STATE, i_GO, i_CONTINUE_n)
  BEGIN
    CASE (r_STATE) IS
      WHEN s_INIT =>
		  if (i_GO = '1') then
          w_NEXT <= s_VERIFY_ADDR; --vai para o proximo passando clear em 1  
        else
		    w_NEXT <= s_INIT;		  
		  end if;
		  
      WHEN s_VERIFY_ADDR =>
        if(i_CONTINUE_n = '0') then
		    w_NEXT <= s_LOAD;
		  else 
		    w_NEXT <= s_FINISH;
		  end if;

      WHEN s_LOAD =>
        w_NEXT <= s_VERIFY_PIXEL;
		  
		when s_VERIFY_PIXEL =>
		    w_NEXT <= s_STORE;
		
		when s_STORE =>
		  w_NEXT <= s_INC_ADDR;
		  
		when s_INC_ADDR =>
		  w_NEXT <= s_VERIFY_ADDR;
		
      when s_FINISH =>
		  w_NEXT <= s_INIT;		

      WHEN OTHERS =>
        w_NEXT <= s_INIT;
    END CASE;
  END PROCESS;



  --atribuição do valor de constante 
  
  o_READY        <= '1' WHEN (r_STATE = s_FINISH) else '0';
  
  o_WR_EN_RAM    <= '1' when(r_STATE = s_STORE) else '0';

  o_CLR_CONT     <= '1' WHEN (r_STATE = s_INIT) ELSE '0';
  
  o_INC_CONT     <= '1' when (r_STATE = s_INC_ADDR) else '0';
  
  o_R_EN_ROM     <= '1' when (r_STATE = s_LOAD) else '0';
  
END rtl;