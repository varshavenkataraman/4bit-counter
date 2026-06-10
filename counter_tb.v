`timescale 1ns/1ps

module counter_tb;
    reg clk, reset;
    wire [3:0] count;

    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_tb);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        #15 reset = 0;
        #200 $finish;
    end

    initial begin
        $monitor("Time=%0t reset=%b count=%d", $time, reset, count);
    end
endmodule