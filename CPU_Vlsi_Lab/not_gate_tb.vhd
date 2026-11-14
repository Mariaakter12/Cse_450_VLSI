library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate_tb is
end not_gate_tb;

architecture Behavioral of not_gate_tb is

    component not_gate
        Port ( A : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    signal A_tb, Y_tb : STD_LOGIC;

begin

    UUT: not_gate port map ( A => A_tb, Y => Y_tb );

    stim_proc: process
    begin
        A_tb <= '0'; wait for 20 ns;
        assert (Y_tb = '1') report "FAIL: NOT(0) /= 1" severity error;

        A_tb <= '1'; wait for 20 ns;
        assert (Y_tb = '0') report "FAIL: NOT(1) /= 0" severity error;

        report "PASS: not_gate testbench completed" severity note;
        wait;
    end process;

end Behavioral;