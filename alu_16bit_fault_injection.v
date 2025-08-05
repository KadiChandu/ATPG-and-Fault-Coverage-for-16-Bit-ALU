module alu_16bit_fault_injection (
    input [15:0] a,
    input [15:0] b,
    input [1:0] alu_sel,
    input [15:0] fault_mask_a,  
    input [15:0] fault_value_a,    
    output [15:0] result,
    output cout );
    wire [15:0] a_faulty;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : fault_injection_a
            assign a_faulty[i] = (fault_mask_a[i]) ? fault_value_a[i] : a[i];
        end
    endgenerate
  alu_16bit golden_alu (
        .a(a_faulty),
        .b(b),
        .alu_sel(alu_sel),
        .result(result),
        .cout(cout)
    );
endmodule
