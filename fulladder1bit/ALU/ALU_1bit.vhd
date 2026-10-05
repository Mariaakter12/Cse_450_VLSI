library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1bit is
    Port (
        A       : in  STD_LOGIC;
        B       : in  STD_LOGIC;
        Cin     : in  STD_LOGIC;
        SEL     : in  STD_LOGIC_VECTOR(2 downto 0);
        Y       : out STD_LOGIC;
        Cout    : out STD_LOGIC
    );
end ALU_1bit;


architecture Structural of ALU_1bit is

    signal AND_OUT  : STD_LOGIC;
    signal OR_OUT   : STD_LOGIC;
    signal XOR_OUT  : STD_LOGIC;
    signal NOR_OUT  : STD_LOGIC;
    signal NOT_OUT  : STD_LOGIC;

    signal SUM      : STD_LOGIC;
    signal ADD_COUT : STD_LOGIC;

    signal MUX_OUT  : STD_LOGIC;

    signal B_XOR_SUB : STD_LOGIC;
    signal SUB_MODE  : STD_LOGIC;

begin

    --------------------------------------------------
    -- LOGIC GATES
    --------------------------------------------------

    AND_OUT <= A and B;

    OR_OUT <= A or B;

    XOR_OUT <= A xor B;

    NOR_OUT <= not (A or B);

    NOT_OUT <= not A;


    --------------------------------------------------
    -- SUBTRACT MODE
    -- SEL = 110
    --------------------------------------------------

    SUB_MODE <= SEL(2) and SEL(1) and (not SEL(0));

    B_XOR_SUB <= B xor SUB_MODE;


    --------------------------------------------------
    -- FULL ADDER
    --------------------------------------------------

    SUM <= A xor B_XOR_SUB xor Cin;

    ADD_COUT <= (A and B_XOR_SUB)
                or (A and Cin)
                or (B_XOR_SUB and Cin);


    --------------------------------------------------
    -- OPERATION MUX
    --------------------------------------------------

    process(
        SEL,
        AND_OUT,
        OR_OUT,
        XOR_OUT,
        NOR_OUT,
        NOT_OUT,
        SUM
    )
    begin

        case SEL is

            when "000" =>
                MUX_OUT <= AND_OUT;

            when "001" =>
                MUX_OUT <= OR_OUT;

            when "010" =>
                MUX_OUT <= XOR_OUT;

            when "011" =>
                MUX_OUT <= NOR_OUT;

            when "100" =>
                MUX_OUT <= NOT_OUT;

            when "101" =>
                MUX_OUT <= SUM;

            when "110" =>
                MUX_OUT <= SUM;

            when others =>
                MUX_OUT <= '0';

        end case;

    end process;


    --------------------------------------------------
    -- OUTPUT
    --------------------------------------------------

    Y <= MUX_OUT;

    Cout <= ADD_COUT;

end Structural;