library ieee;
use ieee.std_logic_1164.all;

entity tb_top_clock is
end tb_top_clock;

architecture tb of tb_top_clock is

    component top_clock
        port (CLK100MHZ   : in std_logic;
              clk_display : out std_logic;
              clk_meter   : out std_logic;
              clk_trigger : out std_logic);
    end component;

    signal CLK100MHZ   : std_logic;
    signal clk_display : std_logic;
    signal clk_meter   : std_logic;
    signal clk_trigger : std_logic;

    constant TbPeriod : time := 100 ps; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_clock
    port map (CLK100MHZ   => CLK100MHZ,
              clk_display => clk_display,
              clk_meter   => clk_meter,
              clk_trigger => clk_trigger);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK100MHZ is really your main clock signal
    CLK100MHZ <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- EDIT Add stimuli here
        wait for 10000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_clock of tb_top_clock is
    for tb
    end for;
end cfg_tb_top_clock;
