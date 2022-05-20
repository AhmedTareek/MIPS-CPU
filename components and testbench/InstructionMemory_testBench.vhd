LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY InstructionMemory_testBench IS
END InstructionMemory_testBench;
 
ARCHITECTURE behavior OF InstructionMemory_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         ReadAddress : IN  std_logic_vector(31 downto 0);
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ReadAddress : std_logic_vector(31 downto 0) := x"003FFFFC" ;

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          ReadAddress => ReadAddress,
          Instruction => Instruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
     
	  -- read 12 commands
	FOR I IN 0 TO 11 LOOP
		ReadAddress <= x"00400000" OR std_logic_vector(to_unsigned(I * 4, 32));
		WAIT FOR 25 ns;
	END LOOP;
	ASSERT false
	REPORT "END"
	SEVERITY failure;
		
		wait;
   end process;

END;
