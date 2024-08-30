module mux (
  input   wire [7:0]    a_i,
  input   wire [7:0]    b_i,
  input   wire          sel_i,
  output  wire [7:0]    y_o
);
  // Mux logic
  assign y_o = (sel_i) ? b_i : a_i;
endmodule


// TESTBENCH

module mux_tb();
  logic [7:0] a_i, b_i;
  logic sel_i;
  logic [7:0] y_o;

  // Instantiate the mux module
  mux m1 (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );

  initial begin
    // Test different cases
    for(int i=0; i<10; i++) begin
      a_i = $urandom_range(0, 8'h77);
      b_i = $urandom_range(0, 8'hFF);
      sel_i = $random % 2;
      #5;
    end
    $finish;
  end
endmodule



