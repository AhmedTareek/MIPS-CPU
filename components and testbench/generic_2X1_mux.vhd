
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity generic_2X1_mux is
	generic (n : natural := 1);
    Port ( s : in  STD_LOGIC;
           i0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           i1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           o : out  STD_LOGIC_VECTOR (n-1 downto 0)
			  );
end generic_2X1_mux;

architecture Behavioral of generic_2X1_mux is

begin
 o <= i0 when s = '0' else
	i1 when s ='1';


end Behavioral;

