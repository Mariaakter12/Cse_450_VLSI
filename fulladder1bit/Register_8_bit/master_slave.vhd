

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ==========================================
-- 3. MASTER-SLAVE D FLIP-FLOP
-- ==========================================
entity master_slave_dff is
    Port ( D : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end master_slave_dff;

architecture Structural of master_slave_dff is
    component d_latch
        Port ( D, Enable : in STD_LOGIC; Q, Qbar : out STD_LOGIC);
    end component;
    signal q_master, clk_inv : STD_LOGIC;
begin
    clk_inv <= not Clk;
    Master: d_latch port map (D => D, Enable => Clk, Q => q_master, Qbar => open);
    Slave: d_latch port map (D => q_master, Enable => clk_inv, Q => Q, Qbar => Qbar);
end Structural;

