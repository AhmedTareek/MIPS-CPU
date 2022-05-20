LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY ControlUnit_testBench IS
END ControlUnit_testBench;
 
ARCHITECTURE behavior OF ControlUnit_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         OpCode : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         Jump : OUT  std_logic;
         Branch : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal OpCode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal Jump : std_logic;
   signal Branch : std_logic;
   signal MemRead : std_logic;
   signal MemtoReg : std_logic;
   signal ALUOp : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal ALUSrc : std_logic;
   signal RegWrite : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          OpCode => OpCode,
          RegDst => RegDst,
          Jump => Jump,
          Branch => Branch,
          MemRead => MemRead,
          MemtoReg => MemtoReg,
          ALUOp => ALUOp,
          MemWrite => MemWrite,
          ALUSrc => ALUSrc,
          RegWrite => RegWrite
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		OpCode <= "000010";
		
		wait for 100 ns;
		OpCode <= "000100";
		
		wait for 100 ns;
		OpCode <= "000101";
		
		wait for 100 ns;
		OpCode <= "000000";
		
		wait for 100 ns;
		OpCode <= "100011";
		
		wait for 100 ns;
		OpCode <= "101011";

      wait;
		
   end process;

END;