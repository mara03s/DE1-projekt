-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 15:44:48 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplex_dec is
end tb_multiplex_dec;

architecture tb of tb_multiplex_dec is

    component multiplex_dec
        port (input   : in std_logic_vector (7 downto 0);
              pick_me : in std_logic;
              output  : out std_logic_vector (3 downto 0));
    end component;

    signal input   : std_logic_vector (7 downto 0);
    signal pick_me : std_logic;
    signal output  : std_logic_vector (3 downto 0);

begin

    dut : multiplex_dec
    port map (input   => input,
              pick_me => pick_me,
              output  => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        input <= "10100101";
        pick_me <= '0';
        wait for 200ns;
        pick_me <= '1';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_multiplex_dec of tb_multiplex_dec is
    for tb
    end for;
end cfg_tb_multiplex_dec;
