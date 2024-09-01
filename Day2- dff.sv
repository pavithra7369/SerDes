module dff(input logic d,input logic clk,
           input logic rst, output logic q,
           output logic syncr,output logic asyncr);
  always_ff@(posedge clk)  
    q<=d;   //output for non-ressatable ff
  always_ff@(posedge clk)  // for syncrhonus reset logic
    begin
    if(rst)
      syncr<=1'd0; 
  else
   syncr <=d; // output for synchronous reset ff 
    end
  always_ff@(posedge clk or posedge rst) //for asynchronus reset logic
    begin
    if(rst)
      asyncr<=1'd0; //outpt for asynchronous reset ff
  else
    asyncr<=d;
    end 
endmodule


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// TESTBENCH
module dff_tb()
    // Declare testbench signals
    logic clk;
    logic rst;
    logic d;
    logic q;
    logic syncr;
    logic asyncr;

    // Instantiate the dff module
    dff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q),
        .syncr(syncr),
        .asyncr(asyncr)
    );

    // Clock generation
    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1'b1;
        d = 1'b0;
        // Test non-resettable D flip-flop
       @(posedge clk)
        rst=1'b0;
        d = 1'b1;
        @(posedge clk);
        d = 1'b0;
        @(posedge clk);

        // Test synchronous reset D flip-flop
        d = 1'b1;
        @(posedge clk);
        rst = 1'b1;
        @(posedge clk);
        rst = 1'b0;
        d = 1'b0;
        @(posedge clk);

        // Test asynchronous reset D flip-flop
        d = 1'b1;
        @(negedge clk);
        rst = 1'b1;
        @(posedge clk); // Asynchronous reset should set asyncr to 0
        @(posedge clk);
        rst = 1'b0;
        @(posedge clk);
        d = 1'b0;
        @(posedge clk);

        // Finish simulation
        $stop;
    end

    //initial begin
      //  $monitor("Time: %0t | d: %b | rst: %b | q: %b | syncr: %b | asyncr: %b",
       //          $time, d, rst, q, syncr, asyncr);
    //end

endmodule

           
  
      
  

  
