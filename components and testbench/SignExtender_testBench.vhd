LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY SignExtender_testBench IS
END SignExtender_testBench;
 
ARCHITECTURE behavior OF SignExtender_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SignExtender
    PORT(
         data_in : IN  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SignExtender PORT MAP (
          data_in => data_in,
          data_out => data_out
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
	
	
      data_in <= x"7FFF"; -- 7 is 0100
	   wait for 100 ns;
		
	   data_in <= x"8000"; -- 8 is 1000
	   wait for 100 ns;
		
	   data_in <= x"FFFF";
	   wait for 100 ns;
		
	
	assert false
	report "END"
	severity failure;

      wait;
   end process;

END;
