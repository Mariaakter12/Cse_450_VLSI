library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is

    component half_adder
        Port ( A     : in  STD_LOGIC;
               B     : in  STD_LOGIC;
               SUM   : out STD_LOGIC;
               COUT  : out STD_LOGIC);
    end component;

    signal A_tb, B_tb, SUM_tb, COUT_tb : STD_LOGIC;

begin

    UUT: half_adder port map ( A => A_tb, B => B_tb, SUM => SUM_tb, COUT => COUT_tb );

    stim_proc: process
    begin
        A_tb <= '0'; B_tb <= '0'; wait for 20 ns;
        assert (SUM_tb = '0' and COUT_tb = '0') report "FAIL: 0+0" severity error;

        A_tb <= '0'; B_tb <= '1'; wait for 20 ns;
        assert (SUM_tb = '1' and COUT_tb = '0') report "FAIL: 0+1" severity error;

        A_tb <= '1'; B_tb <= '0'; wait for 20 ns;
        assert (SUM_tb = '1' and COUT_tb = '0') report "FAIL: 1+0" severity error;

        A_tb <= '1'; B_tb <= '1'; wait for 20 ns;
        assert (SUM_tb = '0' and COUT_tb = '1') report "FAIL: 1+1" severity error;

        report "PASS: half_adder testbench completed" severity note;
        wait;
    end process;

end Behavioral;