module alu(alu_ctrl,A,B,alu_out,cy,zero);
input [2:0]alu_ctrl;
input [7:0]A,B;
output reg [7:0]alu_out;
output reg  cy,zero;

always @(alu_ctrl) 
begin
case(alu_ctrl)
0: begin{cy,alu_out} = A + B;zero=(alu_out==8'b0);end//blocking
1: begin{cy,alu_out} = A - B;zero=(alu_out==8'b0);end
2: begin{cy,alu_out} = A & B;zero=(alu_out==8'h00);end
3: begin{cy,alu_out} = A | B;zero=(alu_out==8'h00);end
4: begin{cy,alu_out} = A ^ B;zero=(alu_out==8'h00);end
5: begin{cy,alu_out} = ~A;zero=(alu_out==8'h00);end
6: begin{cy,alu_out} = A>>B;zero=(alu_out==8'h00);end
7: begin{cy,alu_out} = A<<B;zero=(alu_out==8'h00);end
default: begin{cy,alu_out} = 0;zero=(alu_out==8'h00);end 
endcase
$display("%d %d %d",alu_out,A,B);

//$display($time," ALU: %b",ALUOut);
//$display($time, " Zero: %b", (ALUOut==0));
end
endmodule // alu