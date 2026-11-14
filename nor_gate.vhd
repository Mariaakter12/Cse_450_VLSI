library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out STD_LOGIC);
end nor_gate;

architecture Structural of nor_gate is

    component or_gate
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    component not_gate
        Port ( A : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    signal or_out : STD_LOGIC;

begin

    U1: or_gate  port map ( A => A, B => B, Y => or_out );
    U2: not_gate port map ( A => or_out, Y => Y );

end Structural;