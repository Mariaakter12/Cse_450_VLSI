library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1bit_tb is
-- Testbench entities are always empty
end full_adder_1bit_tb;

architecture Behavior of full_adder_1bit_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component full_adder_1bit
    Port (
        a    : in  STD_LOGIC;
        b    : in  STD_LOGIC;
        cin  : in  STD_LOGIC;
        sum  : out STD_LOGIC;
        cout : out STD_LOGIC
    );
    end component;

    -- Signal Declarations
    signal a_tb    : STD_LOGIC := '0';
    signal b_tb    : STD_LOGIC := '0';
    signal cin_tb  : STD_LOGIC := '0';

    signal sum_tb  : STD_LOGIC;
    signal cout_tb : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: full_adder_1bit PORT MAP (
          a    => a_tb,
          b    => b_tb,
          cin  => cin_tb,
          sum  => sum_tb,
          cout => cout_tb
        );

    -- Stimulus process (Test all 8 combinations)
    stim_proc: process
    begin
        -- Wait 100 ns for global reset
        wait for 10 ns;

        -- Test Case 1: 0 + 0 + 0 = Sum 0, Cout 0
        a_tb <= '0'; b_tb <= '0'; cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 2: 0 + 0 + 1 = Sum 1, Cout 0
        a_tb <= '0'; b_tb <= '0'; cin_tb <= '1';
        wait for 10 ns;

        -- Test Case 3: 0 + 1 + 0 = Sum 1, Cout 0
        a_tb <= '0'; b_tb <= '1'; cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 4: 0 + 1 + 1 = Sum 0, Cout 1
        a_tb <= '0'; b_tb <= '1'; cin_tb <= '1';
        wait for 10 ns;

        -- Test Case 5: 1 + 0 + 0 = Sum 1, Cout 0
        a_tb <= '1'; b_tb <= '0'; cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 6: 1 + 0 + 1 = Sum 0, Cout 1
        a_tb <= '1'; b_tb <= '0'; cin_tb <= '1';
        wait for 10 ns;

        -- Test Case 7: 1 + 1 + 0 = Sum 0, Cout 1
        a_tb <= '1'; b_tb <= '1'; cin_tb <= '0';
        wait for 10 ns;

        -- Test Case 8: 1 + 1 + 1 = Sum 1, Cout 1
        a_tb <= '1'; b_tb <= '1'; cin_tb <= '1';
        wait for 10 ns;

        wait; -- Stop simulation execution
    end process;

end Behavior;