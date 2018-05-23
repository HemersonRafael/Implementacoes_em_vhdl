Library IEEE;
use IEEE.std_logic_1164.all;
Entity d7s IS
Port(w,x,y,z :IN std_logic;
	a : OUT std_logic;
	b : OUT std_logic;
	c : OUT std_logic;
	d : OUT std_logic;
	e : OUT std_logic;
	f : OUT std_logic;
	g : OUT std_logic
	);
End d7s;
Architecture estrutural OF d7s IS
signal h :std_logic;
Begin
a <= not ( w or y or (x xnor z));
b <= not ( (not(x)) or (y xnor z));
c <= not ( x or (not(y)) or z);
d <= not ( w or h or (y and (not(x))) or (y and (not(z))) or (x and (not(y)) and z));
e <= not ( h or (y and (not(z))));
f <= not ( w or ((not(y)) and (not(z))) or ((not(y)) and x) or ( x and (not(z))));
g <= not ( w or (x xor y) or ( x and (not(z))));
h <= not ( ((not(x)) and (not(z))));
End estrutural;
