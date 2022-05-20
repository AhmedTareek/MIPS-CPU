LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY DataMemory_testBench IS
END DataMemory_testBench;
 
ARCHITECTURE behavior OF DataMemory_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         ReadData : OUT  std_logic_vector(31 downto 0);
         MemRead : IN  std_logic;
         MemWrite : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal MemRead : std_logic := '0';
   signal MemWrite : std_logic := '0';

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          Address => Address,
          WriteData => WriteData,
          ReadData => ReadData,
          MemRead => MemRead,
          MemWrite => MemWrite
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
	--write data 	
	Address   <= x"10010000";
	WriteData <= x"11223344";
	MemWrite  <= '0';
	wait for 10 ns;
	MemWrite <= '1';
	wait for 10 ns;
	MemWrite <= '0';
	wait for 10 ns;
	
	
	Address   <= x"10010004";
	WriteData <= x"3344FF11";
	MemWrite  <= '0';
	wait for 10 ns;
	MemWrite <= '1';
   wait for 10 ns;
	MemWrite <= '0';
	wait for 10 ns;
	
	
	-- read from memory
	Address <= x"10010000";
	MemRead <= '0';
	wait for 10 ns;
	MemRead <= '1';
	wait for 10 ns;
	MemRead <= '0';
	wait for 10 ns;
	
	
	Address <= x"10010004";
	MemRead <= '0';
	wait for 10 ns;
	MemRead <= '1';
	wait for 10 ns;
	MemRead <= '0';
	wait for 10 ns;
	
	
	ASSERT false
	REPORT "END"
	SEVERITY failure;	

      wait;
   end process;

END;
