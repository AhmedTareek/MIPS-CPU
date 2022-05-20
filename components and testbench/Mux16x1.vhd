library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16x1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           I4 : in  STD_LOGIC;
			  I5 : in  STD_LOGIC;
           S : in   STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC);
end Mux16x1;

architecture Behavioral of Mux16x1 is

begin

    O <= I0 When S = "0000" Else
		   I1 When S = "0001" Else
		   I2 When S = "0010" Else
		   I3 When S = "0110" Else
		   I4 When S = "1100" Else
		   I5 When S = "0111" Else 'Z';

end Behavioral;