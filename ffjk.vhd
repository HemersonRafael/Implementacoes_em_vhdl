library  ieee;
use ieee.std_logic_1164.all;

entity ffjk is 
port(j,k: in std_logic;
		clock: in std_logic;
		q,qbar: out std_logic);
end ffjk;

architecture ffjk of ffjk is 
signal qsignal: std_logic;
begin
	process(clock)
	begin
		if(clock'event and clock = '0') then
			if(j='0' and k='0') then
				qsignal <= not qsignal;
			elsif(j='0' and k='1') then
			   qsignal <= '1';
		   elsif(j='1' and k ='0') then
				qsignal <= '0';
			end if;
		end if;
	end process;
	q <= qsignal;
	qbar <= not qsignal;
end ffjk;