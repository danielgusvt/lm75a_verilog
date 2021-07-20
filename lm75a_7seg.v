module lm75a_7seg(clk,rst_n,scl,sda,cs,seg);

input clk,rst_n; //50MHz fpga clock, negated reset, 
output scl;  //I2C clock, 250KHz
inout sda;   //I2C data
output[3:0] cs;  //7 segment display character selector
output[7:0] seg;  //7 segment display
wire[15:0] data;

I2C_READ I2C_READ(
	.clk(clk),
	.rst_n(rst_n),
	.scl(scl),
	.sda(sda),
	.data(data)
);

SEG_D SEG_D(
	.clk(clk),
	.rst_n(rst_n),
	.seg(seg),
	.data(data),
	.cs(cs)
);

endmodule
