library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flip_flop is
    Port ( D   : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q   : out STD_LOGIC;
           Q_n : out STD_LOGIC);
end d_flip_flop;

architecture Structural of d_flip_flop is

    component d_latch
        Port ( D      : in  STD_LOGIC;
               ENABLE : in  STD_LOGIC;
               Q      : out STD_LOGIC;
               Q_n    : out STD_LOGIC);
    end component;

    component not_gate
        Port ( A : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    signal clk_n, master_q, master_qn : STD_LOGIC;

begin

    -- Master latch: transparent while CLK=0
    U1: d_latch  port map ( D => D, ENABLE => clk_n, Q => master_q, Q_n => master_qn );

    -- CLK inverter
    U2: not_gate port map ( A => CLK, Y => clk_n );

    -- Slave latch: transparent while CLK=1 (so it captures master's output on the rising edge)
    U3: d_latch  port map ( D => master_q, ENABLE => CLK, Q => Q, Q_n => Q_n );

end Structural;