module alu_top(
    input CLK,
    input RESET,

    input [3:0] A,
    input [3:0] B,

    input [2:0] SEL,

    output [3:0] Y
);

wire [3:0] ALU_OUT;
wire CARRY;

alu ALU1(
    .A(A),
    .B(B),
    .SEL(SEL),
    .Y(ALU_OUT),
    .CARRY(CARRY)
);

register4 REG1(
    .CLK(CLK),
    .RESET(RESET),
    .D(ALU_OUT),
    .Q(Y)
);

endmodule