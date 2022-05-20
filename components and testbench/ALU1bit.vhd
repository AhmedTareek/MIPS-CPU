library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
			  less : in  STD_LOGIC;
			  set : out  STD_LOGIC;
           dataout : out  STD_LOGIC;
			  cout : out  STD_LOGIC);
end ALU1bit;

architecture Behavioral of ALU1bit is

	component Mux16x1 is
		 Port ( I0 : in  STD_LOGIC;
				  I1 : in  STD_LOGIC;
				  I2 : in  STD_LOGIC;
				  I3 : in  STD_LOGIC;
				  I4 : in  STD_LOGIC;
				  I5 : in  STD_LOGIC;
				  S : in  STD_LOGIC_VECTOR (3 downto 0);
				  O : out  STD_LOGIC);
	end component;

	component Mux2x1 is
		 Port ( b : in  STD_LOGIC;
				  sub : in  STD_LOGIC;
				  o : out  STD_LOGIC);
	end component;

	component FullAdder is
		 Port ( a : in  STD_LOGIC;
				  b : in  STD_LOGIC;
				  cin : in STD_LOGIC;
				  s : out  STD_LOGIC;
				  cout : out  STD_LOGIC);
	end component;
	
	
	Signal I0 : STD_LOGIC;
	Signal I1 : STD_LOGIC;
	Signal I2 : STD_LOGIC;
	Signal I3 : STD_LOGIC;
	Signal I4 : STD_LOGIC;
	Signal I5 : STD_LOGIC;
	
	Signal sub : STD_LOGIC;
	Signal bout : STD_LOGIC;

begin

	sub <= '1' When aluop(2) = '1' Else '0';
	set <= I2;
	
	I0 <= a and b;
	I1 <= a or b;
	I3 <= I2;
	I4 <= a nor b;
	I5 <= less;
	
	SubMux : Mux2x1 Port Map (b, sub, bout);
	Add : FullAdder Port map (a, bout, cin, I2, cout);
	AluMux: Mux16x1 Port Map (I0, I1, I2, I3, I4, I5, aluop, dataout);
	

end Behavioral;