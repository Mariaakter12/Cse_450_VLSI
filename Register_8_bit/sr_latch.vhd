library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ==========================================
-- 1. SR LATCH MODULE
-- ==========================================
entity sr_latch is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end sr_latch;

architecture Behavioral of sr_latch is
    signal q_int, qbar_int : STD_LOGIC := '0';
begin
    q_int <= S nor qbar_int;
    qbar_int <= R nor q_int;
    Q <= q_int;
    Qbar <= qbar_int;
end Behavioral;

