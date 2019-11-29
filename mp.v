module mp(
    input clk,
    output [15:0]ir_data
);
reg mrd;
initial 
mrd=1;
wire [7:0]pc_data;
wire [7:0]data_in,data_out,data_out1,data_out2,alu_out;
wire [2:0]addr1,addr2,wr_addr,alu_ctrl;

pc pcUT(clk,pc_data);
memory MemUT(pc_data,mrd,ir_data);
control_unit CUT(clk,ir_data,cy,zero,addr1,addr2,wr_addr,wr,rd,alu_ctrl);
alu DUT(alu_ctrl,data_out1,data_out2,alu_out,cy,zero);
registers RegUT(addr1,addr2,wr_addr,rd,wr,alu_out,data_out1,data_out2);

endmodule // mp iverilog mp_tb.v mp.v pc.v memory.v  alu.v registers.v control_unit.v