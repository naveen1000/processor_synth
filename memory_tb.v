module memory_tb;
    reg [1:0]maddr;
    reg mrd;
    wire [15:0]data;
    integer i;

memory RegUT(maddr,mrd,data);

initial
begin
$monitor ($time," addr=%d, data=%b ",maddr,data);
    
    #5 maddr=2'b00; mrd=1; 
    #5 maddr=2'b01; mrd=1;   
    #5 maddr=2'b10; mrd=1; 
    #5 maddr=2'b11; mrd=1; 

#5 $finish;
end
endmodule