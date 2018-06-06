library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity contadorCrescente is
	port(	clock, reset, enable: in std_logic;
			q: out std_logic_vector (5 downto 0);
			unidade, dezena: out std_logic_vector (3 downto 0)
		  );
end contadorCrescente;

architecture contador of contadorCrescente is
begin
	process(clock, reset)
	variable contagem : integer range 0 to 59;
	variable auxUnidade : integer range 0 to 9; 
	variable auxDezena : integer range 0 to 5;
	begin
		if reset = '1' or contagem = 60  then
			contagem := 0;
		-- na borda de subida de clock
		elsif clock'event and clock = '1' then
				if enable = '1' then
					contagem := contagem + 1;
				end if;
		end if;
		--Receber o quociente da divisão por dez
		auxDezena := conv_integer(contagem / 10);
		-- Receber o resto da divisão por dez
		auxUnidade := conv_integer(contagem rem 10);
		-- conversão de integer para std_logic_vector com 4 bits
		unidade <= conv_std_logic_vector(auxUnidade,4);
		dezena <= conv_std_logic_vector(auxDezena,4);
		
		q <= conv_std_logic_vector(contagem,6);
	end process;
end contador;
		