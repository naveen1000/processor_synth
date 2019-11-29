module control_unit(
    input clk,
    input [15:0]ir_data,
    input cy,zero,
    output reg [2:0]addr1,addr2,wr_addr,
    output reg wr,rd,
    output reg [2:0]alu_ctrl  
);

always @(posedge clk) 
begin
    case(ir_data[15:12])
        4'b0000: //add
            begin
            addr1=ir_data[5:4]; rd=1;addr2=ir_data[1:0]; rd=1;
            alu_ctrl = ir_data[15:13]; 
            $display("add executed");
            #3wr_addr=ir_data[9:8]; wr=1;rd=0;
            #3wr=0;
            $display("written back");
            end
        4'b0001: //sub
            begin
            addr1=ir_data[5:4]; rd=1;addr2=ir_data[1:0]; rd=1;
            alu_ctrl = 3'b001; 
            $display("sub executed");
            #3wr_addr=ir_data[9:8]; wr=1;rd=0;
            #3wr=0;
            $display("written back");
            end
        4'b1100: //HLT
                begin
                $display("HLT executed");
                //To display reg contents by reading
                    #2 addr1=3'b000; rd=1; addr2=3'b111; rd=1;   
                    #2 rd=0;
                    #2 addr1=2'b10; rd=1; addr1=2'b11; rd=1;
                    #2 rd=0;
                #2 $finish;
                end


    endcase
end
endmodule // 