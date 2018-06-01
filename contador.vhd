library ieee;
use ieee.std_logic_1164.all;

entity contador is
port(	clock: in std_logic;
		saida: out std_logic_vector(3 downto 0);
		a : OUT std_logic;
		b : OUT std_logic;
		c : OUT std_logic;
		d : OUT std_logic;
		e : OUT std_logic;
		f : OUT std_logic;
		g : OUT std_logic
	);
		
end contador;

architecture contador of contador is
component ffjk is 
port(j,k: in std_logic;
		clock: in std_logic;
		q,qbar: out std_logic);
end component;
component d7s IS
Port(w,x,y,z :IN std_logic;
	a : OUT std_logic;
	b : OUT std_logic;
	c : OUT std_logic;
	d : OUT std_logic;
	e : OUT std_logic;
	f : OUT std_logic;
	g : OUT std_logic
	);
End component;
signal qsaida : std_logic_vector (3 downto 0);
begin 
	FF0: ffjk port map('0', '0', clock, qsaida(0));
	FF1: ffjk port map('0', '0', qsaida(0), qsaida(1));
	FF2: ffjk port map('0', '0', qsaida(1), qsaida(2));
	FF3: ffjk port map('0', '0', qsaida(2), qsaida(3));
	
	saida <= qsaida;
	ds: d7s port map(qsaida(3),qsaida(2),qsaida(1),qsaida(0),a,b,c,d,e,f,g);
end contador;
	
