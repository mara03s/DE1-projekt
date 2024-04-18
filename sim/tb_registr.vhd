-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 16:04:58 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_registr is
end tb_registr;

architecture tb of tb_registr is

    component registr
        port (input  : in std_logic_vector (7 downto 0);
              naber  : in std_logic;
              output : out std_logic_vector (7 downto 0));
    end component;

    signal input  : std_logic_vector (7 downto 0);
    signal naber  : std_logic;
    signal output : std_logic_vector (7 downto 0);

begin

    dut : registr
    port map (input  => input,
              naber  => naber,
              output => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        input <= (others => '1');
        naber <= '0';
        wait for 200ns;
        naber <= '1';
        wait for 50ns;
        naber <= '0';
        wait for 200ns;
        input <= "10101010";
        wait for 200ns;
        naber <= '1';
        wait for 50ns;
        naber <= '0';
        input <= "10111010";
        wait for 200ns;
        naber <= '1';
        wait for 50ns;
        naber <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_registr of tb_registr is
    for tb
    end for;
end cfg_tb_registr;
