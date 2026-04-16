# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

|Item|Description|Value|
|-|-|-|
|Summary Answers|Your writings about what you learned in this lab.|25%|
|Question 1|Your answers to the question|25%|
|Question 2|Your answers to the question|25%|
|Question 3|Your answers to the question|25%|

## Name



Colby Allen, Austin Bartram

Summary

In this lab, we learned how to implement the same finite state machine using both one-hot and binary encodings. We also practiced building next-state logic from state tables and K-maps, and saw how the two encoding methods trade off between flip-flop count and combinational logic complexity.

---

## Lab Questions

### Compare and contrast One Hot and Binary encodings

One-hot encoding uses one flip-flop per state, so it takes more flip-flops but usually makes the next-state logic simpler and easier to understand. Binary encoding uses fewer flip-flops, but the logic is more compact in hardware and usually requires more careful K-map work because each state is represented by multiple bits.

### Which method did your team find easier, and why?
Our team found one-hot encoding easier because each state had its own flip-flop, so it was more direct to see which transitions should activate each next-state equation. Binary encoding was more compact, but it took more thought because we had to track bit patterns and separate K-maps for each "next_state" bit.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
If an FPGA design has plenty of flip-flops available and we want simpler logic, one-hot encoding can be a good choice. If we need to reduce flip-flop usage, especially as the number of states grows, binary encoding is probably better since it represents more states with fewer storage elements.


