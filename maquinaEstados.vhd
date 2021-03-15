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
    i_MAIOR_PIXEL: IN std_logic; -- input larger or less that 128
	 o_CLR_CONT  : out std_logic; --output clear
    o_ADDR      : OUT std_logic_vector(11 downto 0); -- output addr
    o_MAIOR_PIXEL  : OUT std_logic; -- output verify if is larger 128
	 o_READY     : OUT STD_LOGIC; -- output larger or less that 4096
	 o_VALOR_ESCRITA: std_logic; -- output write in ram
    o_WR_EN_RAM : OUT std_logic -- output write enable in ram memory
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
  
  -- s_STORE0 
  -- s_STORE0 deve sinalizar escrita na RAM, sinalizar que o valor é 0 e fornecer endereco de escrita  
  
  -- s_STORE1 
  -- s_STORE1 deve sinalizar escrita na RAM, sinalizar que o valor é 1 e fornecer endereco de escrita  
  
  -- s_INC_ADDR
  -- s_INC_ADDR deve habilitar contador de endereco
  -- retornar para s_VERIFY_ADDR
  
 
  -- s_FINISH 
  -- s_FINISH deve sinalizar conclusão da operação
  -- retornar para s_INIT
  

	
  TYPE t_STATE IS (s_INIT, s_VERIFY_ADDR, s_LOAD, s_VERIFY_PIXEL, s_STORE0, s_STORE1, s_STORE_RAM, s_FINISH);
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
  
  p_NEXT : PROCESS (r_STATE)
  BEGIN
    CASE (r_STATE) IS
      WHEN s_INIT =>
        w_NEXT <= s_FINISH; --vai para o proximo passando clear em 1  

      WHEN s_VERIFY_ADDR =>
        if(i_ADDR < "4096") then
		    w_NEXT <= s_LOAD;
		  else 
		    w_NEXT <= s_FINISH;
		  end if;

      WHEN s_LOAD =>
        w_NEXT <= s_VERIFY;
		  
		when s_VERIFY_PIXEL =>
		  if(i_MAIOR_PIXEL = '1') then
		    w_NEXT <= s_STORE1;
		  else
		    w_NEXT <= s_STORE0;
		  end if;
		
		when s_STORE0 =>
		  w_NEXT <= s_STORE_RAM;
		  
		when s_STORE1 =>
		  w_NEXT <= s_STORE_RAM;
		  
		when s_STORE_RAM =>
		  w_NEXT <= s_VERIFY_ADDR;
		
      when s_FINISH =>
		  w_NEXT <= s_INIT;		

      WHEN OTHERS =>
        w_NEXT <= s_INIT;
    END CASE;
  END PROCESS;



  --atribuição do valor de constante
  
  o_ADDR         <= i_ADDR when(r_STATE = s_LOAD) else "000000000000";     
  
  o_MAIOR_PIXEL  <= '1' when(r_STATE = s_VERIFY_PIXEL) else '0';
  
  o_READY        <= '1' WHEN (r_STATE = s_FINISH) else '0';
  
  o_VALOR_ESCRITA<= '1' WHEN (r_STATE = s_STORE1) else '0';
  
  o_WR_EN_RAM    <= '1' when(r_STATE = s_STORE_RAM) else '0';

  o_CLR_CONT     <= '1' WHEN (r_STATE = s_INIT) ELSE '0';
  
END rtl;