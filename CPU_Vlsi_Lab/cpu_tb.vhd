library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_tb is
end cpu_tb;

architecture Sim of cpu_tb is
    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '1';
    signal Q, R  : std_logic_vector(7 downto 0);
    signal Z     : std_logic;
    signal PC    : std_logic_vector(3 downto 0);
    signal done  : boolean := false;

    procedure check(signal q_s : in std_logic_vector(7 downto 0);
                    signal z_s : in std_logic;
                    signal r_s : in std_logic_vector(7 downto 0);
                    exp_q : in std_logic_vector(7 downto 0);
                    exp_z : in std_logic;
                    exp_r : in std_logic_vector(7 downto 0);
                    cyc   : in integer) is
    begin
        assert q_s = exp_q report "ACC mismatch at cycle " & integer'image(cyc) severity error;
        assert z_s = exp_z report "Z mismatch at cycle "   & integer'image(cyc) severity error;
        assert r_s = exp_r report "R mismatch at cycle "   & integer'image(cyc) severity error;
    end procedure;
begin
    DUT : entity work.cpu_top port map (CLK, RESET, Q, Z, PC, R);

    CLK <= not CLK after 5 ns when not done else '0';

    stim : process
    begin
        -- cycle 0: RESET for one rising edge
        RESET <= '1';
        wait until rising_edge(CLK); wait for 1 ns;
        check(Q, Z, R, x"00", '1', x"00", 0);
        RESET <= '0';

        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"64", '0', x"00", 1); -- LDI 0x64
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"64", '0', x"64", 2); -- STA
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"50", '0', x"64", 3); -- SUB 0x14
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"5A", '0', x"64", 4); -- ADD 0x0A
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"5A", '0', x"5A", 5); -- STA
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"00", '1', x"5A", 6); -- SUB 0x5A
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"5A", '0', x"5A", 7); -- LDR
        wait until rising_edge(CLK); wait for 1 ns; check(Q, Z, R, x"FA", '0', x"5A", 8); -- SUB 0x60

        report "Simulation finished: all Set 8 checks done." severity note;
        wait for 10 ns;
        done <= true;
        wait;
    end process;
end Sim;
