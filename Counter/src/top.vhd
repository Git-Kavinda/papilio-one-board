library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity top is
    port (
        clk, reset : in std_logic;
        A, B, C, D, E, F, G, seg_en : out std_logic;
        LED     : out std_logic_vector(6 downto 0)
    );
end entity top;

architecture top_arch of top is
    component counter is
        port (
            clk : in std_logic;
            reset : in std_logic;
            clk_10 : out std_logic  -- Changed to out
        );
    end component counter;

    component seg_cont is
        port (
            clk_10 : in std_logic;
            A, B, C, D, E, F, G : out std_logic
        );
    end component seg_cont;

    component LED_cont is
        port (
            clk_10  : in std_logic;
            LED     : out std_logic_vector(6 downto 0)
         );
    end component LED_cont;
    
    -- Internal signals
    signal clk_10_internal : std_logic;  -- Renamed signal to avoid multiple drivers
    signal seg_A, seg_B, seg_C, seg_D, seg_E, seg_F, seg_G : std_logic;

begin
    -- Component instantiation with named port mapping
    counter_map : counter 
        port map(
            clk => clk,
            reset => reset,
            clk_10 => clk_10_internal  -- Use the internal signal
        );

    seg_map : seg_cont 
        port map(
            clk_10 => clk_10_internal,  -- Use the internal signal
            A => seg_A,
            B => seg_B,
            C => seg_C,
            D => seg_D,
            E => seg_E,
            F => seg_F,
            G => seg_G
        );

    LED_map : LED_cont 
        port map(
            clk_10 => clk_10_internal,  -- Use the internal signal
            LED => LED
        );

    -- Output assignments with proper inversion
    A <= not seg_A;
    B <= not seg_B;
    C <= not seg_C;
    D <= not seg_D;
    E <= not seg_E;
    F <= not seg_F;
    G <= not seg_G;
    seg_en <= '1';  -- Active low enable signal

end architecture top_arch;
