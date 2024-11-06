library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    port (
        clk : in std_logic;
        reset : in std_logic;
        clk_10 : out std_logic
    );
end entity counter;

architecture counter_arch of counter is
    signal reg : std_logic_vector(23 downto 0);
	signal clk_10_signal : std_logic;

begin 

    count_proc: process(clk, reset) is
    begin
        if reset = '1' then 
            reg <= (others => '0');
        elsif rising_edge(clk) then 
            reg <= std_logic_vector(unsigned(reg) + 1);
        end if;
    end process count_proc;
    
    gen_process: process(reg) is
    begin
        if reg = "001100001101010000000000" then 
            clk_10_signal <= not clk_10_signal;
        end if;
    end process gen_process;
	
	clk_10 <= clk_10_signal;
	 
end architecture counter_arch;