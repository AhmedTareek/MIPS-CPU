library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ALUPack.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC; 
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	Signal tempout : STD_LOGIC_VECTOR (31 downto 0);
	Signal cout : STD_LOGIC_VECTOR (31 downto 0);
	Signal sub : STD_LOGIC_VECTOR (31 downto 0);

begin
	
	Bit0  : ALU1bit Port map (data1(0) , data2(0) , aluop, cin , sub(31), sub(0) , tempout(0) , cout(0) );
	Bit1  : ALU1bit Port map (data1(1) , data2(1) , aluop, cout(0) , '0', sub(1) , tempout(1) , cout(1) );
	Bit2  : ALU1bit Port map (data1(2) , data2(2) , aluop, cout(1) , '0', sub(2) , tempout(2) , cout(2) );
	Bit3  : ALU1bit Port map (data1(3) , data2(3) , aluop, cout(2) , '0', sub(3) , tempout(3) , cout(3) );
	Bit4  : ALU1bit Port map (data1(4) , data2(4) , aluop, cout(3) , '0', sub(4) , tempout(4) , cout(4) );
	Bit5  : ALU1bit Port map (data1(5) , data2(5) , aluop, cout(4) , '0', sub(5) , tempout(5) , cout(5) );
	Bit6  : ALU1bit Port map (data1(6) , data2(6) , aluop, cout(5) , '0', sub(6) , tempout(6) , cout(6) );
	Bit7  : ALU1bit Port map (data1(7) , data2(7) , aluop, cout(6) , '0', sub(7) , tempout(7) , cout(7) );
	Bit8  : ALU1bit Port map (data1(8) , data2(8) , aluop, cout(7) , '0', sub(8) , tempout(8) , cout(8) );
	Bit9  : ALU1bit Port map (data1(9) , data2(9) , aluop, cout(8) , '0', sub(9) , tempout(9) , cout(9) );
	Bit10 : ALU1bit Port map (data1(10), data2(10), aluop, cout(9) , '0', sub(10), tempout(10), cout(10));
	Bit11 : ALU1bit Port map (data1(11), data2(11), aluop, cout(10), '0', sub(11), tempout(11), cout(11));
	Bit12 : ALU1bit Port map (data1(12), data2(12), aluop, cout(11), '0', sub(12), tempout(12), cout(12));
	Bit13 : ALU1bit Port map (data1(13), data2(13), aluop, cout(12), '0', sub(13), tempout(13), cout(13));
	Bit14 : ALU1bit Port map (data1(14), data2(14), aluop, cout(13), '0', sub(14), tempout(14), cout(14));
	Bit15 : ALU1bit Port map (data1(15), data2(15), aluop, cout(14), '0', sub(15), tempout(15), cout(15));
	Bit16 : ALU1bit Port map (data1(16), data2(16), aluop, cout(15), '0', sub(16), tempout(16), cout(16));
	Bit17 : ALU1bit Port map (data1(17), data2(17), aluop, cout(16), '0', sub(17), tempout(17), cout(17));
	Bit18 : ALU1bit Port map (data1(18), data2(18), aluop, cout(17), '0', sub(18), tempout(18), cout(18));
	Bit19 : ALU1bit Port map (data1(19), data2(19), aluop, cout(18), '0', sub(19), tempout(19), cout(19));
	Bit20 : ALU1bit Port map (data1(20), data2(20), aluop, cout(19), '0', sub(20), tempout(20), cout(20));
	Bit21 : ALU1bit Port map (data1(21), data2(21), aluop, cout(20), '0', sub(21), tempout(21), cout(21));
	Bit22 : ALU1bit Port map (data1(22), data2(22), aluop, cout(21), '0', sub(22), tempout(22), cout(22));
	Bit23 : ALU1bit Port map (data1(23), data2(23), aluop, cout(22), '0', sub(23), tempout(23), cout(23));
	Bit24 : ALU1bit Port map (data1(24), data2(24), aluop, cout(23), '0', sub(24), tempout(24), cout(24));
	Bit25 : ALU1bit Port map (data1(25), data2(25), aluop, cout(24), '0', sub(25), tempout(25), cout(25));
	Bit26 : ALU1bit Port map (data1(26), data2(26), aluop, cout(25), '0', sub(26), tempout(26), cout(26));
	Bit27 : ALU1bit Port map (data1(27), data2(27), aluop, cout(26), '0', sub(27), tempout(27), cout(27));
	Bit28 : ALU1bit Port map (data1(28), data2(28), aluop, cout(27), '0', sub(28), tempout(28), cout(28));
	Bit29 : ALU1bit Port map (data1(29), data2(29), aluop, cout(28), '0', sub(29), tempout(29), cout(29));
	Bit30 : ALU1bit Port map (data1(30), data2(30), aluop, cout(29), '0', sub(30), tempout(30), cout(30));
	Bit31 : ALU1bit Port map (data1(31), data2(31), aluop, cout(30), '0', sub(31), tempout(31), cout(31));
	
	
	dataout <= tempout;
	cflag <= cout(31) and aluop(1); -- aluop(1) = 1 only when operation is add or sub
	zflag <= '1' When tempout = x"00000000" Else '0';
	oflag <= (cout(30) xor cout(31)) and aluop(1); -- aluop(1) = 1 only when operation is add or sub

end Behavioral;