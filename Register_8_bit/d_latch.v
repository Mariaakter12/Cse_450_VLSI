library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ==========================================
-- 2. D FLIP-FLOP (Gated SR Latch based)
-- ==========================================
entity d_latch is
    Port ( D : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end d_latch;

architecture Structural of d_latch is
    component sr_latch
        Port ( S, R : in STD_LOGIC; Q, Qbar : out STD_LOGIC);
    end component;
    signal s_s, r_s : STD_LOGIC;
begin
    s_s <= D and Enable;
    r_s <= (not D) and Enable;
    sr_inst: sr_latch port map (S => s_s, R => r_s, Q => Q, Qbar => Qbar);
end Structural;