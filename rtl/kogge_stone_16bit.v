`timescale 1ns/1ps
module kogge_stone_16bit (
    input         CLK,
    input         RST_N,
    input  [15:0] A,
    input  [15:0] B,
    input         CIN,
    output reg [15:0] SUM,
    output reg        COUT
);

   
    // Stage 1: Input Registers
    
    reg [15:0] A_reg, B_reg;
    reg        Cin_reg;

    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            A_reg  <= 0;
            B_reg  <= 0;
            Cin_reg <= 0;
        end else begin
            A_reg  <= A;
            B_reg  <= B;
            Cin_reg <= CIN;
        end
    end

    
    // Stage 2: Kogge-Stone Generate and Propogate Logic
    
    wire [15:0] G0, P0;
    assign G0 = A_reg & B_reg;
    assign P0 = A_reg ^ B_reg;

    wire [15:0] G1, P1;
    wire [15:0] G2, P2;
    wire [15:0] G3, P3;
    wire [15:0] G4, P4;

    genvar i;

    // Stage 1 Generation of Propogate and Generate functions
    generate
        assign G1[0] = G0[0];
        assign P1[0] = P0[0];
        for (i = 1; i < 16; i = i + 1) begin : stage1
            assign G1[i] = G0[i] | (P0[i] & G0[i-1]);
            assign P1[i] = P0[i] & P0[i-1];
        end
    endgenerate

    // Stage 2 Generation of Propogate and Generate functions
    generate
        assign G2[1:0] = G1[1:0];
        assign P2[1:0] = P1[1:0];
        for (i = 2; i < 16; i = i + 1) begin : stage2
            assign G2[i] = G1[i] | (P1[i] & G1[i-2]);
            assign P2[i] = P1[i] & P1[i-2];
        end
    endgenerate

    // Stage 3 Generation of Propogate and Generate functions
    generate
        assign G3[3:0] = G2[3:0];
        assign P3[3:0] = P2[3:0];
        for (i = 4; i < 16; i = i + 1) begin : stage3
            assign G3[i] = G2[i] | (P2[i] & G2[i-4]);
            assign P3[i] = P2[i] & P2[i-4];
        end
    endgenerate

    // Stage 4 Generation of Propogate and Generate functions

    generate
        assign G4[7:0] = G3[7:0];
        assign P4[7:0] = P3[7:0];
        for (i = 8; i < 16; i = i + 1) begin : stage4
            assign G4[i] = G3[i] | (P3[i] & G3[i-8]);
            assign P4[i] = P3[i] & P3[i-8];
        end
    endgenerate

    
    // Carry and Sum Computation
    
    wire [16:0] C;
    assign C[0] = Cin_reg;

    generate
        for (i = 1; i <= 16; i = i + 1) begin : carry_gen
            assign C[i] = G4[i-1] | (P4[i-1] & C[0]);
        end
    endgenerate

    wire [15:0] SUM_comb;
    assign SUM_comb = P0 ^ C[15:0];
    wire COUT_comb = C[16];

    
    // Stage 3: Output Registers
    
    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            SUM  <= 0;
            COUT <= 0;
        end else begin
            SUM  <= SUM_comb;
            COUT <= COUT_comb;
        end
    end

endmodule
