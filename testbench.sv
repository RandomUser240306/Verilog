// Example uses for $display system task
module test_display;

  reg [15:0] A, B;
  wire [15:0] result;
  
  sixteenBitAdder add(A, B, result);

  initial begin
    
    A <= 4976;
    B <= 6789;
    #10 
    $display("A: %b, B: %b", A, B);
    $display("result: %b", result);
    // Display decimal, binary, hex
    $display("Decimal: %d", result);
    $display("Binary: %b", result);
    $display("Hex: %h", result);
  
  end

endmodule