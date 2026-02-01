
`timescale 1ns/1ps

module tb_pwm_core;

reg clk;
reg rst;
reg [7:0] duty;
reg [7:0] period;
wire pwm_out;
wire rollover;

pwm_core #(8) uut (
    .clk(clk),
    .rst(rst),
    .duty(duty),
    .period(period),
    .pwm_out(pwm_out),
    .rollover(rollover)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    duty = 8'd64;
    period = 8'd127;

    #20 rst = 0;

    #2000 $finish;
end

endmodule
