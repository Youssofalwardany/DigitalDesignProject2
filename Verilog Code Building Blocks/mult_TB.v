module Multiplier_tb;
    reg clock;
    reg start;
    reg [7:0] multiplier;
    reg [7:0] multiplicand;
    wire sign;
    wire zflag;
    wire [13:0] result;

    Multiplier multiplier_inst(
        .clock(clock),
        .start(start),
        .multiplier(multiplier),
        .multiplicand(multiplicand),
        .sign(sign),
        .zflag(zflag),
        .result(result)
    );

    initial begin
        clock = 0;
        start = 0;
        multiplier = 8'd3;
        multiplicand = 8'd10;
        #10 start = 1;
        #10 start = 0;
        #200 $finish;
    end

    always #5 clock = ~clock;

    initial begin
        $dumpfile("Multiplier_tb.vcd");
        $dumpvars(0, multiplier_inst);
        #10;
    end

endmodule
