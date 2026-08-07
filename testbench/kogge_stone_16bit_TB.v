`timescale 1ns/1ps
module tb_kogge_stone_16bit;

    reg  [15:0] A, B;
    reg         CIN, CLK, RST_N;
    wire [15:0] SUM;
    wire        COUT;

    kogge_stone_16bit uut (
        .A(A),
        .B(B),
        .CIN(CIN),
        .CLK(CLK),
        .RST_N(RST_N),
        .SUM(SUM),
        .COUT(COUT)
    );

    // Clock generation: 100 MHz => 10 ns period

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    // Corner Test sequence and some general tests

    initial begin
        $dumpfile("kogge_stone_16bit.vcd");
        $dumpvars(0, tb_kogge_stone_16bit);

        // Reset
        RST_N = 0;
        A = 0; B = 0; CIN = 0;
        #20;
        RST_N = 1;

        @(posedge CLK);
        A = 16'h0000; B = 16'h0000; CIN = 0;

        @(posedge CLK);
        A = 16'h0001; B = 16'h0001; CIN = 0;

        @(posedge CLK);
        A = 16'hFFFF; B = 16'h0001; CIN = 0;

        @(posedge CLK);
        A = 16'h1234; B = 16'h4321; CIN = 0;

        @(posedge CLK);
        A = 16'hAAAA; B = 16'h5555; CIN = 0;

        @(posedge CLK);
        A = 16'hFFFF; B = 16'h0001; CIN = 1; 

        @(posedge CLK);
        A = 16'h1234; B = 16'h4321; CIN = 1; 

        @(posedge CLK);
        A = 16'h0FFF; B = 16'h0001; CIN = 1; 

        @(posedge CLK);
        A = 16'h0000; B = 16'h0000; CIN = 1; 

        @(posedge CLK);
        A = 16'hAAAA; B = 16'hAAAA; CIN = 0;
        #100;
        $finish;
    end

endmodule
