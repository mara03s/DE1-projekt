-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.3.2024 17:22:07 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_enable is
end tb_clock_enable;

architecture tb of tb_clock_enable is

    component clock_enable
        port (clk   : in std_logic;
              rst   : in std_logic;
              en    : in std_logic;
              pulse : out std_logic;
              sig_c : out std_logic_vector (3 downto 0));
    end component;

    signal clk   : std_logic;
    signal rst   : std_logic;
    signal en    : std_logic;
    signal pulse : std_logic;
    signal sig_c : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 50 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : clock_enable
    port map (clk   => clk,
              rst   => rst,
              en    => en,
              pulse => pulse,
              sig_c => sig_c);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        en <= '0';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;
        en <= '1';

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_clock_enable of tb_clock_enable is
    for tb
    end for;
end cfg_tb_clock_enable;