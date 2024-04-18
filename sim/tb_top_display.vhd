library ieee;
use ieee.std_logic_1164.all;

entity tb_top_display is
end tb_top_display;

architecture tb of tb_top_display is

    component top_display
        port (sw       : in std_logic_vector (2 downto 0);
              clk      : in std_logic;
              senzor_0 : in std_logic_vector (7 downto 0);
              senzor_1 : in std_logic_vector (7 downto 0);
              AN       : out std_logic_vector (7 downto 0);
              CA       : out std_logic;
              CB       : out std_logic;
              CC       : out std_logic;
              CD       : out std_logic;
              CE       : out std_logic;
              CF       : out std_logic;
              CG       : out std_logic;
              DP       : out std_logic);
    end component;

    signal sw       : std_logic_vector (2 downto 0);
    signal clk      : std_logic;
    signal senzor_0 : std_logic_vector (7 downto 0);
    signal senzor_1 : std_logic_vector (7 downto 0);
    signal AN       : std_logic_vector (7 downto 0);
    signal CA       : std_logic;
    signal CB       : std_logic;
    signal CC       : std_logic;
    signal CD       : std_logic;
    signal CE       : std_logic;
    signal CF       : std_logic;
    signal CG       : std_logic;
    signal DP       : std_logic;

    constant TbPeriod : time := 50 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_display
    port map (sw       => sw,
              clk      => clk,
              senzor_0 => senzor_0,
              senzor_1 => senzor_1,
              AN       => AN,
              CA       => CA,
              CB       => CB,
              CC       => CC,
              CD       => CD,
              CE       => CE,
              CF       => CF,
              CG       => CG,
              DP       => DP);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sw <= (others => '0');
        senzor_0 <= "00100100";
        senzor_1 <= "10010011";
        wait for 200 ns;
        sw <= "001";
        wait for 200 ns;
        sw <= "100";
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_display of tb_top_display is
    for tb
    end for;
end cfg_tb_top_display;