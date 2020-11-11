----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:41:56 10/22/2018 
-- Design Name: 
-- Module Name:    Sg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sg is
GENERIC(
	H_SP : INTEGER := 44;
	H_BP : INTEGER := 87 ;
	H_FP : INTEGER := 127 ;
	H_VA : INTEGER := 8	;
	V_SP : INTEGER := 44 ;
	V_BP : INTEGER := 87 ;
	V_FP : INTEGER := 127 ;
	V_VA : INTEGER := 8
);
PORT(
	CLK : in std_logic;
	HSync,VSync : out std_logic;
	bitsout : out std_logic_vector(9 downto 0);
	upleft : in std_logic;
	upright : in std_logic;
	downleft : in std_logic;
	downright : in std_logic
);
end Sg;

architecture Behavioral of Sg is
	COMPONENT HSC
	GENERIC(
	SP : INTEGER := 44 ;
	BP : INTEGER := 87 ;
	FP : INTEGER := 127 ;
	VA : INTEGER := 8
	);
	PORT(
		CLK : IN std_logic;          
		HSync : OUT std_logic;
		xc	:	out INTEGER
		);
	END COMPONENT;
	
	COMPONENT VSC
	GENERIC(
	SP : INTEGER := 44 ;
	BP : INTEGER := 87 ;
	FP : INTEGER := 127 ;
	VA : INTEGER := 8
	);
	PORT(
		CLK : IN std_logic;          
		VSync : OUT std_logic;
		yc	:	out INTEGER
		);	
		
	END COMPONENT;
	
	COMPONENT CG
	GENERIC(
		H_SP : INTEGER := 44 ;
		H_BP : INTEGER := 87 ;
		H_FP : INTEGER := 127 ;
		H_VA : INTEGER := 8 ;
		V_SP : INTEGER := 44 ;
		V_BP : INTEGER := 87 ;
		V_FP : INTEGER := 127 ;
		V_VA : INTEGER := 8;
		X0 : INTEGER := 300;
		Y0 : INTEGER := 200;
		deltaX : INTEGER := 10;
		deltaY : INTEGER := 10;
		SqColor : std_logic_vector(9 downto 0) := "1111111111";
		Xd : std_logic := '1';
		Yd : std_logic := '0';
		Speed : INTEGER := 15;
		
		
		Rock1X0 : INTEGER := 60;
		Rock1Y0 : INTEGER := 225;
		Rock1DeltaX : INTEGER := 20;
		Rock1DeltaY : INTEGER := 150;
		Rock1SqColor : std_logic_vector(9 downto 0) := "1110111101";
	
		Rock2X0 : INTEGER := 720;
		Rock2Y0 : INTEGER := 225;
		Rock2DeltaX : INTEGER := 20;
		Rock2DeltaY : INTEGER := 150;
		Rock2SqColor : std_logic_vector(9 downto 0) := "1111001101"
	);
	PORT(
		xc : IN INTEGER; -- buuuuuggggggggggggggggg . view hdl ins... of cg , make this ports std_logic . we have to change them here
		yc : IN INTEGER;  
		VSync : in std_logic;
		bitsout : OUT std_logic_vector(9 downto 0);
		upleft : in std_logic;
		upright : in std_logic;
		downleft : in std_logic;
		downright : in std_logic
		);
	END COMPONENT;
	
	signal HSyncConnect : std_Logic;
	signal VSyncConnect : std_Logic;
	signal xcsig,ycsig : INTEGER;
	signal bitsout0, bitsout1, bitsout2 : std_logic_vector(9 downto 0);
	
begin

	Inst_HSC: HSC 
	GENERIC MAP(
		SP => H_SP ,
		BP => H_BP ,
		FP => H_FP ,
		VA => H_VA
	)
	PORT MAP(
		CLK =>CLK ,
		HSync => HSyncConnect,
		xc => xcsig
	);
	
	Inst_VSC: VSC 
	GENERIC MAP(
		SP => V_SP ,
		BP => V_BP ,
		FP => V_FP ,
		VA => V_VA
	)
	PORT MAP(
		CLK => HSyncConnect,
		VSync => VSyncConnect,
		yc => ycsig
		
	);
	
	HSync <= HSyncConnect;
	VSync <= VSyncConnect;
	
	Inst_CG0: CG 
	GENERIC MAP(
		H_SP => H_SP,
		H_BP => H_BP ,
		H_FP => H_FP ,
		H_VA => H_VA,
		V_SP => V_SP ,
		V_BP => V_BP ,
		V_FP => V_FP ,
		V_VA => V_VA ,
		X0 => 300,
		Y0 => 200,
		deltaX => 20,
		deltaY => 20,
		SqColor => "1010101101",
		Xd => '1',
		Yd => '0',
		
		Rock1SqColor => "0110111101",
		
		Rock2SqColor => "0101011101",
		Speed => 5
	)
	PORT MAP(
		xc => xcsig,	
		yc => ycsig,
		VSync => VSyncConnect,
		bitsout => bitsout0,
		upleft => upleft ,
		upright => upright ,
		downleft => downleft,
		downright => downright
	);
	
	
--	Inst_CG1: CG 
--	GENERIC MAP(
--		H_SP => H_SP,
--		H_BP => H_BP ,
--		H_FP => H_FP ,
--		H_VA => H_VA,
--		V_SP => V_SP ,
--		V_BP => V_BP ,
--		V_FP => V_FP ,
--		V_VA => V_VA ,
--		X0 => 300,
--		Y0 => 200,
--		deltaX => 50,
--		deltaY => 50,
--		SqColor => "1110000000",
--		Xd => '0',
--		Yd => '0',
--		Speed => 5
--	)
--	PORT MAP(
--		xc => xcsig,	
--		yc => ycsig,
--		VSync => VSyncConnect,
--		bitsout => bitsout1
--	);
--	
--	Inst_CG2: CG 
--	GENERIC MAP(
--		H_SP => H_SP,
--		H_BP => H_BP ,
--		H_FP => H_FP ,
--		H_VA => H_VA,
--		V_SP => V_SP ,
--		V_BP => V_BP ,
--		V_FP => V_FP ,
--		V_VA => V_VA ,
--		X0 => 300,
--		Y0 => 200,
--		deltaX => 50,
--		deltaY => 50,
--		SqColor => "0000011111",
--		Xd => '1',
--		Yd => '1',
--		Speed => 15
--	)
--	PORT MAP(
--		xc => xcsig,	
--		yc => ycsig,
--		VSync => VSyncConnect,
--		bitsout => bitsout2
--	);

	bitsout <= bitsout0 ;
end Behavioral;

