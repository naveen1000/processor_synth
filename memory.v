module memory(
    input[7:0]addr,
    input rd,
    output reg [15:0]data);
    
reg [15:0] mem[0:256];

initial 
begin
    $readmemb("machine_code.mem",mem);
end

always @(*)
begin
    if(rd)
        data=mem[addr];
       // $display("%d",data);
end
endmodule // memory module
