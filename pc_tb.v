module pc_tb;

reg  clk;
wire [15:0]pc_data;

pc pcUT(clk,pc_data);

initial
begin
    $monitor ($time,"pc= %d",pc_data);
    #5 clk=0;#5 clk=1;
    #5 clk=0;#5 clk=1;
    #5 clk=0;#5 clk=1;
    #5 clk=0;#5 clk=1;
    
#5 $finish;
end
endmodule // pc_tb