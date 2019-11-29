module pc(
    input clk,
    output [7:0]pc_data);

reg [7:0]pc;

initial
pc=0;

always @(posedge clk) 
begin
    pc=pc+1;
end
assign pc_data=pc;
endmodule // pc