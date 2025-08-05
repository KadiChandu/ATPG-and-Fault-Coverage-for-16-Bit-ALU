module alu_1bit (
  input a,
  input b,
  input cin,
  input [1:0] alu_sel,
  output result,
  output cout );
  wire and_out , or_out , xor1 , xor2, sum , cout_add , cout_sub , not_b , b_mux , carry_sub ;
  and d1 (and_out , a, b ); // and operation
  or d2 (or_out , a , b); // or operation
  xor d3 (xor1 , a , b ); //adder
  xor d4(sum , xor1 , cin);
  and d5(cout_add_tmp1 , a , b);
  and d6(cout_add_tmp2 , cin , xor1);
  or d7(cout_add , cout_add_tmp1 , cout_add_tmp2);
  not d8(not_b , b);
  xor d9(xor2 , a , not_b);
  xor d10(sub_result , xor2 , cin);
  and d11(cout_sub_tmp1 , a , not_b);
  and d12(cout_sub_tmp2 , cin , xor2);
  or d13(cout_sub , cout_sub_tmp1 , cout_sub_tmp2);
  wire nse10 , nsel1;
  not d14 (nsel0 , alu_sel[0]);
  not d15 (nsel1 , alu_sel[1]);
  and d16 (sel0 , nsel1 , nsel0);
  and d17 (sel1 , nsel1 , alu_sel[0]);
  and d18 (sel2 , alu_sel[1] , nsel0);
  and d19 (sel3 , alu_sel[1] , alu_sel[0]);
  wire r0 , r1 , r2 , r3;
  and d20 (r0 , and_out , sel0);
  and d21 (r1 , or_out , sel1);
  and d22 (r2 , sum , sel2);
  and d23 (r3 , sub_result , sel3);
  or d24 (result , r0 , r1 , r2 , r3);
  wire c0 , c1 , c2 , c3 ;
  and d25 (c0 , 1'b0, sel0);
  and d26 (c1 , 1'b0 , sel1);
  and d27 (c2 , cout_add , sel2);
  and d28 (c3 , cout_sub , sel3);
  or d29 (cout , c0 , c1 , c2 , c3);
endmodule
