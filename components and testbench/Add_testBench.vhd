LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Add_testBench IS
END Add_testBench;
 
ARCHITECTURE behavior OF Add_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Add
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         O : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Add PORT MAP (
          A => A,
          B => B,
          O => O
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			A <= x"00400000";
			B <= x"00000004";
			
		wait for 100 ns;
			A <= x"F248160A";
			B <= x"00000004";
			
		wait for 100 ns;
			A <= x"0040000C";
			B <= x"FFFFFFF4";
			
		wait for 100 ns;
			A <= x"000000CA";
			B <= x"000000D4";
		
		wait for 100 ns;
			A <= x"F248160A";
			B <= x"F248160A";

      wait;
   end process;

END;