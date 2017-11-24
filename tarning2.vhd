library ieee;
use ieee.std_logic_1164.all;

entity tarning2 is
port (
	  a,b : in std_logic_vector(3 downto 0);
	  s : out std_logic_vector(3 downto 0);
	  cout : out std_logic );
end;

architecture add of tarning2 is
begin

process (a,b)
variable c : std_logic_vector (4 downto 0);
variable k : std_logic;
begin 
for i in 0 to 3 loop
s(i) <= a(i) xor b(i) xor c(i);
c(i+1) := (a(i) and b(i)) or (a(i) and k) or (b(i) and k);
end loop;

cout <= c(4);
end process ;
end;