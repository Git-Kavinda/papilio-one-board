library IEEE;
use IEEE.std_logic_1164.all;

entity TEST_LED is
port(
	LED : out std_logic;
	LED1 : out std_logic
	);
end entity;

architecture TEST_LED_Arch of TEST_LED is
begin

LED <= '0';
LED1 <= '1';

end architecture;
