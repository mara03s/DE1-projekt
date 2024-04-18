----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2024 06:02:03 PM
-- Design Name: 
-- Module Name: clock_enable - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_enable is
    generic(
        PERIOD: integer := 10
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in std_logic;
           pulse : out STD_LOGIC;
           sig_c : out std_logic_vector (3 downto 0));
end clock_enable;

architecture Behavioral of clock_enable is

constant BITS_NEEDED: integer := integer(ceil(log2(real(PERIOD+1))));
signal sig_count: std_logic_vector (BITS_NEEDED-1 downto 0);

begin

    --! Generate clock enable signal. By default, enable signal
    --! is low and generated pulse is always one clock long.
    p_clk_enable : process (clk) is
    begin
        sig_c <= sig_count;
        -- Synchronous proces;
        if (rising_edge(clk)) then
           if (rst='1') then
                sig_count <= (others => '0');
                -- Clear all bits of local counter
                pulse <= '0';
                -- Set output `pulse` to low
            elsif (en='0') then
                pulse <= '0';
            elsif (sig_count = PERIOD-2) then
            -- elsif sig_count is PERIOD-1 then
                -- Clear all bits of local counter
                -- Set output `pulse` to high
                pulse <= '1';
                sig_count <= sig_count + 1;
            elsif (sig_count = PERIOD-1) then
                sig_count <= (others => '0');
                pulse <= '0';
            else
            -- else
                -- Increment local counter
                sig_count <= sig_count + 1;
                -- Set output `pulse` to low
                pulse <= '0';

            -- Each `if` must end by `end if`
        end if;
      end if;

    end process p_clk_enable;

end architecture behavioral;