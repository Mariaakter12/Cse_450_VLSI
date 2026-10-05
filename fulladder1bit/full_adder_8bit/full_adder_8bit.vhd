library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_8bit is
    Port ( A    : in  STD_LOGIC_VECTOR (7 downto 0);
           B    : in  STD_LOGIC_VECTOR (7 downto 0);
           CIN  : in  STD_LOGIC;
           SUM  : out STD_LOGIC_VECTOR (7 downto 0);
           COUT : out STD_LOGIC);
end full_adder_8bit;

architecture Behavioral of full_adder_8bit is
    signal temp_sum : STD_LOGIC_VECTOR (8 downto 0);
begin
    -- 8-bit Input + 1-bit Carry Input ke 9-bit vector-e add kora hocche
    temp_sum <= ('0' & A) + ('0' & B) + CIN;
    
    -- Bottom 8 bits (0 to 7) holo SUM
    SUM  <= temp_sum(7 downto 0);
    
    -- 9th bit (index 8) holo Carry Out (COUT)
    COUT <= temp_sum(8);
end Behavioral;