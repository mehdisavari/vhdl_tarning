library ieee;
use ieee.std_logic_1164.all;

entity tarning3 is
port (
	  a,b : in std_logic_vector(3 downto 0);
	  s,c : out std_logic_vector(3 downto 0));
	  
end;

architecture add_ha of tarning3 is
begin

process (a,b)

begin 
for i in 0 to 3 loop
s(i) <= a(i) xor b(i);
c(i) <= a(i) and b(i);
end loop;

end process ;
end;