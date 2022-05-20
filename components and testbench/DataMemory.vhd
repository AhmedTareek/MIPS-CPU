library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DATAMEMORY is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt: in STD_LOGIC;
  			INPUT     : in STD_LOGIC_VECTOR (wordsize-1 downto 0);
			OUTPUT    : out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ : in STD_LOGIC;
			MEM_WRITE : in STD_LOGIC;
			ADDRESS   : in STD_LOGIC_VECTOR (addresssize-1 downto 0);
			CLK       : in STD_LOGIC
			);

end DATAMEMORY;

architecture BEHAVIORAL of DATAMEMORY is

  type   MEM is array (0 to words-1) of STD_LOGIC_VECTOR (wordsize-1 downto 0);
  signal MEMORY : MEM;
  signal OUTS: STD_LOGIC_VECTOR(wordsize-1 downto 0);
	signal ADDRover4: STD_LOGIC_VECTOR(addresssize-2 - 1 downto 0);
	signal ADDR_int: integer;
begin

  process ( MEM_READ, MEM_WRITE, CLK, ADDRESS, INPUT ) is
  begin
  if LoadIt = '1' then
-----------------------
--Project1 test
-----------------------
		memory(0) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(1) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(2) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(3) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(4) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(5) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(6) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(7) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(8) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(9) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(10) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(11) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" ;
		memory(12) <= "00000000000000000000000000001100" ;
		memory(13) <= "00000000000000000000000000000001" ;
		memory(14) <= "00000000000000000000000000000100" ;

  else
    if FALLING_EDGE(CLK) then
      if MEM_WRITE = '1' then
			MEMORY(ADDR_int) <= INPUT;
      end if;		
    end if;
	end if;
	
end process;

	ADDRover4 <= ADDRESS(31 downto 2) ;
	ADDR_int <= CONV_INTEGER(ADDRover4);
	OUTS <= MEMORY(ADDR_int) when MEM_READ = '1' and (ADDR_int < words) else
				(others => 'Z') when MEM_READ = '0' ;
	
	OUTPUT <= OUTS;

end BEHAVIORAL;