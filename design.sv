// Bitwise operations
module not16(A, out);
  input [15:0] A;
  output [15:0] out;
  not not0(out[0], A[0]);
  not not1(out[1], A[1]);
  not not2(out[2], A[2]);
  not not3(out[3], A[3]);
  not not4(out[4], A[4]);
  not not5(out[5], A[5]);
  not not6(out[6], A[6]);
  not not7(out[7], A[7]);
  not not8(out[8], A[8]);
  not not9(out[9], A[9]);
  not not10(out[10], A[10]);
  not not11(out[11], A[11]);
  not not12(out[12], A[12]);
  not not13(out[13], A[13]);
  not not14(out[14], A[14]);
  not not15(out[15], A[15]);
endmodule
  
// Adders
module halfAdder(A, B, carry, result);
  input A, B;
  output carry, result;
  xor resultGate(result, A, B);
  and carryGate(carry, A, B);
endmodule

module fullAdder(A, B, carryIn, sum, carryOut);
  input A, B, carryIn;
  output carryOut, sum;
  wire sumB, carryOut1, carryOut2;
  halfAdder add1(A, B, carryOut2, sumB);
  halfAdder add2(carryIn, sumB, carryOut1, sum);
  or carryOut3(carryOut, carryOut1, carryOut2);
endmodule

module add16(A, B, out, carryIn);
  input [15:0] A, B;
  input [0:0] carryIn;
  output [15:0] out;
  wire carry1, carry2, carry3, carry4, carry5, carry6, carry7, carry8, carry9, carry10, carry11, carry12, carry13, carry14, carry15, overflow;
  fullAdder start(A[0], B[0], carryIn, out[0], carry1);
  fullAdder add1(A[1], B[1], carry1, out[1], carry2);
  fullAdder add2(A[2], B[2], carry2, out[2], carry3);
  fullAdder add3(A[3], B[3], carry3, out[3], carry4);
  fullAdder add4(A[4], B[4], carry4, out[4], carry5);
  fullAdder add5(A[5], B[5], carry5, out[5], carry6);
  fullAdder add6(A[6], B[6], carry6, out[6], carry7);
  fullAdder add7(A[7], B[7], carry7, out[7], carry8);
  fullAdder add8(A[8], B[8], carry8, out[8], carry9);
  fullAdder add9(A[9], B[9], carry9, out[9], carry10);
  fullAdder add10(A[10], B[10], carry10, out[10], carry11);
  fullAdder add11(A[11], B[11], carry11, out[11], carry12);
  fullAdder add12(A[12], B[12], carry12, out[12], carry13);
  fullAdder add13(A[13], B[13], carry13, out[13], carry14);
  fullAdder add14(A[14], B[14], carry14, out[14], carry15);
  fullAdder add15(A[15], B[15], carry15, out[15], overflow);
  
endmodule

module subtract16(A, B, out);
    input [15:0] A, B;
    output [15:0] out;
    wire [15:0] invertB;
    not16 invert(B, invertB);
    add16 add(A, invertB, out, 1);
endmodule 