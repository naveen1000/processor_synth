module test;

integer i;
reg [7:0] memory [0:255]; // 8 bit memory with 16 entries

initial begin
    for (i=0; i<255; i++) begin
        memory[i] = i;
    end
    $writememb("memory_binary.txt", memory);
    $writememh("memory_hex.txt", memory);
end

endmodule // test
