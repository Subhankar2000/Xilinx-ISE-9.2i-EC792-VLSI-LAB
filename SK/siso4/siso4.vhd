library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity siso4 is
    Port ( 
		 SI : in  STD_LOGIC;
		CLK : in  STD_LOGIC;
		 SO : out  STD_LOGIC;
	 PRESET : in  STD_LOGIC;
	  CLEAR : in STD_LOGIC
		 );
end siso4;

architecture Behavioral of siso4 is

signal SIG : STD_LOGIC_VECTOR(3 downto 0);
	
	begin process(CLK)
		begin if( CLK='1' AND PRESET='0' AND CLEAR='0' )
			then
			SIG <= SI & SIG(3 downto 1);
		elsif( PRESET='1' AND CLEAR='0' )
			then
			SIG <= "1111" ;
		elsif( PRESET='0' AND CLEAR='1' )
			then
			SIG <= "0000" ;
		end if;
	end process;
	
	SO <= SIG(0);
	
end Behavioral;