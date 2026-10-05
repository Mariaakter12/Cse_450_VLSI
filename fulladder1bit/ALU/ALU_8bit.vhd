library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_8bit is
    Port (
        A     : in  STD_LOGIC_VECTOR(7 downto 0);
        B     : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin   : in  STD_LOGIC;
        SEL   : in  STD_LOGIC_VECTOR(2 downto 0);

        Y     : out STD_LOGIC_VECTOR(7 downto 0);
        Cout  : out STD_LOGIC
    );
end ALU_8bit;


architecture Structural of ALU_8bit is

    signal CARRY_LOW : STD_LOGIC;

begin

    --------------------------------------------------
    -- LOWER 4-BIT ALU
    --------------------------------------------------

    ALU_LOW : entity work.ALU_4bit
        port map (
            A    => A(3 downto 0),
            B    => B(3 downto 0),
            Cin  => Cin,
            SEL  => SEL,
            Y    => Y(3 downto 0),
            Cout => CARRY_LOW
        );


    --------------------------------------------------
    -- UPPER 4-BIT ALU
    --------------------------------------------------

    ALU_HIGH : entity work.ALU_4bit
        port map (
            A    => A(7 downto 4),
            B    => B(7 downto 4),
            Cin  => CARRY_LOW,
            SEL  => SEL,
            Y    => Y(7 downto 4),
            Cout => Cout
        );

end Structural;