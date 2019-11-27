module registers_tb;
    reg [2:0]addr1;reg [2:0]addr2;reg [2:0]wr_addr;
    reg rd;
    reg wr;
    reg [7:0]data_in;
    wire [7:0]data_out1;wire [7:0]data_out2;
    integer i;

registers RegUT(addr1,addr2,wr_addr,rd,wr,data_in,data_out1,data_out2);

initial
begin
$monitor ($time," addr=%d  %d, data=%d   %d",addr1,addr2,data_out1,data_out2);
    
   // #5 wr_addr=2'b00; wr=1; data_in=8'h00;
   // #5 wr=0; 
   // #5 wr_addr=2'b01; wr=1; data_in=8'h05;
   // #5 wr=0; 
   
    
    #5 addr1=2'b00; rd=1; addr2=2'b01; rd=1;   

#5 $finish;
end
endmodule