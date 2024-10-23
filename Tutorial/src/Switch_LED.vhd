library IEEE;
use IEEE.std_logic_1164.all;

entity Switch_LED is
    port(
        switch  : in std_logic_vector(7 downto 0);
        led     : out std_logic_vector(7 downto 0)
    );
end entity;

architecture arch_switch_led of Switch_LED is

begin
    led <= switch;
end arch_switch_led;