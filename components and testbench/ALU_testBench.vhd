LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_testBench IS
END ALU_testBench;
 
ARCHITECTURE behavior OF ALU_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0);
         cflag : OUT  std_logic;
         zflag : OUT  std_logic;
         oflag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
   signal cflag : std_logic;
   signal zflag : std_logic;
   signal oflag : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          data1 => data1,
          data2 => data2,
          aluop => aluop,
          cin => cin,
          dataout => dataout,
          cflag => cflag,
          zflag => zflag,
          oflag => oflag
        );
 

   -- Stimulus process
   stim_proc: process
   begin	
	data1 <= x"7FFFFFFF";
		   data2 <= x"00000001";
         aluop <= "0000";
			
      wait for 100 ns;  
         aluop <= "0001";
			
      wait for 100 ns;  
         aluop <= "0010";
			cin <= '0';
			
      wait for 100 ns;  
         aluop <= "0110";
			cin <= '1';
			
      wait for 100 ns;  
         aluop <= "1100";
			cin <= '0';
		  
		wait for 100 ns;
			data1 <= x"FFFFFFFF";
			data2 <= x"FFFFFFFF";
			aluop <= "0010";
		
		wait for 100 ns;
			data1 <= x"80000000";
			data2 <= x"3FFFFFFF";
			aluop <= "0110";
			cin <= '1';
			
		wait for 100 ns;
			data1 <= x"375AF012";
			data2 <= x"00493AAB";
			aluop <= "0010";
			cin <= '0';
		
		wait for 100 ns;
			aluop <= "0110";
			cin <= '1';
			
		wait for 100 ns;
			data1 <= x"00000001";
			data2 <= x"00000002";
			aluop <= "0110";
			cin <= '1';
			
		wait for 100 ns;
			data1 <= x"00000528";
			data2 <= x"000000AA";
			aluop <= "0111";
			cin <= '1';
		
		wait for 100 ns;
			data1 <= x"000000AA";
			data2 <= x"00000528";
			aluop <= "0111";
			cin <= '1';
		
		wait for 100 ns;
			data1 <= x"806000AA";
			data2 <= x"00000528";
			aluop <= "0111";
			cin <= '1';
			
      wait;
		
   end process;

END;