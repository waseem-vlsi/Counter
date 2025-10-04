
module down_counter(
input clk,rst,enable,
output reg [3:0]count_down);

always@(posedge clk or posedge rst)
begin 
if( rst)
count_down <= 4'd15;
else if(enable)
count_down <= count_down -4'd1;
end 
endmodule


module up_counter(
input clk,rst, enable,
output reg [3:0]count_up);
always@(posedge clk or posedge rst )
begin
if(rst)
  count_up <= 4'd0;
  else if(enable)
  count_up <= count_up + 4'd1;
  end
  endmodule
  
  
  module d_mux (
      input enable,        
      input sel,        
      output reg out1,    
      output reg out2     
  );
      always @(*) begin
          case (sel)
              1'b0: begin
                  out1 = enable;
                  out2 = 1'b0;
              end
              1'b1: begin
                  out1 = 1'b0;
                  out2 = enable;
              end
          endcase
      end
  endmodule


  
  //main module 
  
module up_down_counter(
input sel,clk,rst,enable,
output [3:0]count_up, count_down);
wire out1,out2;
d_mux s3( .enable(enable), .sel(sel), .out1(out1), .out2(out2));
 up_counter s1(.clk(clk),.enable(out1),.rst(rst), .count_up(count_up)); 
 down_counter s2(.clk(clk),.enable(out2), .rst(rst), .count_down(count_down));

endmodule
