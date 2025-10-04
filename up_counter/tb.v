
module up_counter_tb(  );
reg rst,clk;
reg [3:0]d_in;
wire [3:0]count;
up_counter dut(.d_in(d_in), .rst(rst), .clk(clk), .count(count));
initial
begin 
clk = 1'b0;
forever 
clk = #5 ~clk;
end
initial
begin 
d_in = 3'b0011;
 rst = 1'b1;
 #200 rst = 1'b0;
end
endmodule
