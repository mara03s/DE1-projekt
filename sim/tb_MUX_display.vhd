-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 15:24:56 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_MUX_display is
end tb_MUX_display;

architecture tb of tb_MUX_display is

    component MUX_display
        port (input_0 : in std_logic_vector (7 downto 0);
              input_1 : in std_logic_vector (7 downto 0);
              input_2 : in std_logic_vector (7 downto 0);
              input_3 : in std_logic_vector (7 downto 0);
              input_4 : in std_logic_vector (7 downto 0);
              input_5 : in std_logic_vector (7 downto 0);
              input_6 : in std_logic_vector (7 downto 0);
              input_7 : in std_logic_vector (7 downto 0);
              pick_me : in std_logic_vector (2 downto 0);
              output  : out std_logic_vector (7 downto 0));
    end component;

    signal input_0 : std_logic_vector (7 downto 0);
    signal input_1 : std_logic_vector (7 downto 0);
    signal input_2 : std_logic_vector (7 downto 0);
    signal input_3 : std_logic_vector (7 downto 0);
    signal input_4 : std_logic_vector (7 downto 0);
    signal input_5 : std_logic_vector (7 downto 0);
    signal input_6 : std_logic_vector (7 downto 0);
    signal input_7 : std_logic_vector (7 downto 0);
    signal pick_me : std_logic_vector (2 downto 0);
    signal output  : std_logic_vector (7 downto 0);

begin

    dut : MUX_display
    port map (input_0 => input_0,
              input_1 => input_1,
              input_2 => input_2,
              input_3 => input_3,
              input_4 => input_4,
              input_5 => input_5,
              input_6 => input_6,
              input_7 => input_7,
              pick_me => pick_me,
              output  => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        input_0 <= (others => '0');
        input_1 <= (others => '1');
        input_2 <= "01010010";
        input_3 <= "11110110";
        input_4 <= "11010110";
        input_5 <= "00010110";
        input_6 <= "01000110";
        input_7 <= "01011110";
        pick_me <= "000";

        -- EDIT Add stimuli here
        wait for 100ns;
        pick_me <= "001";
        wait for 100ns;
        pick_me <= "010";
        wait for 100ns;
        pick_me <= "011";
        wait for 100ns;
        pick_me <= "100";
        wait for 100ns;
        pick_me <= "101";
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_MUX_display of tb_MUX_display is
    for tb
    end for;
end cfg_tb_MUX_display;