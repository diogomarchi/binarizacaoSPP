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
    i_MAIOR128 : IN std_logic; -- input larger or less that 128
    o_ADDR  : OUT std_logic; -- output addr
	 o_FINISH: out std_logic; -- output finish the Binarization
    o_MAIOR128 : OUT std_logic; -- output larger or less that 128
	 o_MAIOR4096: OUT STD_LOGIC; -- output larger or less that 4096
    o_WR_EN_RAM: OUT std_logic -- output write enable in ram memory
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

  p_STATE : PROCESS (i_CLK, i_CLR_n, i_MAIOR128)
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
        w_NEXT <= s_DECODE;

      WHEN s_DECODE =>
        IF (w_OP = "0000") THEN -- caso op = load next state = carregar
          w_NEXT <= s_LOAD;
        ELSIF (w_OP = "0001") THEN -- caso op = armazenar next state = armazenar
          w_NEXT <= s_STORE;
        ELSIF (w_OP = "0010") THEN -- caso op = somar next state = somar
          w_NEXT <= s_ADD;
        ELSIF (w_OP = "0011") THEN -- caso op = carregaconst next state = carregaconst
          w_NEXT <= s_LD_CONST;
        ELSIF (w_OP = "0100") THEN -- caso op = sub A-B next state = sub A - B
          w_NEXT <= s_SUB;
        ELSIF (w_OP = "0101") THEN -- caso op = Jump next state = Jump
          w_NEXT <= s_JUMPZ;
        ELSIF (w_OP = "0110") THEN -- caso op = if RP < RQ 	0110 RW RP RQ
          w_NEXT <= s_LT;
        ELSIF (w_OP = "0111") THEN -- caso op = jump to 
          w_NEXT <= s_JUMP;
        ELSE
          w_NEXT <= s_DECODE;
        END IF;

     

      WHEN OTHERS =>
        w_NEXT <= s_INIT;
    END CASE;
  END PROCESS;



  --atribuição do valor de constante
  o_MAIOR4096 <= '1' WHEN (r_STATE = s_FINISH) else '0';

  o_PC_CLR <= '1' WHEN (r_STATE = s_INIT) ELSE
    '0';

  
END rtl;