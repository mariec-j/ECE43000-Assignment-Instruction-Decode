`timescale 1ns / 1ps

/*
Input:
+WB[1:0]
+M[2:0]
+ALUOp[1:0]
+ALUSrc
+RegDst
+IFID_Fetch_Latch_NPC
+ReadData1[31:0]
+ReadData2[31:0]
+SignExtend[31:0]
+Instr_2016[4:0]
+Instr_1511[4:0]
+clk
+rst

Output:
-IDEX_Latch_WB[1:0]
-IDEX_Latch_M[2:0]
-IDEX_Latch_ALUOp[1:0]
-IDEX_Latch_ALUSrc
-IDEX_Latch_RegDst
-IDEX_Latch_NPC
-IDEX_Latch_ReadData1[31:0]
-IDEX_Latch_ReadData2[31:0]
-IDEX_Latch_SignExtend[31:0]
-IDEX_Latch_Instr_2016[4:0]
-IDEX_Latch_Instr_1511[4:0]
*/

module ID_EX_Latch(
    //Inputs
//Input:
input WB[1:0]
input M[2:0]
input ALUOp[1:0]
input ALUSrc
input RegDst
input IFID_Fetch_Latch_NPC
input ReadData1[31:0]
input ReadData2[31:0]
input SignExtend[31:0]
input Instr_2016[4:0]
input Instr_1511[4:0]
input clk
input rst

//Output:
output IDEX_Latch_WB[1:0]
output IDEX_Latch_M[2:0]
output IDEX_Latch_ALUOp[1:0]
output IDEX_Latch_ALUSrc
output IDEX_Latch_RegDst
output IDEX_Latch_NPC
output IDEX_Latch_ReadData1[31:0]
output IDEX_Latch_ReadData2[31:0]
output IDEX_Latch_SignExtend[31:0]
output IDEX_Latch_Instr_2016[4:0]
output IDEX_Latch_Instr_1511[4:0]
    );

//basic latch  format 
/*
    always @(posedge or clk or posedge rst) begin
        if (rst) begin
        q <= 1'b0; //output
        end
        else begin
if (clk) begin
              //output  q <= d; //input
            end
        end
    end
*/

//latch 
always @(posedge clk or posedge rst)begin
    if(rst)begin
 IDEX_Latch_WB <= 2'b0;
 IDEX_Latch_M <= 3'b0;
 IDEX_Latch_ALUOp <= 2'b0;
 IDEX_Latch_ALUSrc
 IDEX_Latch_RegDst
 IDEX_Latch_NPC
 IDEX_Latch_ReadData1<= 32'b0;
 IDEX_Latch_ReadData2 <= 32'b0;
 IDEX_Latch_SignExtend <= 32'b0;
 IDEX_Latch_Instr_2016 <= 5'b0;
 IDEX_Latch_Instr_1511 <= 5'b0
    end
end

if(clk)begin
     IDEX_Latch_WB <= WB;
 IDEX_Latch_M <= M;
 IDEX_Latch_ALUOp <= ALUOp;
 IDEX_Latch_ALUSrc
 IDEX_Latch_RegDst
 IDEX_Latch_NPC
 IDEX_Latch_ReadData1<= ReadData1;
 IDEX_Latch_ReadData2 <= ReadData2;
 IDEX_Latch_SignExtend <= SignExtend;
 IDEX_Latch_Instr_2016 <= Instr_2016;
 IDEX_Latch_Instr_1511 <= Instr_1511;
end
endmodule
