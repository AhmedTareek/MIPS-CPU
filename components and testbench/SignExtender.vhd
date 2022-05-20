library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity SignExtender is
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtender;

architecture Behavioral of SignExtender is

begin
     data_out <= x"0000" & data_in when data_in(15) = '0'
	              else
	              x"FFFF" & data_in;

end Behavioral;

