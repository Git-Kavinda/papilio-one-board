library IEEE;
use IEEE.std_logic_1164.all;

entity LED_cont is 
port(
    clk_10  : in std_logic;
    LED     : out std_logic_vector(6 downto 0)
 );
end entity LED_cont;

architecture LED_cont_arch of LED_cont is
    signal temp : std_logic_vector(6 downto 0) := "0000001";

    begin
        ctrl_proc: process(clk_10) is
            begin
                if(rising_edge(clk_10)) then 
                    temp <= temp(5 downto 0) & temp(6);
                end if;
        end process ctrl_proc;

        LED <= temp;

end architecture LED_cont_arch;