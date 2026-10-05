library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_4bit is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin   : in  STD_LOGIC;
        SEL   : in  STD_LOGIC_VECTOR(2 downto 0);

        Y     : out STD_LOGIC_VECTOR(3 downto 0);
        Cout  : out STD_LOGIC
    );
end ALU_4bit;


architecture Structural of ALU_4bit is

    signal C1 : STD_LOGIC;
    signal C2 : STD_LOGIC;
    signal C3 : STD_LOGIC;

begin

    --------------------------------------------------
    -- BIT 0
    --------------------------------------------------

    ALU0 : entity work.ALU_1bit
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            SEL  => SEL,
            Y    => Y(0),
            Cout => C1
        );


    --------------------------------------------------
    -- BIT 1
    --------------------------------------------------

    ALU1 : entity work.ALU_1bit
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => C1,
            SEL  => SEL,
            Y    => Y(1),
            Cout => C2
        );


    --------------------------------------------------
    -- BIT 2
    --------------------------------------------------

    ALU2 : entity work.ALU_1bit
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => C2,
            SEL  => SEL,
            Y    => Y(2),
            Cout => C3
        );


    --------------------------------------------------
    -- BIT 3
    --------------------------------------------------

    ALU3 : entity work.ALU_1bit
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => C3,
            SEL  => SEL,
            Y    => Y(3),
            Cout => Cout
        );

end Structural;