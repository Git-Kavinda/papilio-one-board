library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( 
        LEDs : out STD_LOGIC_VECTOR(7 downto 0);
        clk : in STD_LOGIC
    );
end counter;

architecture counter_arch of counter is
    signal counter : unsigned(7 downto 0) := (others => '0');

    begin
    clk_proc: process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
        end if;
    end process;

    LEDs <= STD_LOGIC_VECTOR(counter);

end counter_arch;
