library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_tb is
end mux4_tb;

architecture Behavioral of mux4_tb is

    component mux4
        Port ( D0  : in  STD_LOGIC;
               D1  : in  STD_LOGIC;
               D2  : in  STD_LOGIC;
               D3  : in  STD_LOGIC;
               SEL : in  STD_LOGIC_VECTOR (1 downto 0);
               Y   : out STD_LOGIC);
    end component;

    signal D0_tb, D1_tb, D2_tb, D3_tb, Y_tb : STD_LOGIC;
    signal SEL_tb : STD_LOGIC_VECTOR (1 downto 0);

begin

    UUT: mux4 port map ( D0 => D0_tb, D1 => D1_tb, D2 => D2_tb, D3 => D3_tb,
                          SEL => SEL_tb, Y => Y_tb );

    stim_proc: process
    begin
        -- Distinct data values so each select clearly picks its own line
        D0_tb <= '0'; D1_tb <= '1'; D2_tb <= '0'; D3_tb <= '1';

        SEL_tb <= "00"; wait for 20 ns;
        assert (Y_tb = D0_tb) report "FAIL: SEL=00 did not select D0" severity error;

        SEL_tb <= "01"; wait for 20 ns;
        assert (Y_tb = D1_tb) report "FAIL: SEL=01 did not select D1" severity error;

        SEL_tb <= "10"; wait for 20 ns;
        assert (Y_tb = D2_tb) report "FAIL: SEL=10 did not select D2" severity error;

        SEL_tb <= "11"; wait for 20 ns;
        assert (Y_tb = D3_tb) report "FAIL: SEL=11 did not select D3" severity error;

        -- Re-test with data lines flipped to rule out coincidental matches
        D0_tb <= '1'; D1_tb <= '0'; D2_tb <= '1'; D3_tb <= '0';

        SEL_tb <= "00"; wait for 20 ns;
        assert (Y_tb = D0_tb) report "FAIL: SEL=00 (flipped) did not select D0" severity error;

        SEL_tb <= "01"; wait for 20 ns;
        assert (Y_tb = D1_tb) report "FAIL: SEL=01 (flipped) did not select D1" severity error;

        SEL_tb <= "10"; wait for 20 ns;
        assert (Y_tb = D2_tb) report "FAIL: SEL=10 (flipped) did not select D2" severity error;

        SEL_tb <= "11"; wait for 20 ns;
        assert (Y_tb = D3_tb) report "FAIL: SEL=11 (flipped) did not select D3" severity error;

        report "PASS: mux4 testbench completed" severity note;
        wait;
    end process;

end Behavioral;