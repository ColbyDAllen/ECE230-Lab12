// Implement one-hot state machine
module one_hot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] State
);

    
    //    wire Anext, Bnext, Cnext;
    //    wire Astate, Bstate, Cstate;
    wire [4:0] Next;
    
    // State[0]=A, State[1]=B, State[2]=C, State[3]=D, State[4]=E


    dff Adff(
        .Default(1'b1),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );
    
    dff Cdff(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Next[3]),
        .clk(clk),
        .reset(reset),
        .Q(State[3])
    );
    
    dff Edff(
        .Default(1'b0),
        .D(Next[4]),
        .clk(clk),
        .reset(reset),
        .Q(State[4])
    );
    

    assign z = State[2] | State[4];

    assign Next[0] = 1'b0;
    assign Next[1] = ~w & (State[0] | State[3] | State[4]);
    assign Next[2] = ~w & (State[1] | State[2]);
    assign Next[3] =  w & (State[0] | State[1] | State[2]);
    assign Next[4] =  w & (State[3] | State[4]);
    
endmodule