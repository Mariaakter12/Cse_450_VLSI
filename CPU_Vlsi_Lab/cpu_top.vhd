library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port ( CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q     : out STD_LOGIC_VECTOR(7 downto 0);  -- ACC
           Z     : out STD_LOGIC;
           PC    : out STD_LOGIC_VECTOR(3 downto 0);
           R     : out STD_LOGIC_VECTOR(7 downto 0)); -- extra, for waveform checking
end cpu_top;

architecture Structural of cpu_top is
    signal pc_s    : std_logic_vector(3 downto 0);
    signal instr   : std_logic_vector(11 downto 0);
    signal alu_sel : std_logic_vector(1 downto 0);
    signal acc_we, r_we, z_we : std_logic;
    signal acc_s, r_s, res_s  : std_logic_vector(7 downto 0);
begin
    U_PC  : entity work.pc          port map (CLK, RESET, pc_s);
    U_ROM : entity work.program_rom port map (pc_s, instr);
    U_CU  : entity work.control_unit port map (instr(11 downto 8), alu_sel, acc_we, r_we, z_we);
    U_ALU : entity work.alu         port map (acc_s, r_s, instr(7 downto 0), alu_sel, res_s);
    U_REG : entity work.acc_r_z     port map (CLK, RESET, res_s, acc_we, r_we, z_we, acc_s, r_s, Z);

    Q  <= acc_s;
    R  <= r_s;
    PC <= pc_s;
end Structural;
