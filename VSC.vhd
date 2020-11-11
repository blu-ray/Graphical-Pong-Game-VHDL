----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:58:35 10/22/2018 
-- Design Name: 
-- Module Name:    VSC - Behavioral 
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

entity VSC is
GENERIC(
	SP : INTEGER := 44 ;
	BP : INTEGER := 87 ;
	FP : INTEGER := 127 ;
	VA : INTEGER := 8
);
PORT(
	CLK : in std_logic;
	VSync : out std_logic;
	yc	:	out INTEGER
);
end VSC;

architecture Behavioral of VSC is
	signal counter : INTEGER range 0 to (SP + BP + FP + VA) := 0 ;
begin
yc <= counter;
p1 : process(CLK)
begin
	if(falling_edge(CLK)) then
		counter <= counter + 1;
		if ( counter = SP + BP + FP + VA -1) then
			counter <= 0;
		end if;
		if ( counter < SP ) then
			VSync <= '0';
		else
			VSync <= '1';
		end if;
	end if;
			
end process;
end Behavioral;

