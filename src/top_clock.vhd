----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 04:17:37 PM
-- Design Name: 
-- Module Name: top_clock - Behavioral
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

entity top_clock is
    Port ( CLK100MHZ : in STD_LOGIC;
           clk_display : out STD_LOGIC;
           clk_meter : out STD_LOGIC;
           clk_trigger : out STD_LOGIC);
end top_clock;

architecture Behavioral of top_clock is

component  clock_trigger is
    generic (
        PERIOD : integer --! Default number of clk periodes to generate one pulse
    );
    port (
        clk   : in    std_logic; --! Main clock
        rst   : in    std_logic; --! High-active synchronous reset
        pulse : out   std_logic  --! Clock enable pulse signal
    );
end component;

component clock_unenable is
    generic (
        PERIOD : integer --! Default number of clk periodes to generate one pulse
    );
    port (
        clk   : in    std_logic; --! Main clock
        rst   : in    std_logic; --! High-active synchronous reset
        pulse : out   std_logic  --! Clock enable pulse signal
    );
end component;

component  simple_counter is
    generic (
        NBIT : integer --! Number of bits
    );
    port (
        clk   : in    std_logic;                          --! Main clock
        rst   : in    std_logic;                          --! High-active synchronous reset
        en    : in    std_logic;                          --! Clock enable input
        count : out   std_logic_vector(NBIT - 1 downto 0) --! Counter value
    );
end component ;

signal sig_multiplex : std_logic;

begin

top_clock_trigger : clock_trigger
generic map (
   PERIOD => 200000000
)
port map (
   clk => CLK100MHZ ,
   rst => '0',
   pulse => clk_trigger
);

clock_10ms : clock_unenable
generic map (
   PERIOD => 1000000
)
port map (
   clk => CLK100MHZ ,
   rst => '0',
   pulse => sig_multiplex
);

clock_58us : clock_unenable
generic map (
   PERIOD => 5800
)
port map (
   clk => CLK100MHZ ,
   rst => '0',
   pulse => clk_meter
);

top_simple_counter : simple_counter
generic map (
   NBIT => 1
)
port map (
   clk => sig_multiplex,
   rst => '0',
   en => '1',
   count(0) => clk_display 
);		

end Behavioral;