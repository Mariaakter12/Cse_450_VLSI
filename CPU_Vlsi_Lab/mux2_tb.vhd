library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_tb is
end mux2_tb;

architecture Behavioral of mux2_tb is

    component mux2
        Port ( D0  : in  STD_LOGIC;
               D1  : in  STD_LOGIC;
               SEL : in  STD_LOGIC;
               Y   : out STD_LOGIC);
    end component;

    signal D0_tb, D1_tb, SEL_tb, Y_tb : STD_LOGIC;

begin

    UUT: mux2 port map ( D0 => D0_tb, D1 => D1_tb, SEL => SEL_tb, Y => Y_tb );

    stim_proc: process
    begin
        D0_tb <= '0'; D1_tb <= '0'; SEL_tb <= '0'; wait for 20 ns;
        assert (Y_tb = '0') report "FAIL: SEL=0, D0=0 -> Y/=0" severity error;

        D0_tb <= '1'; D1_tb <= '0'; SEL_tb <= '0'; wait for 20 ns;
        assert (Y_tb = '1') report "FAIL: SEL=0, D0=1 -> Y/=1" severity error;

        D0_tb <= '0'; D1_tb <= '0'; SEL_tb <= '1'; wait for 20 ns;
        assert (Y_tb = '0') report "FAIL: SEL=1, D1=0 -> Y/=0" severity error;

        D0_tb <= '0'; D1_tb <= '1'; SEL_tb <= '1'; wait for 20 ns;
        assert (Y_tb = '1') report "FAIL: SEL=1, D1=1 -> Y/=1" severity error;

        report "PASS: mux2 testbench completed" severity note;
        wait;
    end process;

end Behavioral;