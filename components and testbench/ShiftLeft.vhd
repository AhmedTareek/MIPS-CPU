library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ShiftLeft is
    Port ( I : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end ShiftLeft;


architecture Behavioral of ShiftLeft is

begin

	O <= I(31) & I(28 downto 0) & "00";

end Behavioral;