module registers(
    input[2:0]addr1,addr2,wr_addr,
    input rd,wr,
    input [7:0]data_in,
    output reg [7:0]data_out1,data_out2);
    
reg [7:0] r[0:7];
initial 
begin
    r[0]=8'h01;r[1]=8'h03;
end
always @(*)
begin
    if(wr)
    begin
        r[wr_addr]=data_in;
        $display("wr=r[%d]=%d",wr_addr,data_in);
    end
end
always @(*)
begin
    if(rd)
    begin
        data_out1=r[addr1];
        data_out2=r[addr2];
        $display("rd=r[%d]=%b=%d ;r[%d]=%b=%d",addr1,data_out1,data_out1,addr2,data_out2,data_out2);
        end
end



endmodule // register ram module
