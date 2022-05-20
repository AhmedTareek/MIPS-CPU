LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY ShiftLeft_testBench IS
END ShiftLeft_testBench;
 
ARCHITECTURE behavior OF ShiftLeft_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ShiftLeft
    PORT(
         I : IN  std_logic_vector(31 downto 0);
         O : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ShiftLeft PORT MAP (
          I => I,
          O => O
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			I <= x"00000001";
		
		wait for 100 ns;	
			I <= x"00000100";
		
		wait for 100 ns;	
			I <= x"FFFFFFFF";
			
		wait for 100 ns;	
			I <= x"FFFFFFFC";
			
		wait for 100 ns;	
			I <= x"01010101";

		wait for 100 ns;	
			I <= x"F0101010";
			
      wait;
   end process;

END;