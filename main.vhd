----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:16 10/22/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
	port(
		CLK,RST : in std_logic;
		HSync,VSync : out std_logic;
		bitsout : out std_logic_vector(9 downto 0);
		SelectSG : in std_logic;
		upleft : in std_logic;
		upright : in std_logic;
		downleft : in std_logic;
		downright : in std_logic
	);
end main;

architecture Behavioral of main is
	COMPONENT dcm_1
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic
		);
	END COMPONENT;

	
	
	COMPONENT Sg
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

	signal Clk40 : std_logic;
	signal Clk75 : std_logic;
	--signal H_SPReg, H_BPReg, H_FPReg, H_VAReg, V_SPReg, V_BPReg, V_FPReg, V_VAReg : INTEGER;
	signal HSyncSig6_8, HSyncSig10_7, VSyncSig6_8, VSyncSig10_7 : std_logic;
	signal bitsoutSig6_8, bitsoutSig10_7 : std_logic_vector(9 downto 0);
begin

	Inst_dcm_1: dcm_1 PORT MAP(
		CLKIN_IN => CLK,
		RST_IN => RST ,
		CLKFX_OUT => Clk75,
		CLKIN_IBUFG_OUT => open ,
		CLK0_OUT => Clk40
	);	
	
	Inst_Sg800600: Sg
	GENERIC MAP(
		H_SP => 128,
		H_BP => 88 ,
		H_FP => 40 ,
		H_VA => 800	,
		V_SP => 4 ,
		V_BP => 23 ,
		V_FP => 1 ,
		V_VA => 600
	)
	PORT MAP(
		CLK => Clk40,
		HSync => HSyncSig6_8 ,
		VSync => VSyncSig6_8 ,
		bitsout => bitsoutSig6_8,
		upleft => upleft ,
		upright => upright ,
		downleft => downleft,
		downright => downright
	);
	
	Inst_Sg1024768: Sg
	GENERIC MAP(
		H_SP => 136,
		H_BP => 144 ,
		H_FP => 24 ,
		H_VA => 1024	,
		V_SP => 6 ,
		V_BP => 29 ,
		V_FP => 3 ,
		V_VA => 768
	)
	PORT MAP(
		CLK => Clk75,
		HSync => HSyncSig10_7 ,
		VSync => VSyncSig10_7 ,
		bitsout => bitsoutSig10_7,
		upleft => upleft ,
		upright => upright ,
		downleft => downleft,
		downright => downright
	);

	HSync <= HSyncSig6_8 when SelectSG = '0' else
				HSyncSig10_7 when SelectSG = '1';
	
	VSync <= VSyncSig6_8 when SelectSG = '0' else
				VSyncSig10_7 when SelectSG = '1';
	
	bitsout <= bitsoutSig6_8 when SelectSG = '0' else
				bitsoutSig10_7 when SelectSG = '1';	
	
end Behavioral;

