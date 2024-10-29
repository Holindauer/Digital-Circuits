// circuit_1.v

/**
 * circuit_1 contains two input wires a and b.
 * 
 * First, a and b are NANDed to produce x.
 *
 * Then, x is NANDed with the previous output of the D Flip-Flop to produce y.
 * 
 * y is the input to the D Flip-Flop, which produces Z and Z_stored.
 *
*/
module circuit_1 (
    input wire clk,
    input wire rst,
    input wire a,
    input wire b,

    // Intermediate wires
    output wire x,
    output wire y,

    // Output of this circuit is Q from the D Flip-Flop
    output wire Z,
    output wire Z_stored
);

    // NAND of a and b
    assign x = ~(a & b);

    // NAND of x and the previous output of the D Flip-Flop (Z_stored)
    assign y = ~(x & Z_stored);

    // Instantiate D Flip-Flop
    DFF d_flip_flop (
        .d(y),
        .rst(rst),
        .clk(clk),
        .q(Z),
        .qbar(Z_stored)
    );

endmodule
