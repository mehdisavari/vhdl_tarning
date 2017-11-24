library ieee;
use ieee.std_logic_1164.all;

entity tarning1 is 
port (a,b,c,d :in std_logic_vector(3 downto 0);
	  s :in std_logic_vector(1 downto 0) ;
	  g : out std_logic_vector(3 downto 0));
end;

architecture mux4to1 of tarning1 is 

begin 
g <= a when s="00" else
	b when s="01" else
	c when s="10" else
	d;
end ;