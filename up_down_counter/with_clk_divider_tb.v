
module up_down_counter_with_clk_divider_tb();
reg sel,rst,enable,clk;
wire [3:0]count_up, count_down;
 up_down_counter_with_clk_divider DUT ( .clk(clk), .rst(rst),  .sel(sel),.enable(enable), .count_up(count_up), .count_down(count_down));
 initial
 begin
 clk = 1'b0;
 forever
 #5 clk = ~clk;
 end
 
 initial
 begin 
 rst = 1'b1;enable = 1'b0;
 #10 rst = 1'b0;enable = 1'b1; sel = 1'b0;
 #20 sel = 1'b0;enable = 1'b1; rst = 1'b0;
 #20 sel = 1'b1;enable = 1'b1; rst = 1'b0;
 #20 $finish;
 end 
 initial 
 begin
 $monitor("$time = %0t clk = %b enable = %b count_up = %b count_down = %b", $time, clk,enable, count_up, count_down);
 end 
endmodule

