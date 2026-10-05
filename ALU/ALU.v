module alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] SEL,

    output reg [3:0] Y,
    output reg CARRY
);

wire [3:0] AND_OUT;
wire [3:0] OR_OUT;
wire [3:0] XOR_OUT;
wire [3:0] NOR_OUT;
wire [3:0] NOT_OUT;

wire [3:0] ADD_OUT;
wire ADD_CARRY;

logic_unit LU(
    .A(A),
    .B(B),
    .AND_OUT(AND_OUT),
    .OR_OUT(OR_OUT),
    .XOR_OUT(XOR_OUT),
    .NOR_OUT(NOR_OUT),
    .NOT_OUT(NOT_OUT)
);

adder4 ADDER(
    .A(A),
    .B(B),
    .Cin(1'b0),
    .Sum(ADD_OUT),
    .Cout(ADD_CARRY)
);

always @(*) begin

    CARRY = 1'b0;

    case(SEL)

        3'b000: Y = AND_OUT;

        3'b001: Y = OR_OUT;

        3'b010: Y = XOR_OUT;

        3'b011: Y = NOR_OUT;

        3'b100: Y = NOT_OUT;

        3'b101: begin
            Y = ADD_OUT;
            CARRY = ADD_CARRY;
        end

        3'b110: begin
            Y = A - B;
        end

        3'b111: Y = 4'b0000;

    endcase

end

endmodule