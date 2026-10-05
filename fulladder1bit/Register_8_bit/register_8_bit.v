library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ==========================================
-- 5. TOP MODULE: 8-BIT REGISTER
-- ==========================================
entity register_8bit is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end register_8bit;

architecture Structural of register_8bit is
    component register_1bit
        Port ( D, Clk, Reset, En : in STD_LOGIC; Q : out STD_LOGIC);
    end component;
begin
    gen_reg: for i in 0 to 7 generate
        reg_inst: register_1bit port map (
            D => D(i),
            Clk => Clk,
            Reset => Reset,
            En => En,
            Q => Q(i)
        );
    end generate;
end Structural;