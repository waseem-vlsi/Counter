
module clock_divider(
input clk,rst,
output reg clk_dummy,
output reg [3:0]cnt ) ;
reg [31:0]count;

always@(posedge clk)
begin
if(rst == 1'b1)
count = 32'd0;
else if (count == 32'd49999999)
count = 32'd0;
else
count = count +32'd1;

end
always@(posedge clk)
begin
if(rst == 1'b1)
clk_dummy <= 1'b0;
else if(count ==  32'd49999999)
clk_dummy <= ~ clk_dummy;
end
endmodule

module down_counter(
input clk_dummy,rst,enable,
output reg [3:0]count_down);

always@(posedge clk_dummy or posedge rst)
begin 
if( rst)
count_down <= 4'd15;
else if(enable)
count_down <= count_down -4'd1;
end 
endmodule


module up_counter(
input clk_dummy,rst, enable,
output reg [3:0]count_up);
always@(posedge clk_dummy or posedge rst )
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
  
module up_down_counter_with_clk_divider(
input sel,clk,rst,enable,
output [3:0]count_up, count_down);
wire out1,out2, clk_dummy;
d_mux s3( .enable(enable), .sel(sel), .out1(out1), .out2(out2));
 up_counter s1(.clk_dummy(clk_dummy),.enable(out1),.rst(rst), .count_up(count_up)); 
 down_counter s2(.clk_dummy(clk_dummy),.enable(out2), .rst(rst), .count_down(count_down));

endmodule

