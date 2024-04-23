----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 04:50:05 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( CLK100MHZ : in STD_LOGIC;
           JA : in STD_LOGIC_VECTOR (2 downto 1);
           JB : out STD_LOGIC_VECTOR (2 downto 1);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (10 downto 0);
           LED : out STD_LOGIC_VECTOR (1 downto 0));
end top_level;

architecture Behavioral of top_level is

component  top_clock is
    Port ( CLK100MHZ : in STD_LOGIC;
           clk_display : out STD_LOGIC;
           clk_meter : out STD_LOGIC;
           clk_trigger : out STD_LOGIC);
end component;

component  top_display is
    Port ( sw : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           senzor_0 : in STD_LOGIC_VECTOR (7 downto 0);
           senzor_1 : in STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC);
end component;

component top_registr is
    Port (echo : in std_logic;
          input : in std_logic_vector (7 downto 0);
          CLK100MHZ : in STD_LOGIC;
          led : out std_logic;
          clk : in std_logic;
          rst : in std_logic;
          count : out std_logic_vector (7 downto 0));
end component;

signal sig_display : std_logic;
signal sig_meter : std_logic;
signal sig_trig : std_logic;

signal sig_count_0 : std_logic_vector (7 downto 0);
signal sig_count_1 : std_logic_vector (7 downto 0);

begin

clock : top_clock
port map (
   CLK100MHZ => CLK100MHZ,
   clk_display => sig_display,
   clk_meter => sig_meter,
   clk_trigger => sig_trig
);

senzor0 : top_registr
port map (
   echo => JA(1),
   input => SW(7 downto 0),
   CLK100MHZ => CLK100MHZ,
   led => LED(0),
   clk => sig_meter,
   rst => sig_trig,
   count => sig_count_0
);

senzor1 : top_registr
port map (
   echo => JA(2),
   input => SW(7 downto 0),
   led => LED(1),
   clk => sig_meter,
   CLK100MHZ => CLK100MHZ,
   rst => sig_trig,
   count => sig_count_1
);

display : top_display
port map (
   sw => SW(10 downto 8),
   clk => sig_display,
   senzor_0 => sig_count_0,
   senzor_1 => sig_count_1,
   AN => AN,
   CA => CA,
   CB => CB,
   CC => CC,
   CD => CD,
   CE => CE,
   CF => CF,
   CG => CG,
   DP => DP
);

JB(1) <= sig_trig;
JB(2) <= sig_trig;

end Behavioral;
