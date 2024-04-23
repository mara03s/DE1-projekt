----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2024 05:09:37 PM
-- Design Name: 
-- Module Name: simple_counter - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_counter is
    generic(
    N: integer := 1
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR ((N-1) downto 0));
end simple_counter;

architecture Behavioral of simple_counter is

signal sig_count: STD_LOGIC_VECTOR ((N-1) downto 0);

begin

process (clk)
begin
   if rising_edge(clk) then
      if rst='1' then
         sig_count <= (others => '0');
      elsif en='1' then
         sig_count <= sig_count + 1;
      end if;
   end if;
end process;

count <= sig_count;

end Behavioral;
