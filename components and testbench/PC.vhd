library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity PC is
	port ( clk : in std_logic;
			 start : in std_logic;
			 PCin : in std_logic_vector (31 downto 0);
			 PCout : out std_logic_vector (31 downto 0);
			 CurrentPC : out std_logic_vector (31 downto 0));
end PC;

architecture Behavioral of PC is
	
begin

	process(clk, start)
		begin
		if (start = '1') then
			PCout <= x"00000000";
		end if;
		if (clk'event and clk = '0') then
			PCout <= PCin;
		end if;
	end process;
	
	CurrentPC <= PCin;

end Behavioral;