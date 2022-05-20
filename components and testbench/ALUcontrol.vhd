library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity ALUcontrol is
    Port ( Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUcontrol;

architecture Behavioral of ALUcontrol is

begin

output(3) <= ALUOp(1) and Funct(2) and Funct(1) and Funct(0); 
output(2) <= ALUOp(0) or (ALUOp(1) and Funct(1)); 
output(1) <= not ALUOp(1) or not Funct(2); 
output(0) <= ALUOp(1) and (((not Funct(1)) and (Funct(1) xor Funct(0))) xor (Funct(3)) );

end Behavioral;

