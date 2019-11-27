module inst_reg(
    input [7:0]pc,
    input en,
    output [15:0]ir_data);


memory MemUT(pc,en,ir_data);

endmodule 