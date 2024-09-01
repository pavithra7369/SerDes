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
  
      
  

  
