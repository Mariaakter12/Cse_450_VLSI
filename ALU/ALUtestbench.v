`timescale 1ns / 1ps

module alu_tb;

reg [3:0] A;
reg [3:0] B;
reg [2:0] SEL;

wire [3:0] Y;
wire CARRY;

alu DUT(
    .A(A),
    .B(B),
    .SEL(SEL),
    .Y(Y),
    .CARRY(CARRY)
);

initial begin

    // AND
    A = 4'b1010;
    B = 4'b1100;
    SEL = 3'b000;
    #10;

    // OR
    SEL = 3'b001;
    #10;

    // XOR
    SEL = 3'b010;
    #10;

    // NOR
    SEL = 3'b011;
    #10;

    // NOT A
    SEL = 3'b100;
    #10;

    // ADD
    SEL = 3'b101;
    #10;

    // SUBTRACT
    SEL = 3'b110;
    #10;

    // ZERO
    SEL = 3'b111;
    #10;

    $stop;

end

endmodule