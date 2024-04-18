library ieee;
use ieee.std_logic_1164.all;

entity tb_top_registr is
end tb_top_registr;

architecture tb of tb_top_registr is

    component top_registr
        port (echo  : in std_logic;
              input : in std_logic_vector (7 downto 0);
              led   : out std_logic;
              clk   : in std_logic;
              rst   : in std_logic;
              count : out std_logic_vector (7 downto 0));
    end component;

    signal echo  : std_logic;
    signal input : std_logic_vector (7 downto 0);
    signal led   : std_logic;
    signal clk   : std_logic;
    signal rst   : std_logic;
    signal count : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_registr
    port map (echo  => echo,
              input => input,
              led   => led,
              clk   => clk,
              rst   => rst,
              count => count);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        echo <= '0';
        input <= "00101000";

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;
        echo <= '1';
        wait for 300 ns;
        echo <= '0';
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_registr of tb_top_registr is
    for tb
    end for;
end cfg_tb_top_registr;
