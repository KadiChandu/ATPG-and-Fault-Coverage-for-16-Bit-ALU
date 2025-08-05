module alu_16bit_tb;
    reg [15:0] a, b;
    reg [1:0] alu_sel;
    wire [15:0] result_golden, result_faulty;
    wire cout_golden, cout_faulty;
    reg [15:0] fault_mask_a, fault_value_a;
    alu_16bit alu_golden (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .result(result_golden),
        .cout(cout_golden) );
    //  a is fault-injectable in this)
    alu_16bit_fault_injection alu_faulty (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .fault_mask_a(fault_mask_a),
        .fault_value_a(fault_value_a),
        .result(result_faulty),
        .cout(cout_faulty) );
    integer i;
    initial begin
        $display("Starting ATPG...");
        // ATPG test pattern (ADD)
        a = 16'hAAAA; 
        b = 16'h5555; 
        alu_sel = 2'b10; 
        fault_mask_a = 0; 
        fault_value_a = 0; 
        #10;
        $display("No fault: Result = %h", result_faulty);
        // Inject stuck-at-1 at a[5]
        fault_mask_a = 16'b0000000000100000;
        fault_value_a = 16'b0000000000100000; 
        #10;
        if (result_faulty !== result_golden)
            $display("Fault detected at a[5] SA1");
        else
            $display("Fault NOT detected at a[5] SA1");
        for (i = 0; i < 16; i = i + 1) begin
            a = $random;
            b = $random;
            alu_sel = 2'b10;
            fault_mask_a = 0;
            fault_value_a = 0;
            #10;
            result_check: assert (result_faulty == result_golden) 
                else $fatal("Mismatch at i=%0d", i);
            // SA0
            fault_mask_a[i] = 1'b1;
            fault_value_a[i] = 1'b0;
            #10;
            if (result_faulty !== result_golden)
                $display("SA0 fault detected at a[%0d]", i);
            // SA1
            fault_value_a[i] = 1'b1;
            #10;
            if (result_faulty !== result_golden)
                $display("SA1 fault detected at a[%0d]", i);
            fault_mask_a = 0;
        end
        $display("ATPG complete.");
        $finish;
    end
endmodule
