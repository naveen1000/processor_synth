module tb_main;
integer i;
//alu_tb
reg [2:0]opcode;
reg [7:0]A,B;
wire [7:0]alu_out;
wire cy,zero;
alu DUT(opcode,A,B,alu_out,cy,zero);
//reg_tb
reg [2:0]addr;
reg rd;
reg wr;
reg [7:0]data_in;
wire [7:0]data_out;
registers RegUT(addr,rd,wr,data_in,data_out);
//IR_tb
reg [7:0]pc;
reg en;
wire [15:0]ir_data;
inst_reg IUT(pc,en,ir_data);

//cu_tb

 
//control_unit CUT(ir_data,addr,data_in,wr,rd,opcode);

initial
begin
    $monitor ($time," A=%d, B=%d,alu_out=%d,sel=%d,ir_data=%b",A,B,alu_out,addr,ir_data);
        for (i=0; i<256; i=i+1)
        begin
            #5 pc=i;en=1;$display("%d",i);#5 



        case(ir_data[15:12])
            4'b1000: //load 
                begin
                    addr=ir_data[9:8]; wr=1; data_in=ir_data[7:0];
                    #5 wr=0;
                end
            4'b0000: //add
                begin
                addr=ir_data[5:4]; rd=1;
                #5 A=data_out;
                addr=ir_data[1:0]; rd=1;
                #5 B=data_out;
                #5 opcode = ir_data[15:13];
                $display("add executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b0001: //sub
                begin
                addr=ir_data[5:4]; rd=1;
                #5 A=data_out;
                addr=ir_data[1:0]; rd=1;
                #5 B=data_out;
                #5 //$display("opcode=%b",ir_data[14:12]);
                #5 opcode = ir_data[14:12];
                $display("sub executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b1111: //JMP
                begin
                $display("jmp executed");
                i=ir_data[7:0]-1;
                end
            4'b1010: //INC
                begin
                addr=ir_data[9:8]; rd=1;
                #5 A=data_out;
                //addr=ir_data[1:0]; rd=1;
                #5 B=8'h01;
                #5 opcode = 3'b000;
                $display("INC executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b1011: //DEC
                begin
                addr=ir_data[9:8]; rd=1;
                #5 A=data_out;
                //addr=ir_data[1:0]; rd=1;
                #5 B=8'h01;
                #5 opcode = 3'b001;
                $display("DEC executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b1100: //HLT
                begin
                $display("HLT executed");
                //To display reg contents by reading
                    #5 addr=2'b00; rd=1; 
                    #5 addr=2'b01; rd=1;   
                    #5 addr=2'b10; rd=1; 
                    #5 addr=2'b11; rd=1; 
                    #5 addr=3'b111; rd=1; 
                #5 $finish;
                end
            4'b1110: //JNZ Reg LABEL
                begin
                $display("djmp executed");
                #5 addr=ir_data[9:8]; rd=1;
                #5 A=data_out;
                #5 //$display("%d ",data_out);
                if(data_out==0)
                A=0;
                else
                #5 i=ir_data[7:0]-1;
                end
            4'b0010: //and
                begin
                addr=ir_data[5:4]; rd=1;
                #5 A=data_out;
                addr=ir_data[1:0]; rd=1;
                #5 B=data_out;
                #5 opcode = 3'b010;
                #5 $display("and executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b0011: //or
                begin
                addr=ir_data[5:4]; rd=1;
                #5 A=data_out;
                addr=ir_data[1:0]; rd=1;
                #5 B=data_out;
                #5 opcode = 3'b011;
                #5 $display("or executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b0100: //xor
                begin
                addr=ir_data[5:4]; rd=1;
                #5 A=data_out;
                addr=ir_data[1:0]; rd=1;
                #5 B=data_out;
                #5 opcode = 3'b100;
                #5 $display("exor executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b0101: //INV
                begin
                addr=ir_data[5:4]; rd=1;
                #5 A=data_out;
                #5 opcode = 3'b101;
                #5 $display("INV executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0;
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end
            4'b1101: // JC LABEL
                begin
                #5 addr=3'b111; rd=1; 
                #5 A=data_out;
                #5 //$display("%d ",data_out);
                if(data_out==8'b1000_0000)
                begin#5 i=ir_data[7:0]-1;$display("JC executed");end
                end
            4'b1001: // JZ LABEL
                begin
                #5 addr=3'b111; rd=1; 
                #5 A=data_out;
                #5 //$display("%d ",data_out);
                if(data_out==8'b0100_0000)
                begin#5 i=ir_data[7:0]-1;$display("JZ executed");end
                end
            
            4'b0111: //MOV 
                begin
                addr=ir_data[5:4]; rd=1;
                #5 
                $display("MOV executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=data_out;
                #5 wr=0; 
                end
            4'b0110: //SHL
                begin
                addr=ir_data[9:8]; rd=1;
                #5 A=data_out;
                addr=ir_data[5:4]; rd=1;
                #5 B=data_out;
                #5 opcode = 3'b111;
                $display("SHL executed");
                #5 addr=ir_data[9:8]; wr=1; data_in=alu_out;
                #5 wr=0; 
                #5 addr=3'b111; wr=1; data_in={cy,zero,6'b000000};
                #5 wr=0; 
                end

        endcase

        end    
#5 $finish;
end
endmodule