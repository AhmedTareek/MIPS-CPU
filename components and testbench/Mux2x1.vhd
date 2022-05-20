library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2x1 is
    Port ( b : in  STD_LOGIC;
           sub : in  STD_LOGIC;
           o : out  STD_LOGIC);
end Mux2x1;

architecture Behavioral of Mux2x1 is

begin
	o <= b When sub = '0' Else not b;

end Behavioral;