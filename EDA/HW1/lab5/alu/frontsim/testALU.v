module testALU();

    reg [7:0] A;
    reg [7:0] B;
    reg [1:0] cmd;
    reg [8:0] realresult;
    wire ovr;
    wire [7:0]result;
    wire diff;
    
    ALU inst(.A(A),
             .B(B),
             .result(result),
             .ovr(ovr),
             .cmd(cmd));

    initial
    begin
        realresult = 9'h000;
        #100 realresult = 9'h012;
        #100 realresult = 9'h1de;
        #100 realresult = 9'h046;
        #100 realresult = 9'h068;
        #100 realresult = 9'h0ff;
        #100 realresult = 9'h000;
        #100 realresult = 9'h1fe;
        #100 realresult = 9'h1fe;
        #100 realresult = 9'h000;
        #100 realresult = 9'h101;
        #100 realresult = 9'h0ff;
        #100 realresult = 9'h1fe;
        #100 realresult = 9'h0ff;
        #100 realresult = 9'h0ff;
        #100 realresult = 9'h0ff;
        #100 realresult = 9'h000;
        #1100;
    end

    assign diff = ~(realresult == {ovr , result});

    initial
    begin
        A = 8'h00;
        B = 8'h00;
        cmd = 2'b00;
        #100;
        A = 8'h12;
        B = 8'h34;
        #100 cmd = 2'b01;
        #100 cmd = 2'b10;
        #100 cmd = 2'b11;
        #100;
        cmd = 2'b00;
        A = 8'hff;
        B = 8'hff;
        #100 cmd = 2'b01;
        #100 cmd = 2'b10;
        #100 cmd = 2'b11;
        #100;
        cmd = 2'b00;
        A = 8'h00;
        B = 8'hff;
        #100 cmd = 2'b01;
        #100 cmd = 2'b10;
        #100 cmd = 2'b11;
        #100;
        cmd = 2'b00;
        A = 8'hff;
        B = 8'h00;
        #100 cmd = 2'b01;
        #100 cmd = 2'b10;
        #100 cmd = 2'b11;
        #100;
        #1000;
        $finish;
    end
endmodule
