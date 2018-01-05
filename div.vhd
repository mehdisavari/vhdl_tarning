library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div is
    port(
        a:     in std_logic_vector(3 downto 0);
        b:     in std_logic_vector(3 downto 0);
        errorsig:     out std_logic := '0';
        baghi:   out std_logic_vector(3 downto 0);
        result:  out std_logic_vector(3 downto 0)
    );
end div;

architecture divdiv of div is

begin

UNLABELED:
    process(a,b)
        variable quotient:  unsigned (3 downto 0);
        variable remainder: unsigned (3 downto 0);
    begin  
        errorsig <= '0';      
        if b = "0000" then
            assert  b /= "0000"
               
                severity ERROR;
            errorsig <= '1';
        else 
            quotient := (others => '0'); 
            remainder := (others => '0');
           for i in 3 downto 0 loop  
               remainder := remainder (2 downto 0) & '0';   
               remainder(0) := a(i);       
               if remainder >= unsigned(b) then  
                    remainder := remainder - unsigned(b);
                    quotient(i) := '1';
               end if;
            end loop;
            result <= std_logic_vector(quotient); -- ÌæÇÈ ÊÞÓíã
            baghi  <= std_logic_vector(remainder); -- ÈÇÞí ãÇäÏå
        end if;
    end process;

end architecture divdiv;

library ieee;
use ieee.std_logic_1164.all;

entity div_tb is
end entity;

architecture foo of div_tb is
    signal a:    std_logic_vector (3 downto 0) := (others => '0');
    signal b:    std_logic_vector (3 downto 0) := (others => '1');
    signal errorsig:    std_logic;
    signal baghi:  std_logic_vector (3 downto 0);  -- ÈÇÞí ãÇäÏå ÊÞÓíÓã
    signal result: std_logic_vector (3 downto 0);  -- ÌæÇÈ ÊÞÓíã
begin
DUT:
    entity work.div
        port map (
            a => a,
            b => b,
            errorsig => errorsig,
            baghi => baghi,
            result => result
        );
STIMULUS:
    process
    begin
        a <= "1000";  -- 8
        b <= "0010";  -- 2
        wait for 20 ns;
        b <= "0100";  -- 4
        wait for 20 ns;    
        b <= "1000";  -- 8
        wait for 20 ns;
        a <= "1111";  -- 15
        b <= "0011";  -- 3
        wait for 20 ns;
        b <= (others => '0');
        wait for 20 ns;
        a <= "1101";  -- 13
        b <= "0111";  -- 7
        wait for 20 ns;
        wait;
    end process;
end architecture;