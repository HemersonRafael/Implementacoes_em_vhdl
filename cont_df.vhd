library ieee;
use ieee.std_logic_1164.all;

entity cont_df is
port(	clock: in std_logic;
		saida: out std_logic_vector(3 downto 0)
	  );
		
end cont_df;

architecture hardware of cont_df is
component ffjk is 
port(j,k: in std_logic;
		clock: in std_logic;
		q,qbar: out std_logic);
end component;

component DivisorFrequencia is 
	port( clock_in: in std_logic;
			clock_out: out std_logic
			);
end component;
signal qsaida : std_logic_vector (3 downto 0);
signal dfClokOut : std_logic;
begin
	DF0: DivisorFrequencia port map (clock, dfClokOut);
	FF0: ffjk port map('0', '0', dfClokOut, qsaida(0));
	FF1: ffjk port map('0', '0', qsaida(0), qsaida(1));
	FF2: ffjk port map('0', '0', qsaida(1), qsaida(2));
	FF3: ffjk port map('0', '0', qsaida(2), qsaida(3));
	saida <= qsaida;
end hardware;