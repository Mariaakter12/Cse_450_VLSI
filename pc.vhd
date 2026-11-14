library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 4-bit program counter. Uses sir's adder_4bit as the PC+1 incrementer.
entity pc is
    Port ( CLK    : in  STD_LOGIC;
           RESET  : in  STD_LOGIC;   -- synchronous, active-high
           PC_OUT : out STD_LOGIC_VECTOR(3 downto 0));
end pc;

architecture Structural of pc is
    signal pc_q    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal pc_next : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- PC + 1  (no JZ in Set 8, so PC always increments)
    U_INC : entity work.adder_4bit
        port map ( A => pc_q, B => "0001", CIN => '0',
                   SUM => pc_next, COUT => open );

    process (CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                pc_q <= "0000";
            else
                pc_q <= pc_next;
            end if;
        end if;
    end process;

    PC_OUT <= pc_q;
end Structural;
