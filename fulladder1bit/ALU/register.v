module register4(
    input CLK,
    input RESET,
    input [3:0] D,
    output reg [3:0] Q
);

always @(posedge CLK) begin

    if (RESET)
        Q <= 4'b0000;

    else
        Q <= D;

end

endmodule