
-- VHDL Instantiation Created from source file CG.vhd -- 14:00:26 12/08/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT CG
	PORT(
		xc : IN std_logic;
		yc : IN std_logic;
		VSync : IN std_logic;
		upleft : IN std_logic;
		upright : IN std_logic;
		downleft : IN std_logic;
		downright : IN std_logic;          
		bitsout : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	Inst_CG: CG PORT MAP(
		xc => ,
		yc => ,
		VSync => ,
		bitsout => ,
		upleft => ,
		upright => ,
		downleft => ,
		downright => 
	);


