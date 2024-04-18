----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 05:40:29 PM
-- Design Name: 
-- Module Name: multiplex_dec - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplex_dec is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           pick_me : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end multiplex_dec;

architecture Behavioral of multiplex_dec is

begin
process (input, pick_me) is
    begin
        case pick_me is
            when '0' => output <= input (3 downto 0);
            when '1' => output <= input (7 downto 4);
            when others => output <= (others => '0');
        end case;
    end process;

end Behavioral;
