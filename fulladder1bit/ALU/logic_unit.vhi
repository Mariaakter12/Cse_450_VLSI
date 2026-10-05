
-- VHDL Instantiation Created from source file logic_unit.vhd -- 19:01:51 10/04/2026
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT logic_unit
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);          
		AND_OUT : OUT std_logic_vector(3 downto 0);
		OR_OUT : OUT std_logic_vector(3 downto 0);
		XOR_OUT : OUT std_logic_vector(3 downto 0);
		NOR_OUT : OUT std_logic_vector(3 downto 0);
		NOT_OUT : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_logic_unit: logic_unit PORT MAP(
		A => ,
		B => ,
		AND_OUT => ,
		OR_OUT => ,
		XOR_OUT => ,
		NOR_OUT => ,
		NOT_OUT => 
	);


