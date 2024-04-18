----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 05:52:04 PM
-- Design Name: 
-- Module Name: registr - Behavioral
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
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registr is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           naber : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end registr;

architecture Behavioral of registr is

begin

--  <-----Cut code below this line and paste into the architecture body---->

   -- LDCE: Transparent latch with Asynchronous Reset and
   --        Gate Enable.
   --        Artix-7
   -- Xilinx HDL Language Template, version 2020.2

   LDCE_0 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(0),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(0),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_1 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(1),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(1),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_2 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(2),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(2),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_3 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(3),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(3),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_4 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(4),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(4),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_5 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(5),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(5),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_6 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(6),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(6),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );
   LDCE_7 : LDCE
   generic map (
      INIT => '0') -- Initial value of latch ('0' or '1')  
   port map (
      Q => output(7),      -- Data output
      CLR => '0',  -- Asynchronous clear/reset input
      D => input(7),      -- Data input
      G => naber,      -- Gate input
      GE => '1'     -- Gate enable input
   );

end Behavioral;
