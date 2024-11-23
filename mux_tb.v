`timescale 1ns/1ns
module tb_mux;
	reg [0:0] A_1, B_1;
	reg [3:0] A_4, B_4;
	reg [4:0] A_5, B_5;
	reg [5:0] A_6, B_6;
	reg SEL;
	wire [0:0] OUT_1;
	wire [3:0] OUT_4;
	wire [4:0] OUT_5;
	wire [5:0] OUT_6;
	//scalable multiplexers
	mux #(1) mux_1(A_1, B_1, SEL, OUT_1);
	mux #(4) mux_4(A_4, B_4, SEL, OUT_4);
	mux #(5) mux_5(A_5, B_5, SEL, OUT_5);
	mux #(6) mux_6(A_6, B_6, SEL, OUT_6);

	initial begin
	$vcdpluson;
	//test case 1: 1-bit multiplexer
	A_1=1'b0;
	B_1=1'b0;
	SEL=1'b0;
	#10;
	$display("1-bit MUX-SEL=0: OUT=%b", OUT_1);
	//test case 2: 4-bit multiplexer
	A_4=4'b0000;
	B_4=4'b1111;
	SEL=1'b1;
	#10;
	$display("4-bit MUX-SEL=1: OUT=%b", OUT_4);
	//test case 3: 5-bit multiplexer
	A_5=5'b10111;
	B_5=5'b10111;
	SEL=1'bx;
	#10;
	$display("5-bit MUX-SEL=x: OUT=%b", OUT_5);
	//test case 4: 6-bit multiplexer
	A_6=6'b101011;
	B_6=6'b010100;
	SEL=1'bx;
	#10;
	$display("6-bit MUX-SEL=x: OUT=%b", OUT_6);
	$finish;
	end
endmodule
