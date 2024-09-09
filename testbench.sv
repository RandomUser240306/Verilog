module twosComplement(binary, decimal);
    input[15:0] binary;
    output integer decimal;
    assign decimal = (-1*32768*binary[15] + 16384*binary[14] + 8192*binary[13] + 4096*binary[12] + 2048*binary[11] + 1024*binary[10] + 512*binary[9] + 256*binary[8] + 128*binary[7] + 64*binary[6] + 32*binary[5] + 16*binary[4] + 8*binary[3] + 4*binary[2] + 2*binary[1] + binary[0]);
endmodule

// Example uses for $display system task
module test_display;

  reg [15:0] A, B;
  wire [15:0] result;
  integer decimalResult;
  
  subtract16 add(A, B, result);
  twosComplement parse(result, decimalResult);
  initial begin
    
    A <= 4976;
    B <= 6789;
    #10 
    $display("A: %b, B: %b", A, B);
    $display("result: %b", result);
    // Display decimal, binary, hex
    $display("Decimal: %d", decimalResult);
    $display("Binary: %b", result);
    $display("Hex: %h", result);
  
  end

endmodule