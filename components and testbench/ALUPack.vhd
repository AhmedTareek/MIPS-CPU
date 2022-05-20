library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ALUPack is

component ALU1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
			  less : in  STD_LOGIC;
			  set : out  STD_LOGIC;
           dataout : out  STD_LOGIC;
			  cout : out  STD_LOGIC);
end component;

end ALUPack;

package body ALUPack is

end ALUPack;