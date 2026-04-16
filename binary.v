// Implement binary state machine
module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] State
);

//    wire [1:0] State;
    wire [2:0] Next;
    
    // State[2:0]:
    // A = 000
    // B = 001
    // C = 010
    // D = 011
    // E = 100

    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );

    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );

    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );
    
    // z = 1 for C or E. C + E. 010 + 100. y2'y1y0' + y2y1'y0'.
    assign z = (~State[2] & State[1] & ~State[0]) |
               (State[2] & ~State[1] & ~State[0]);
    
    //Y2
    assign Next[2] = w & (State[2] | (State[1] & State[0]));
    
    //Y1
    assign Next[1] = ( State[0] & ~State[1]) |
                     ( State[1] & ~State[0]) |
                     ( w & ~State[1] & ~State[2]);
    
    //Y0
    assign Next[0] = (~w & ~State[1] & ~State[0]) |
                     (~w &  State[1] &  State[0]) |
                     ( w & ~State[2] & ~State[0]) |
                     ( w & ~State[2] & ~State[1]);

endmodule