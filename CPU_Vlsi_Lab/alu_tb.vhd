library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end alu_tb;

architecture Sim of alu_tb is
    signal ACC, R, OPERAND, RESULT : std_logic_vector(7 downto 0) := (others => '0');
    signal ALU_SEL : std_logic_vector(1 downto 0) := "00";

    procedure check(exp : in std_logic_vector(7 downto 0);
                    signal res : in std_logic_vector(7 downto 0);
                    name : in string) is
    begin
        assert res = exp report "ALU mismatch: " & name severity error;
    end procedure;
begin
    DUT : entity work.alu port map (ACC, R, OPERAND, ALU_SEL, RESULT);

    process
    begin
        -- LDI : RESULT = OPERAND
        ACC <= x"11"; R <= x"22"; OPERAND <= x"64"; ALU_SEL <= "00";
        wait for 10 ns; check(x"64", RESULT, "LDI 0x64");

        -- ADD : 0x50 + 0x0A = 0x5A
        ACC <= x"50"; OPERAND <= x"0A"; ALU_SEL <= "01";
        wait for 10 ns; check(x"5A", RESULT, "ADD 0x50 + 0x0A");

        -- SUB : 0x64 - 0x14 = 0x50
        ACC <= x"64"; OPERAND <= x"14"; ALU_SEL <= "10";
        wait for 10 ns; check(x"50", RESULT, "SUB 0x64 - 0x14");

        -- SUB giving zero : 0x5A - 0x5A = 0x00
        ACC <= x"5A"; OPERAND <= x"5A"; ALU_SEL <= "10";
        wait for 10 ns; check(x"00", RESULT, "SUB 0x5A - 0x5A");

        -- SUB with wrap-around : 0x5A - 0x60 = 0xFA
        ACC <= x"5A"; OPERAND <= x"60"; ALU_SEL <= "10";
        wait for 10 ns; check(x"FA", RESULT, "SUB 0x5A - 0x60");

        -- LDR : RESULT = R
        ACC <= x"00"; R <= x"5A"; OPERAND <= x"00"; ALU_SEL <= "11";
        wait for 10 ns; check(x"5A", RESULT, "LDR");

        report "ALU testbench finished." severity note;
        wait;
    end process;
end Sim;
