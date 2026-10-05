library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_register_8bit is
end tb_register_8bit;

architecture behavior of tb_register_8bit is 

    component register_8bit
    Port(
         D : in  STD_LOGIC_VECTOR(7 downto 0);
         Clk : in  STD_LOGIC;
         Reset : in  STD_LOGIC;
         En : in  STD_LOGIC;
         Q : out  STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

   -- Inputs
   signal D : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal Clk : STD_LOGIC := '0';
   signal Reset : STD_LOGIC := '0';
   signal En : STD_LOGIC := '0';

   -- Outputs
   signal Q : STD_LOGIC_VECTOR(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: register_8bit PORT MAP (
          D => D,
          Clk => Clk,
          Reset => Reset,
          En => En,
          Q => Q
        );

   -- Clock process
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- Reset Active
      Reset <= '1'; En <= '0'; D <= "00000000";
      wait for 20 ns;	

      -- Disable Reset, Enable High
      Reset <= '0'; En <= '1'; D <= "11110000";
      wait for 20 ns;

      -- Change Input Data
      D <= "00001111";
      wait for 20 ns;

      -- Disable Enable (Hold State)
      En <= '0'; D <= "10101010";
      wait for 20 ns;

      wait;
   end process;

end behavior;