library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture Behavioral of Add is
	
	component FullAdder is
		 Port ( a : in  STD_LOGIC;
				  b : in  STD_LOGIC;
				  cin : in STD_LOGIC;
				  s : out  STD_LOGIC;
				  cout : out  STD_LOGIC);
	end component;
	
	Signal C : STD_LOGIC_VECTOR (31 downto 0);
	
begin

	Bit0  : FullAdder Port Map (A(0) , B(0) , '0'  , O(0) , C(0) );
	Bit1  : FullAdder Port Map (A(1) , B(1) , C(0) , O(1) , C(1) );
	Bit2  : FullAdder Port Map (A(2) , B(2) , C(1) , O(2) , C(2) );
	Bit3  : FullAdder Port Map (A(3) , B(3) , C(2) , O(3) , C(3) );
	Bit4  : FullAdder Port Map (A(4) , B(4) , C(3) , O(4) , C(4) );
	Bit5  : FullAdder Port Map (A(5) , B(5) , C(4) , O(5) , C(5) );
	Bit6  : FullAdder Port Map (A(6) , B(6) , C(5) , O(6) , C(6) );
	Bit7  : FullAdder Port Map (A(7) , B(7) , C(6) , O(7) , C(7) );
	Bit8  : FullAdder Port Map (A(8) , B(8) , C(7) , O(8) , C(8) );
	Bit9  : FullAdder Port Map (A(9) , B(9) , C(8) , O(9) , C(9) );
	Bit10 : FullAdder Port Map (A(10), B(10), C(9) , O(10), C(10));
	Bit11 : FullAdder Port Map (A(11), B(11), C(10), O(11), C(11));
	Bit12 : FullAdder Port Map (A(12), B(12), C(11), O(12), C(12));
	Bit13 : FullAdder Port Map (A(13), B(13), C(12), O(13), C(13));
	Bit14 : FullAdder Port Map (A(14), B(14), C(13), O(14), C(14));
	Bit15 : FullAdder Port Map (A(15), B(15), C(14), O(15), C(15));
	Bit16 : FullAdder Port Map (A(16), B(16), C(15), O(16), C(16));
	Bit17 : FullAdder Port Map (A(17), B(17), C(16), O(17), C(17));
	Bit18 : FullAdder Port Map (A(18), B(18), C(17), O(18), C(18));
	Bit19 : FullAdder Port Map (A(19), B(19), C(18), O(19), C(19));
	Bit20 : FullAdder Port Map (A(20), B(20), C(19), O(20), C(20));
	Bit21 : FullAdder Port Map (A(21), B(21), C(20), O(21), C(21));
	Bit22 : FullAdder Port Map (A(22), B(22), C(21), O(22), C(22));
	Bit23 : FullAdder Port Map (A(23), B(23), C(22), O(23), C(23));
	Bit24 : FullAdder Port Map (A(24), B(24), C(23), O(24), C(24));
	Bit25 : FullAdder Port Map (A(25), B(25), C(24), O(25), C(25));
	Bit26 : FullAdder Port Map (A(26), B(26), C(25), O(26), C(26));
	Bit27 : FullAdder Port Map (A(27), B(27), C(26), O(27), C(27));
	Bit28 : FullAdder Port Map (A(28), B(28), C(27), O(28), C(28));
	Bit29 : FullAdder Port Map (A(29), B(29), C(28), O(29), C(29));
	Bit30 : FullAdder Port Map (A(30), B(30), C(29), O(30), C(30));
	Bit31 : FullAdder Port Map (A(31), B(31), C(30), O(31), C(31));
	
end Behavioral;