module mux_tb();
  logic [7:0]a_i,b_i;
  logic sel_i;
  logic [7:0]y_o;
  mux m1(.*)
  initial
    begin
      for(int i=0;i<10;i++)
        begin
          a_i=$urandom_range(0,8'h77);
          b_i=$urandom_range(0,8'FF);
          sel_i=$random%2;
          #5;
        end
      $finidh();
    end
endmodule
  
  
