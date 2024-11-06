library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity seg_cont is
    port (
        clk_10 : in std_logic;
        A,B,C,D,E,F,G : out std_logic
    );
end entity seg_cont;

architecture seg_cont_arch of seg_cont is
    signal count : integer range 0 to 9 := 0;
begin    
    cont_proc: process(clk_10) is
    begin 
        if(rising_edge(clk_10)) then
            if count = 9 then
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process cont_proc;
 
    -- Seven segment display outputs for numbers 0-9
    -- Active high signals
    A <= '0' when (count = 1 or count = 4) else '1';
    B <= '0' when (count = 5 or count = 6 ) else '1';
    C <= '0' when (count = 2 ) else '1';
    D <= '0' when (count = 1 or count = 4 or count = 7 or count = 9) else '1';
    E <= '1' when (count = 0 or count = 2 or count = 6 or count = 8) else '0';
    F <= '0' when (count = 1 or count = 2 or count = 3 or count = 7) else '1';
    G <= '0' when (count = 1 or count = 7 or count = 0) else '1';

end architecture seg_cont_arch; 