----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:04 11/05/2018 
-- Design Name: 
-- Module Name:    CG - Behavioral 
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

entity CG is
GENERIC(
	H_SP : INTEGER := 44 ;
	H_BP : INTEGER := 87 ;
	H_FP : INTEGER := 127 ;
	H_VA : INTEGER := 8 ;
	V_SP : INTEGER := 44 ;
	V_BP : INTEGER := 87 ;
	V_FP : INTEGER := 127 ;
	V_VA : INTEGER := 8 ;
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
	Rock1SqColor : std_logic_vector(9 downto 0) := "0110111101";
	
	Rock2X0 : INTEGER := 720;
	Rock2Y0 : INTEGER := 225;
	Rock2DeltaX : INTEGER := 20;
	Rock2DeltaY : INTEGER := 150;
	Rock2SqColor : std_logic_vector(9 downto 0) := "0101011101"
);
PORT(
	xc : in INTEGER;
	yc : in INTEGER;
	VSync : in std_logic;
	bitsout : out std_logic_vector(9 downto 0);
	upleft : in std_logic;
	upright : in std_logic;
	downleft : in std_logic;
	downright : in std_logic
);
end CG;

architecture Behavioral of CG is
signal X,Y : INTEGER ;
signal Xpos : INTEGER := X0;
signal Ypos : INTEGER := Y0;
signal Xdir : std_logic := Xd;
signal Ydir : std_logic := Yd;

signal Rock1Xpos : INTEGER := Rock1X0;
signal Rock1Ypos : INTEGER := Rock1Y0;
signal Rock2Xpos : INTEGER := Rock2X0;
signal Rock2Ypos : INTEGER := Rock2Y0;

signal BallSpeed : INTEGER := Speed;

signal Rock1Points : INTEGER := 0;
signal Rock2Points : INTEGER := 0;

signal flag : std_logic := '0';


begin
	p1 : process(xc,yc)
	begin
		X <= xc - H_BP - H_SP;
		Y <= yc - V_BP - V_SP;
	
		

		if (Y<(Ypos + deltaY) and Y > Ypos and X>Xpos and X<(Xpos + deltaX)) then
				--bitsout <= "0000000000";
				bitsout <= SqColor;
		elsif (Y<(Rock1Ypos + Rock1deltaY) and Y > Rock1Ypos and X>Rock1Xpos and X<(Rock1Xpos + Rock1deltaX)) then
				bitsout <= Rock1SqColor;
		elsif (Y<(Rock2Ypos + Rock2deltaY) and Y > Rock2Ypos and X>Rock2Xpos and X<(Rock2Xpos + Rock2deltaX)) then
				bitsout <= Rock2SqColor;
		
		elsif (Y> V_Va/20 and Y<V_Va/10) then
			flag <= '0';
			if(Rock1Points > 0) then
				if(X > H_Va/40 and X < 2*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					------------bug is in elses
				end if;
			end if;
			if(Rock1Points > 1) then
				if(X > 3*H_Va/40 and X < 4*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock1Points > 2) then
				if(X > 5*H_Va/40 and X < 6*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock1Points > 3) then
				if(X > 7*H_Va/40 and X < 8*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock1Points > 4) then
				if(X > 9*H_Va/40 and X < 10*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			
			if(Rock2Points > 0) then
				if(X > 30*H_Va/40 and X < 31*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock2Points > 1) then
				if(X > 32*H_Va/40 and X < 33*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock2Points > 2) then
				if(X > 34*H_Va/40 and X < 35*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock2Points > 3) then
				if(X > 36*H_Va/40 and X < 37*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;
			if(Rock2Points > 4) then
				if(X > 38*H_Va/40 and X < 39*H_Va/40) then
					bitsout <= "1111011110";
					flag <= '1';
				--else
					--bitsout <= "0000000000";
				end if;
			end if;	
			--if(Rock2Points = 0 or Rock1Points = 0 or Rock2Points >5 or Rock1Points > 5 ) then
			--		bitsout <= "0000000000";
			--end if;			
			if(flag = '0') then
				bitsout <= "0000000000";
			end if;
		elsif(Y > V_Va/9 and Y < V_Va/9 + 5) then
			bitsout <= "1111011110";		
		elsif(Ypos < (2*V_Va/3) and Ypos > (V_Va/3) and (Xpos < H_Va/100 or Xpos >99*H_Va/100)) then
			bitsout <= "1111011110";
		else
				--bitsout <= "1111111111";
				bitsout <= "0000000000";
		end if;
			
	end process;
	
	p2 : process(VSync)
	begin
		if( falling_edge(VSync)) then	
			if(Xdir = '1' and Ydir ='1') then
				Xpos <= Xpos + BallSpeed;
				Ypos <= Ypos + BallSpeed;
			end if;
			if(Xdir = '1' and Ydir ='0') then
				Xpos <= Xpos + BallSpeed;
				Ypos <= Ypos - BallSpeed;
			end if;
			if(Xdir = '0' and Ydir ='1') then
				Xpos <= Xpos - BallSpeed;
				Ypos <= Ypos + BallSpeed;
			end if;
			if(Xdir = '0' and Ydir ='0') then
				Xpos <= Xpos - BallSpeed;
				Ypos <= Ypos - BallSpeed;
			end if;
			
			if(Xpos < 0) then
				if(Ypos < (2*V_Va/3) and Ypos > (V_Va/3)) then
					Xpos <= H_Va/2;
					Ypos <= V_Va/2;
					Xdir <= '1';
					Rock2Points <= Rock2Points + 1;
					BallSpeed <= BallSpeed + 1;

				else
					Xpos <= 0 - Xpos;
					Xdir <= '1';
				end if;
			end if;
			if(Ypos < V_Va/9) then
				Ypos <= V_Va/9 - (Ypos-V_Va/9) ;
				Ydir <= '1';
			end if;
			
			--Part Of Calculating points
			if(Rock1Points > 5) then
				Rock1Points <= 0;
				Rock2Points <= 0;
				BallSpeed <= Speed;
			end if;
			if(Rock2Points > 5) then
				Rock1Points <= 0;
				Rock2Points <= 0;
				BallSpeed <= Speed;
			end if;	
			if((Xpos + deltaX) > H_VA) then
				if(Ypos < (2*V_Va/3) and Ypos > (V_Va/3)) then
					Xpos <= H_Va/2;
					Ypos <= V_Va/2;
					Xdir <= '0';	
					Rock1Points <= Rock1Points + 1;
					BallSpeed <= BallSpeed + 1;
					
				else
					Xpos <= H_Va - (Xpos + deltaX + deltaX - H_Va );
					Xdir <= '0';
				end if;
			end if;
			if((Ypos + deltaY) > V_VA) then
				Ypos <= V_Va - (Ypos + deltaY + deltaY - V_Va );
				Ydir <= '0';
			end if;
			
			if(Xdir = '0') then
				if((Xpos < Rock1Xpos + Rock1DeltaX)and(Xpos > Rock1Xpos) and (Ypos < Rock1Ypos + Rock1DeltaY) and ((Ypos+deltay) > Rock1Ypos)) then
					Xdir <= '1';
					Xpos <= Xpos + 2*(Rock1Xpos + Rock1DeltaX - Xpos);
				end if;
				if(((Xpos+deltaX) < Rock2Xpos + Rock2DeltaX)and((Xpos+deltaX) > Rock2Xpos) and (Ypos < Rock2Ypos + Rock2DeltaY) and ((Ypos+deltay) > Rock2Ypos)) then
					Xdir <= '1';
					
					Xpos <= Xpos + 2*(Rock2Xpos + Rock2DeltaX - Xpos);
				end if;				
			end if;
			
			if(Xdir = '1') then
				if(((Xpos+deltaX) < Rock2Xpos + Rock2DeltaX)and((Xpos+deltaX) > Rock2Xpos) and (Ypos < Rock2Ypos + Rock2DeltaY) and ((Ypos+deltay) > Rock2Ypos)) then
					Xdir <= '0';
					Xpos <= Xpos - 2*(Xpos + deltaX - Rock2Xpos) ;
				end if;
				if((Xpos < Rock1Xpos + Rock1DeltaX)and(Xpos > Rock1Xpos) and (Ypos < Rock1Ypos + Rock1DeltaY) and ((Ypos+deltay) > Rock1Ypos)) then
					Xdir <= '0';
					Xpos <= Xpos - 2*(Xpos - Rock1Xpos) ;
				end if;
			end if;

			
			if(upleft = '0' ) then
				if(Rock1Ypos > 9) then
					Rock1Ypos <= Rock1Ypos - 10;
				else
					Rock1Ypos <= 0;
				end if;
			end if;
			if(downleft = '0') then
				if(Rock1Ypos < V_Va - Rock1DeltaY - 9) then
					Rock1Ypos <= Rock1Ypos + 10;
				else
					Rock1Ypos <= V_Va - Rock1DeltaY;
				end if;
			end if;
			if(upright = '0') then
				if(Rock2Ypos > 9) then
					Rock2Ypos <= Rock2Ypos - 10;
				else
					Rock2Ypos <= 0;
				end if;
			end if;
			if(downright = '0') then
				if(Rock2Ypos < V_Va - Rock2DeltaY - 9) then
					Rock2Ypos <= Rock2Ypos + 10;
				else
					Rock2Ypos <= V_Va - Rock2DeltaY;
				end if;
			end if;
		end if;
	end process;



end Behavioral;

