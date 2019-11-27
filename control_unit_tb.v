module control_unit_tb;
    reg [15:0]ir_data;
    reg cy,zero;
    wire [2:0]addr1,addr2,wr_addr;
    wire wr,rd;
    wire [2:0]alu_ctrl;
control_unit CUT(ir_data,cy,zero,addr1,addr2,wr_addr,wr,rd,alu_ctrl);
initial
begin
    $monitor ($time,"aluctrl=%d,rd=%d, wr=%d,adr1=%d,addr2=%d,ir_data=%b",alu_ctrl,rd,wr,addr1,addr2,ir_data);
        
     #5 ir_data=16'b0000_0000_0000_0001;
  
     //iverilog control_unit_tb.v control_unit.v alu.v registers.v

     //  
     #15 $finish;
end
endmodule