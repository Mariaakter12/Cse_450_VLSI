library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8bit_tb is
end full_adder_8bit_tb;

architecture Behavioral of full_adder_8bit_tb is

    component full_adder_8bit
        Port ( A    : in  STD_LOGIC_VECTOR (7 downto 0);
               B    : in  STD_LOGIC_VECTOR (7 downto 0);
               CIN  : in  STD_LOGIC;
               SUM  : out STD_LOGIC_VECTOR (7 downto 0);
               COUT : out STD_LOGIC);
    end component;

    signal A_tb    : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal B_tb    : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal CIN_tb  : STD_LOGIC := '0';
    signal SUM_tb  : STD_LOGIC_VECTOR (7 downto 0);
    signal COUT_tb : STD_LOGIC;

begin

    UUT: full_adder_8bit port map (
        A    => A_tb,
        B    => B_tb,
        CIN  => CIN_tb,
        SUM  => SUM_tb,
        COUT => COUT_tb
    );

    stim_proc: process
    begin
        -- Step 1: 5 + 3 = 8 (Easy to see)
        A_tb <= "00000101"; B_tb <= "00000011"; CIN_tb <= '0'; wait for 100 ns;

        -- Step 2: 10 + 20 = 30
        A_tb <= "00001010"; B_tb <= "00010100"; CIN_tb <= '0'; wait for 100 ns;

        -- Step 3: 15 + 15 + 1 (CIN) = 31
        A_tb <= "00001111"; B_tb <= "00001111"; CIN_tb <= '1'; wait for 100 ns;

        -- Step 4: 50 + 50 = 100
        A_tb <= "00110010"; B_tb <= "00110010"; CIN_tb <= '0'; wait for 100 ns;

        wait;
    end process;

end Behavioral;