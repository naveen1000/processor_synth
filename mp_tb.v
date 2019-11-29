module mp_tb;
reg clk;
wire [15:0]ir_data;

mp mpUT(clk,ir_data);

initial
begin
    $monitor ($time," pc= %b",ir_data);
    #10 clk=0;#10 clk=1;
    #10 clk=0;#10 clk=1;
    #10 clk=0;#10 clk=1;
    


#10 $finish;
end
endmodule // pc_tb