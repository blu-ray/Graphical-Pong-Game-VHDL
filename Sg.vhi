
-- VHDL Instantiation Created from source file Sg.vhd -- 13:56:57 12/08/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Sg
	PORT(
		CLK : IN std_logic;
		upleft : IN std_logic;
		upright : IN std_logic;
		downleft : IN std_logic;
		downright : IN std_logic;          
		HSync : OUT std_logic;
		VSync : OUT std_logic;
		bitsout : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	Inst_Sg: Sg PORT MAP(
		CLK => ,
		HSync => ,
		VSync => ,
		bitsout => ,
		upleft => ,
		upright => ,
		downleft => ,
		downright => 
	);


