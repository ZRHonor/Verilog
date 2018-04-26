module test_counter();

    reg clk,rst,ctrl;
    wire [2:0]qout;
    
    counter inst(clk,rst,ctrl,qout);
    
    initial
    begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    
    initial
    begin
        rst = 1'b1;
        ctrl = 1'b0;
        #20 rst = 1'b0;
        #40 rst = 1'b1;
        
        #200 ctrl = 1'b1;
        #300 ctrl = 1'b0;
        #1000 $finish;
    end
endmodule