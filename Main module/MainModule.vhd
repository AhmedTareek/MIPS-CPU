library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MainModule is
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0);
           DataMemOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MainModule;

architecture Behavioral of MainModule is
	-- reg file signals
	-------------signal ReadReg1 : std_logic_vector (4 downto 0);
	-------------signal ReadReg2 : std_logic_vector (4 downto 0);
	signal WriteReg : std_logic_vector (4 downto 0);
	signal sRegWrite : std_logic; --from big control unit
	signal ReadData1 : std_logic_vector (31 downto 0);
	signal ReadData2 : std_logic_vector (31 downto 0);
	signal WriteData : std_logic_vector (31 downto 0);
	-- big control unit signals
	--------------signal instructionopcode : std_logic_vector (5 downto 0);
	signal sRegDst : std_logic;
	signal sJump : std_logic;
	signal sBranch : std_logic;
	signal sMemRead : std_logic;
	signal sMemtoReg : std_logic;
	signal sAluOp : std_logic_vector (1 downto 0);
	signal sMemWrite : std_logic;
	signal sALUSrc : std_logic;
	-- signals for instuction memory
	signal sReadAddress : std_logic_vector(31 downto 0);
	signal sInstruction : std_logic_vector(31 downto 0);
	-- signals for alu control 
	signal alu_selection : std_logic_vector (3 downto 0);
	
	--signals for alu
	signal aluMuxOut : std_logic_vector (31 downto 0);
	signal alu_output : std_logic_vector (31 downto 0);
	signal carry_flag : std_logic;
	signal zero_flag : std_logic;
	signal overflow_flag : std_logic;
	-- sign extension signal
	signal extended_sign : std_logic_vector(31 downto 0);
	-- data memory output signal
	signal data_memoryOut : std_logic_vector(31 downto 0);
	-- pc signals
	signal  pc_IN : std_logic_vector(31 downto 0);
	signal  Current_PC : std_logic_vector(31 downto 0);	
	-- first adder  output signal
	signal firstadd : std_logic_vector (31 downto 0);
	-- singal of shift left 2
	signal shift_left_32 : std_logic_vector (31 downto 0);
	-- second adder output signal
	signal secondAdd : std_logic_vector (31 downto 0);
	-- fifth mux input
	signal fifthmux_IN : std_logic_vector (31 downto 0);
	-- signal jump without PC
	signal jump_no_pc : std_logic_vector (31 downto 0);
	-- temp
	
	
		
begin


	to28_ShiftLeft: entity work.ShiftLeft PORT MAP(
		I => "000000" & sInstruction(25 downto 0),
		O => jump_no_pc
	);




	fifth_2X1_mux: entity  work.generic_2X1_mux
		generic map (n => 32)
		PORT MAP(
		s => sJump,
		i0 => fifthmux_IN,
		i1 => firstadd(31 downto 28) & jump_no_pc(27 downto 0) ,
		o => pc_IN
	);



	fourth_2X1_mux: entity  work.generic_2X1_mux
		generic map (n => 32)
		PORT MAP(
		s => sBranch and ((zero_flag and not(sInstruction(26))) or (not(zero_flag) and sInstruction(26))),
		i0 => firstadd,
		i1 => secondAdd,
		o => fifthmux_IN
	);


	to32_ShiftLeft: entity work.ShiftLeft PORT MAP(
		I => extended_sign,
		O => shift_left_32
	);


pc_first_Add: entity work.Add PORT MAP(
	A => sReadAddress,
	B => x"0000_0004",
	O => firstadd
	);


second_Adder: entity work.Add PORT MAP(
	A => firstadd,
	B => shift_left_32,
	O => secondAdd
	);

		
	program_counter_PC: entity work.PC PORT MAP(
		clk => CLK,
		start => START,
		PCin => pc_IN,
		PCout => sReadAddress,
		CurrentPC => Current_PC
	);

				
	third_2X1_mux: entity  work.generic_2X1_mux
		generic map (n => 32)
		PORT MAP(
		s => sMemtoReg ,
		i0 => alu_output,
		i1 => data_memoryOut,
		o => WriteData
	);
	
		
	The_DataMemory: entity  work.DataMemory PORT MAP(
		LoadIt => START,
		INPUT => ReadData2,
		OUTPUT => data_memoryOut,
		MEM_READ => sMemRead,
		MEM_WRITE => sMemWrite,
		ADDRESS => alu_output,
		CLK => CLK
	);

	The_SignExtender: entity work.SignExtender PORT MAP(
		data_in => sInstruction(15 downto 0) ,
		data_out => extended_sign
	);


	second_2X1_mux: entity  work.generic_2X1_mux
		generic map (n => 32)
		PORT MAP(
		s => sALUSrc ,
		i0 => ReadData2,
		i1 => extended_sign,
		o => aluMuxOut
	);
	
	
	first_2X1_mux:entity  work.generic_2X1_mux
		generic map (n => 5)
		PORT MAP(
		s => sRegDst ,
		i0 => sInstruction(20 downto 16),
		i1 => sInstruction(15 downto 11),
		o => WriteReg
	);
	
	The_Instruction_Memory: entity work.InstructionMemory PORT MAP(
		LoadIt => START,
		DATA => sInstruction,
		ADDRESS => Current_PC,
		CLK => CLK
	);
	

	alu_control_unit : entity work.ALUcontrol PORT MAP(
		Funct => sInstruction(5 downto 0),
		ALUOp => sAluOp,
		output => alu_selection
	);
		
		
	main_ALU: entity work.ALU PORT MAP(
		data1 => ReadData1,
		data2 => aluMuxOut,
		aluop => alu_selection,
		cin => alu_selection(2),  --give it the third bit as it 0 in case of add and 1 in case of sub
		dataout => alu_output,
		cflag => carry_flag,
		zflag => zero_flag,
		oflag => overflow_flag
	);

	
	regfile : entity work.RegisterFile PORT MAP(
		read_sel1 => sInstruction(25 downto 21),
		read_sel2 => sInstruction(20 downto 16),
		write_sel => WriteReg,
		write_ena => sRegWrite,
		clk => CLK,
		write_data => WriteData,
		data1 => ReadData1,
		data2 => ReadData2
	);
	
	BigControlUnit: entity work.ControlUnit PORT MAP(
		OpCode =>  sInstruction(31 downto 26),
		RegDst => sRegDst,
		Jump => sJump,
		Branch => sBranch,
		MemRead => sMemRead,
		MemtoReg => sMemtoReg,
		ALUOp => sAluOp,
		MemWrite => sMemWrite,
		ALUSrc => sALUSrc,
		RegWrite => sRegWrite 
	);

	
	-- out of maim module
	RegFileOut1 <= ReadData1;
	RegFileOut2 <= ReadData2;
	ALUOut      <= alu_output;
	PCOut       <= sReadAddress;
	DataMemOut  <= data_memoryOut;

end Behavioral;