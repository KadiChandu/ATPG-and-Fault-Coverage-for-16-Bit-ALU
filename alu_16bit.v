module alu_16bit (
    input [15:0] a,
    input [15:0] b,
    input [1:0] alu_sel,
    output [15:0] result,
    output cout );
    wire [15:0] carry;
    wire cin;
    assign cin = (alu_sel == 2'b11) ? 1'b1 : 1'b0;
    alu_1bit alu0  (.a(a[0]),  .b(b[0]),  .cin(cin),         .alu_sel(alu_sel), .result(result[0]),  .cout(carry[0]));
    alu_1bit alu1  (.a(a[1]),  .b(b[1]),  .cin(carry[0]),    .alu_sel(alu_sel), .result(result[1]),  .cout(carry[1]));
    alu_1bit alu2  (.a(a[2]),  .b(b[2]),  .cin(carry[1]),    .alu_sel(alu_sel), .result(result[2]),  .cout(carry[2]));
    alu_1bit alu3  (.a(a[3]),  .b(b[3]),  .cin(carry[2]),    .alu_sel(alu_sel), .result(result[3]),  .cout(carry[3]));
    alu_1bit alu4  (.a(a[4]),  .b(b[4]),  .cin(carry[3]),    .alu_sel(alu_sel), .result(result[4]),  .cout(carry[4]));
    alu_1bit alu5  (.a(a[5]),  .b(b[5]),  .cin(carry[4]),    .alu_sel(alu_sel), .result(result[5]),  .cout(carry[5]));
    alu_1bit alu6  (.a(a[6]),  .b(b[6]),  .cin(carry[5]),    .alu_sel(alu_sel), .result(result[6]),  .cout(carry[6]));
    alu_1bit alu7  (.a(a[7]),  .b(b[7]),  .cin(carry[6]),    .alu_sel(alu_sel), .result(result[7]),  .cout(carry[7]));
    alu_1bit alu8  (.a(a[8]),  .b(b[8]),  .cin(carry[7]),    .alu_sel(alu_sel), .result(result[8]),  .cout(carry[8]));
    alu_1bit alu9  (.a(a[9]),  .b(b[9]),  .cin(carry[8]),    .alu_sel(alu_sel), .result(result[9]),  .cout(carry[9]));
    alu_1bit alu10 (.a(a[10]), .b(b[10]), .cin(carry[9]),    .alu_sel(alu_sel), .result(result[10]), .cout(carry[10]));
    alu_1bit alu11 (.a(a[11]), .b(b[11]), .cin(carry[10]),   .alu_sel(alu_sel), .result(result[11]), .cout(carry[11]));
    alu_1bit alu12 (.a(a[12]), .b(b[12]), .cin(carry[11]),   .alu_sel(alu_sel), .result(result[12]), .cout(carry[12]));
    alu_1bit alu13 (.a(a[13]), .b(b[13]), .cin(carry[12]),   .alu_sel(alu_sel), .result(result[13]), .cout(carry[13]));
    alu_1bit alu14 (.a(a[14]), .b(b[14]), .cin(carry[13]),   .alu_sel(alu_sel), .result(result[14]), .cout(carry[14]));
    alu_1bit alu15 (.a(a[15]), .b(b[15]), .cin(carry[14]),   .alu_sel(alu_sel), .result(result[15]), .cout(cout));
endmodule
