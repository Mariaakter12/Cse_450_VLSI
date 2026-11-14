library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-bit ALU. ADD and SUB both use sir's adder_8bit:
--   ADD : ACC + OPERAND
--   SUB : ACC + (NOT OPERAND) + 1   (two's complement, result mod 256)
entity alu is
    Port ( ACC     : in  STD_LOGIC_VECTOR(7 downto 0);
           R       : in  STD_LOGIC_VECTOR(7 downto 0);
           OPERAND : in  STD_LOGIC_VECTOR(7 downto 0);
           ALU_SEL : in  STD_LOGIC_VECTOR(1 downto 0); -- 00 LDI, 01 ADD, 10 SUB, 11 LDR
           RESULT  : out STD_LOGIC_VECTOR(7 downto 0));
end alu;

architecture Structural of alu is
    signal b_in : STD_LOGIC_VECTOR(7 downto 0);
    signal cin  : STD_LOGIC;
    signal sum  : STD_LOGIC_VECTOR(7 downto 0);
begin
    b_in <= not OPERAND when ALU_SEL = "10" else OPERAND;
    cin  <= '1'         when ALU_SEL = "10" else '0';

    U_ADDER : entity work.adder_8bit
        port map ( A => ACC, B => b_in, CIN => cin, SUM => sum, COUT => open );

    process (ALU_SEL, OPERAND, sum, R)
    begin
        case ALU_SEL is
            when "00"   => RESULT <= OPERAND;  -- LDI
            when "01"   => RESULT <= sum;      -- ADD
            when "10"   => RESULT <= sum;      -- SUB
            when others => RESULT <= R;        -- LDR
        end case;
    end process;
end Structural;
