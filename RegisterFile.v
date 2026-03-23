`timescale 1ns / 1ps

module RegisterFile(
    input [5:0] readReg1, readReg2, writeReg,
    input [31:0] writeData,
    input RegWrite, clk, rst,
    
    output reg [31:0] RegFile_readData1, RegFile_readData2
);


endmodule
