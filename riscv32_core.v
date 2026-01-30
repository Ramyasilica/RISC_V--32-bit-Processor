`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 01:35:40 PM
// Design Name: 
// Module Name: riscv32_core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module riscv32_core (
    input  wire clk,
    input  wire reset,

    // Debug outputs
    output wire [31:0] pc_dbg,
    output wire [31:0] instr_dbg,
    output wire [31:0] x1_dbg,
    output wire [31:0] x2_dbg,
    output wire [31:0] x3_dbg,
    output wire [31:0] x4_dbg
);

    // Program Counter
    reg [31:0] pc;

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'd0;
        else
            pc <= pc + 32'd4;
    end

    assign pc_dbg = pc;

    // Instruction Memory
    reg [31:0] imem [0:15];
    integer k;

    initial begin
        // Initialize all locations with NOP
        for (k = 0; k < 16; k = k + 1)
            imem[k] = 32'h00000013; // NOP (addi x0, x0, 0)

        imem[0] = 32'h00A00093; // addi x1, x0, 10
        imem[1] = 32'h01400113; // addi x2, x0, 20
        imem[2] = 32'h002081B3; // add  x3, x1, x2
        imem[3] = 32'h40110233; // sub  x4, x2, x1
    end

    wire [31:0] instr;
    assign instr = imem[pc[5:2]];
    assign instr_dbg = instr;

    // Instruction Fields
    wire [6:0] opcode = instr[6:0];
    wire [4:0] rd     = instr[11:7];
    wire [4:0] rs1    = instr[19:15];
    wire [4:0] rs2    = instr[24:20];
    wire [6:0] funct7 = instr[31:25];

    wire [31:0] imm_i = {{20{instr[31]}}, instr[31:20]};

    // Register File
    reg [31:0] regfile [0:31];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                regfile[i] <= 32'd0;
        end else begin
            case (opcode)

                7'b0010011: begin // ADDI
                    if (rd != 0)
                        regfile[rd] <= regfile[rs1] + imm_i;
                end

                7'b0110011: begin // ADD / SUB
                    if (rd != 0) begin
                        if (funct7 == 7'b0100000)
                            regfile[rd] <= regfile[rs1] - regfile[rs2];
                        else
                            regfile[rd] <= regfile[rs1] + regfile[rs2];
                    end
                end

            endcase
        end
    end

    // Debug Outputs
    assign x1_dbg = regfile[1];
    assign x2_dbg = regfile[2];
    assign x3_dbg = regfile[3];
    assign x4_dbg = regfile[4];

endmodule

