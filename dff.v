module dff(
    input Default,      // the value the flip-flop goes to when it is initialized or reset 
                        // (i.e. the startup value in simulation, and the reset value when reset = 1)
    input D,
    input clk,
    input reset,        // active-high asynchronous reset
    output reg Q
);

    initial begin
        Q <= Default;
    end

    always @(posedge clk, posedge reset) begin  // if reset goes high, Q updates immediately to Default, even without waiting for a clock edge.
                                                // pressing btnU should force the FSM back to its start state
                                                // for one-hot: back to A
                                                // for binary: back to 000
        if (reset)
            Q <= Default;
        else
            Q <= D;
    end

endmodule