`timescale 1ns / 1ps

module InstructionDecode(
    input clk, rst,
    input [31:0] IF_ID_Latch_Instruction,
    
    output [1:0] InstructionDecode_WB,
    output [2:0] InstructionDecode_M,
    output [1:0] InstructionDecode_ALUOp,
    output InstructionDecode_ALUSrc,
    output InstructionDecode_RegDst,
    output InstructionDecode_NPC,
    output [31:0] InstructionDecode_ReadData1,
    output [31:0] InstructionDecode_ReadData2,
    output [31:0] InstructionDecode_SignExtend,
    output [4:0] InstructionDecode_Instr_2016,
    output [4:0] InstructionDecode_Instr_1511
);

Control c0(
    input [5:0] controlInput, //opcode
    output reg [1:0] control_WB, control_ALUOp,
    output reg [2:0] control_M,
    output reg ALUSrc, RegDst
);

SignExtend se0(
    input [15:0] signExtIn,
    output [31:0] signExtOut
);

RegisterFile rf0(
    input [4:0] readReg1, readReg2, writeReg,
    input [31:0] writeData,
    input RegWrite, clk, rst,
    
    output reg [31:0] RegFile_readData1, RegFile_readData2
);


ID_EX_Latch latch1(

//Input:
input [1:0] WB,
input [2:0] M,
input [1:0] ALUOp,
input ALUSrc,
input RegDst,
input IFID_Fetch_Latch_NPC,
input [31:0] ReadData1,
input [31:0] ReadData2,
input [31:0] SignExtend,
input [4:0] Instr_2016,
input [4:0] Instr_1511,
input clk,
input rst,

//Output:
output reg [1:0] IDEX_Latch_WB,
output reg [2:0] IDEX_Latch_M,
output reg [1:0] IDEX_Latch_ALUOp,
output reg IDEX_Latch_ALUSrc,
output reg IDEX_Latch_RegDst,
output reg IDEX_Latch_NPC,
output reg [31:0] IDEX_Latch_ReadData1,
output reg [31:0] IDEX_Latch_ReadData2,
output reg [31:0] IDEX_Latch_SignExtend,
output reg [4:0] IDEX_Latch_Instr_2016,
output reg [4:0] IDEX_Latch_Instr_1511
);

endmodule