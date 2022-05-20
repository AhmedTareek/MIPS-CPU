LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY ALUcontrol_testBench IS
END ALUcontrol_testBench;
 
ARCHITECTURE behavior OF ALUcontrol_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUcontrol
    PORT(
         Funct : IN  std_logic_vector(5 downto 0);
         ALUOp : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Funct : std_logic_vector(5 downto 0) := (others => '0');
   signal ALUOp : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUcontrol PORT MAP (
          Funct => Funct,
          ALUOp => ALUOp,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
	--using mips instruction sheet
   -- R-type commands 
	ALUOp <= "10";
	Funct <= "100100"; -- and
	WAIT FOR 20 ns;
	ALUOp <= "10";
	Funct <= "100101"; -- or
	WAIT FOR 20 ns;
	ALUOp <= "10";
	Funct <= "100000"; -- add
	WAIT FOR 20 ns;
	ALUOp <= "10";
	Funct <= "100010"; -- sub
	WAIT FOR 20 ns;
	ALUOp <= "10";
	Funct <= "101010"; -- slt
	WAIT FOR 20 ns;
	ALUOp <= "10";
	Funct <= "100111"; -- nor
	WAIT FOR 20 ns;
 
	 
	-- I type commands
	-- lw
	ALUOp <= "00";
	Funct <= "XXXXXX"; -- should output the operation for add
	WAIT FOR 20 ns;
	-- sw
	ALUOp <= "00";
	Funct <= "XXXXXX"; -- should output the operation for add
	WAIT FOR 20 ns;
	-- beq
	ALUOp <= "01";
	Funct <= "XXXXXX"; -- should output the operation for sub
	WAIT FOR 20 ns;
	-- bne
	ALUOp <= "01";
	Funct <= "XXXXXX"; -- should output the operation for sub
	WAIT FOR 20 ns;
	
	
	ASSERT false
	REPORT "END"
	SEVERITY failure;
		
      wait;
   end process;

END;
