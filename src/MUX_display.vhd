----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 05:14:59 PM
-- Design Name: 
-- Module Name: MUX_display - Behavioral
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

entity MUX_display is
    Port ( input_0 : in STD_LOGIC_VECTOR (7 downto 0);
           input_1 : in STD_LOGIC_VECTOR (7 downto 0);
           input_2 : in STD_LOGIC_VECTOR (7 downto 0);
           input_3 : in STD_LOGIC_VECTOR (7 downto 0);
           input_4 : in STD_LOGIC_VECTOR (7 downto 0);
           input_5 : in STD_LOGIC_VECTOR (7 downto 0);
           input_6 : in STD_LOGIC_VECTOR (7 downto 0);
           input_7 : in STD_LOGIC_VECTOR (7 downto 0);
           pick_me : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end MUX_display;

architecture Behavioral of MUX_display is

begin
    process(input_0,input_1,input_2,input_3,input_4,input_5,input_6,input_7, pick_me) is
    begin
    case pick_me is
        when "000" => output <= input_0;
        when "001" => output <= input_1;
        when "010" => output <= input_2;
        when "011" => output <= input_3;
        when "100" => output <= input_4;
        when "101" => output <= input_5;
        when "110" => output <= input_6;
        when "111" => output <= input_7;
        when others => output <= (others => '0');
    end case;
    end process;

end Behavioral;
