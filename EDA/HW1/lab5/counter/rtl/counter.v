module counter(clk,rst,ctrl,qout);

    input wire clk,rst,ctrl;
    output reg [2:0]qout;
    
    always @(posedge clk or negedge rst)
        if(!rst)
            qout <= 3'b000;
        else if(~ctrl)
            qout <= qout + 1'b1;
        else
            qout <= qout - 1'b1;
endmodule