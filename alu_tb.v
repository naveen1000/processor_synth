module alu_tb;
reg [2:0]alu_ctrl;
reg [7:0]A,B;
wire [7:0]alu_out;
wire cy,zero;
integer i;
alu DUT(alu_ctrl,A,B,alu_out,cy,zero);
initial
begin
$monitor ($time," A=%d, B=%d,out=%d cy=%d zero=%d  ctrl=%d",A,B,alu_out,cy,zero,alu_ctrl);
    for (i=0; i<8; i=i+1)
    begin
    #5 A=8'h00; B=8'h01; alu_ctrl=i;
    end
#5 $finish;
end
endmodule