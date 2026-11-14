library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( OPCODE  : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_SEL : out STD_LOGIC_VECTOR(1 downto 0); -- 00 LDI, 01 ADD, 10 SUB, 11 LDR
           ACC_WE  : out STD_LOGIC;
           R_WE    : out STD_LOGIC;
           Z_WE    : out STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is
begin
    process(OPCODE)
    begin
        -- default = NOP
        ALU_SEL <= "00";
        ACC_WE  <= '0';
        R_WE    <= '0';
        Z_WE    <= '0';
        case OPCODE is
            when "0001" =>  -- LDI
                ALU_SEL <= "00"; ACC_WE <= '1'; Z_WE <= '1';
            when "0010" =>  -- ADD
                ALU_SEL <= "01"; ACC_WE <= '1'; Z_WE <= '1';
            when "0011" =>  -- SUB
                ALU_SEL <= "10"; ACC_WE <= '1'; Z_WE <= '1';
            when "1010" =>  -- STA (R <- ACC, Z unchanged)
                R_WE <= '1';
            when "1011" =>  -- LDR (ACC <- R)
                ALU_SEL <= "11"; ACC_WE <= '1'; Z_WE <= '1';
            when others =>  -- NOP
                null;
        end case;
    end process;
end Behavioral;
