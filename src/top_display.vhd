----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 03:33:09 PM
-- Design Name: 
-- Module Name: top_display - Behavioral
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

entity top_display is
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
end top_display;

architecture Behavioral of top_display is

component MUX_display is
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
end component;

component multiplex_dec is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           pick_me : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component bin2seg is
    port (
        clear : in    std_logic;                    --! Clear the display
        bin   : in    std_logic_vector(3 downto 0); --! Binary representation of one hexadecimal symbol
        seg   : out   std_logic_vector(6 downto 0)  --! Seven active-low segments from A to G
    );
end component;

signal sig_senzor : std_logic_vector (7 downto 0);
signal sig_dis : std_logic_vector (3 downto 0);

begin

    top_MUX_display : MUX_display
    port map (
       input_0 => senzor_0,
       input_1 => senzor_1,
       input_2 => (others => '0'),
       input_3 => (others => '0'),
       input_4 => (others => '0'),
       input_5 => (others => '0'),
       input_6 => (others => '0'),
       input_7 => (others => '0'),
       pick_me => sw,
       output => sig_senzor
    );

    top_multiplex_dec : multiplex_dec
    port map (
       input => sig_senzor,
       pick_me => clk,
       output => sig_dis
    );
    
    top_bin2seg : bin2seg
    port map (
       clear => '0',
       bin => sig_dis,
       seg(0) => CG,
       seg(1) => CF,
       seg(2) => CE,
       seg(3) => CD,
       seg(4) => CC,
       seg(5) => CB,
       seg(6) => CA
    );
    
    DP <= '1';
    AN (7 downto 2) <= (others => '1');
    AN (0) <= clk;
    AN (1) <= not clk;

end Behavioral;
