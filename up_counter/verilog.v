

module up_counter(
input [3:0]d_in,
input clk,rst,
output reg [3:0]count);


always@(posedge clk)
begin
if(rst)
  count <= 1'b0;
  else 
  count <= count + 1'b1;
  end
  endmodule
