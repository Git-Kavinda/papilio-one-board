library IEEE;
use IEEE.std_logic_1164.all;

entity TEST_LED is
port(
	Switch : in std_logic_vector(7 downto 0);
	LED : out std_logic_vector(7 downto 0)
	);
end entity;

architecture TEST_LED_Arch of TEST_LED is
begin

LED <= Switch;

end architecture;
