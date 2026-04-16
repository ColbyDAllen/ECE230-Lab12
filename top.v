module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    
    wire z_onehot;
    wire z_binary;
    wire [4:0] onehot_state;    
    wire [2:0] binary_state; 
    
    one_hot oh_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_onehot),
        .State(onehot_state)
    );
    
    binary bin_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_binary),
        .State(binary_state)
    );
    
    assign led = {binary_state, onehot_state, z_binary, z_onehot};

endmodule