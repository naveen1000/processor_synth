module control_unit(
    input [15:0]ir_data,
    input cy,zero,
    output reg [2:0]addr1,addr2,wr_addr,
    output reg wr,rd,
    output reg [2:0]alu_ctrl  
);

wire [7:0]data_in,data_out,data_out1,data_out2,alu_out;
alu DUT(alu_ctrl,data_out1,data_out2,alu_out,cy,zero);
registers RegUT(addr1,addr2,wr_addr,rd,wr,alu_out,data_out1,data_out2);

always @(ir_data) 
begin
    case(ir_data[15:12])
        4'b0000: //add
            begin
            addr1=ir_data[5:4]; rd=1;addr2=ir_data[1:0]; rd=1;
            alu_ctrl = ir_data[15:13]; 
            $display("add executed");
            #5wr_addr=ir_data[9:8]; wr=1;rd=0;
            $display("written back");
            end


    endcase
end
endmodule // 