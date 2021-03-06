module bin_decimaldigit(reset, disp_sel2b, data, decimal, decimal_digit);

input reset;
input [7:0] data;
input [1:0] disp_sel2b;
input decimal;
output [3:0] decimal_digit;

reg [3:0] decimal_digit;
wire [6:0] cociente;
wire [6:0] residuo;
reg [6:0] denom;

wire [6:0] cociente_2;

always@ *
	begin
		if(!reset)
			denom = 1; // reset to no division
		else
			case(disp_sel2b)
				2'b01: denom = 7'd10; // ones
				2'b10: denom = 7'd100; // tents
				2'b11: denom = 7'd100;// hundreds
				default denom = 7'd1;
			endcase
	end

lpmdiv	lpmdiv_inst (
	.denom (denom),
	.numer (data),
	.quotient (cociente),
	.remain (residuo)
);

lpmdiv lpmdiv_inst_2 (
	.denom (7'd10),
	.numer (residuo),
	.quotient (cociente_2),
	.remain ()
);

always@(cociente, residuo, cociente_2, decimal, reset)
	begin
		if(!reset)
			decimal_digit = 0;
		else
			case(disp_sel2b)
				2'b00: decimal_digit = (decimal) ? 4'd5 : 4'd0;
				2'b01: decimal_digit = residuo[3:0];
				2'b10: decimal_digit = cociente_2[3:0];
				2'b11: decimal_digit = cociente[3:0];
				default decimal_digit = 0;
			endcase
	end

endmodule