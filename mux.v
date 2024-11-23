`timescale 1ns/1ns
module mux #(parameter SIZE=1) (input [SIZE-1:0] A, B, input SEL, output [SIZE-1:0] OUT);
reg[SIZE-1:0] OUT;
integer i;
	always @(*) begin
		if(SEL==1'b0)begin
		OUT=A;
		end else if(SEL==1'b1) begin
		OUT=B;
		end else begin
		for(i=0; i<SIZE; i=i+1)begin
		if(A[i]==B[i]) begin
		OUT[i]=1'bx;
		end else if (SEL==1'b0) begin
		OUT[i]=A[i];
		end else begin
		OUT[i]=B[i];
		end
	end
	end
	end
endmodule
