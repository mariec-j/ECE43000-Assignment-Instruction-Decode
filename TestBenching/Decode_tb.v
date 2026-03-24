`timescale 1ms / 100us

module Decode_tb();

reg CLK, RST, REGWRITE;
reg [31:0] IFID_INSTRC, IFID_NPC; // input from Fetch
reg [4:0] MEMWBLATCH_WRITEREG;
reg [31:0] WBMUX_WRITEDATA;

wire [1:0] InstructionDecode_WB;
wire [2:0] InstructionDecode_M;
wire [1:0] InstructionDecode_ALUOp;
wire InstructionDecode_ALUSrc;
wire InstructionDecode_RegDst;
wire InstructionDecode_NPC;
wire [31:0] InstructionDecode_ReadData1;
wire [31:0] InstructionDecode_ReadData2;
wire [31:0] InstructionDecode_SignExtend;
wire [4:0] InstructionDecode_Instr_2016;
wire [4:0] InstructionDecode_Instr_1511;

InstructionDecode UUT(
    .clk(CLK), .rst(RST), .RegWrite(REGWRITE),
    .IFID_instruction(IFID_INSTRC),
    .IFID_NPC(IFID_NPC),
    .MemWBLatch_WriteReg(MEMWBLATCH_WRITEREG),
    .WBMux_WriteData(WBMUX_WRITEDATA),
    
    .InstructionDecode_WB(InstructionDecode_WB),
    .InstructionDecode_M(InstructionDecode_M),
    .InstructionDecode_ALUOp(InstructionDecode_ALUOp),
    .InstructionDecode_ALUSrc(InstructionDecode_ALUSrc),
    .InstructionDecode_RegDst(InstructionDecode_RegDst),
    .InstructionDecode_NPC(InstructionDecode_NPC),
    .InstructionDecode_ReadData1(InstructionDecode_ReadData1),
    .InstructionDecode_ReadData2(InstructionDecode_ReadData2),
    .InstructionDecode_SignExtend(InstructionDecode_SignExtend),
    .InstructionDecode_Instr_2016(InstructionDecode_Instr_2016),
    .InstructionDecode_Instr_1511(InstructionDecode_Instr_1511)
);

initial forever #5 CLK = ~CLK;

integer i;

initial begin
CLK = 0; RST = 0; REGWRITE = 0;
IFID_INSTRC = 32'ha00000aa;
IFID_NPC = 32'h0000000c;
MEMWBLATCH_WRITEREG = 0;
WBMUX_WRITEDATA = 32'habcdef00;
#5 RST = 1;

// testing Control.v output: Check when opcode becomes the various numbers
#10 IFID_INSTRC = 32'h000000aa; // R type
#10 IFID_INSTRC[31:26] = 6'b100011; // lw
#10 IFID_INSTRC[31:26] = 6'b101011; // sw
#10 IFID_INSTRC[31:26] = 6'b000100; // beq

// testing RegFile:
#10 REGWRITE = 1; // write to reg
MEMWBLATCH_WRITEREG = 5'd4; // write to reg 4
WBMUX_WRITEDATA = 32'habcdef00; // just here to remind what number writedata is

// iterate thru reading all the data members to check output
#10 REGWRITE = 0;
for (i = 0; i < 10; i=i+1) begin
    #10
    IFID_INSTRC[25:21] = i;
    IFID_INSTRC[20:16] = i;
end

// test sign extend
#10 IFID_INSTRC[15:0] = 16'h0bacd;

$finish;
end

endmodule