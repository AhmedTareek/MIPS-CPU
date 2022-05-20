library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ControlUnit is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end ControlUnit;


architecture Behavioral of ControlUnit is
	
	Signal Rtype : STD_LOGIC;
	Signal lw : STD_LOGIC;
	Signal sw : STD_LOGIC;
	Signal beq : STD_LOGIC;
	Signal bne : STD_LOGIC;
	Signal J : STD_LOGIC;

begin

	Rtype <= '1' When OpCode = "000000" Else '0';
	lw    <= '1' When OpCode = "100011" Else '0';
	sw    <= '1' When OpCode = "101011" Else '0';
	beq   <= '1' When OpCode = "000100" Else '0';
	bne   <= '1' When OpCode = "000101" Else '0';
	J     <= '1' When OpCode = "000010" Else '0';
	
	RegDst   <= Rtype;
	Jump     <= J;
	Branch   <= beq or bne;
	MemRead  <= lw;
	MemtoReg <= lw;
	ALUOp(0) <= beq or bne;
	ALUOp(1) <= Rtype;
	MemWrite <= sw;
	ALUSrc   <= lw or sw;
	RegWrite <= Rtype or lw;
	
end Behavioral;