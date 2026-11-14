library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ACC and R are instances of sir's register_8bit (sync reset, load enable).
-- Z flag is separate because it must reset to '1' (register_1bit resets to '0').
entity acc_r_z is
    Port ( CLK     : in  STD_LOGIC;
           RESET   : in  STD_LOGIC;
           ALU_RES : in  STD_LOGIC_VECTOR(7 downto 0);
           ACC_WE  : in  STD_LOGIC;
           R_WE    : in  STD_LOGIC;
           Z_WE    : in  STD_LOGIC;
           ACC_OUT : out STD_LOGIC_VECTOR(7 downto 0);
           R_OUT   : out STD_LOGIC_VECTOR(7 downto 0);
           Z_OUT   : out STD_LOGIC);
end acc_r_z;

architecture Structural of acc_r_z is
    signal acc_s : STD_LOGIC_VECTOR(7 downto 0);
    signal r_s   : STD_LOGIC_VECTOR(7 downto 0);
    signal z_q   : STD_LOGIC := '1';
begin
    U_ACC : entity work.register_8bit
        port map ( CLK => CLK, RESET => RESET, LOAD => ACC_WE, D => ALU_RES, Q => acc_s );

    -- STA: R <- ACC
    U_R : entity work.register_8bit
        port map ( CLK => CLK, RESET => RESET, LOAD => R_WE, D => acc_s, Q => r_s );

    process (CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                z_q <= '1';
            elsif Z_WE = '1' then
                if ALU_RES = "00000000" then z_q <= '1'; else z_q <= '0'; end if;
            end if;
        end if;
    end process;

    ACC_OUT <= acc_s;
    R_OUT   <= r_s;
    Z_OUT   <= z_q;
end Structural;
