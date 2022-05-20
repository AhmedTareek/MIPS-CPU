
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity RegisterFile is
    
	 Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

        type RegisterFile_type is array (0 to 2**5-1) of
        std_logic_vector (31 downto 0) ;

signal array_register  :  RegisterFile_type := ( x"00000000",   --$zero
                                                 x"00000000",   --$at																 
																 x"00000000",   --$v0
																 x"00000000",   --$v1
																 x"00000000",   --$a0
																 x"00000000",   --$a1
																 x"00000000",   --$a2
																 x"00000000",   --$a3
																 x"00000000",   --$t0
																 x"00000000",   --$t1
																 x"00000000",   --$t2
																 x"00000000",   --$t3
																 x"00000000",   --$t4
																 x"00000000",   --$t5
																 x"00000000",   --$t6
																 x"00000000",   --$t7
																 x"00000000",   --$s0
																 x"00000000",   --$s1
																 x"00000000",   --$s2
																 x"00000000",   --$s3
																 x"00000000",   --$s4
																 x"00000000",   --$s5
																 x"00000000",   --$s6
																 x"00000000",   --$s7
																 x"00000000",   --$t8
																 x"00000000",   --$t9
																 x"00000000",   --$k0
																 x"00000000",   --$k1
																 x"00000000",   --$gp
																 x"00000000",   --$sp
																 x"00000000",   --$fp
																 x"00000000"    --$ra
													);			 
    begin

   process (clk) 
	 
     begin
     if (clk ' event and clk='0') then
          if (write_ena = '1' ) then
               array_register (to_integer (unsigned (write_sel) )) <= write_data;
          end if;
    end if;
   end process;
	
	data1 <= array_register (to_integer (unsigned(read_sel1))) ;
   data2 <= array_register (to_integer (unsigned(read_sel2))) ;
	
end Behavioral;