`timescale 1ns/1ps

module tb_top;

reg clk;
reg rst;
reg [7:0] duty_new;
reg [7:0] period_new;
wire pwm_out;

top #(8) uut (
    .clk(clk),
    .rst(rst),
    .duty_new(duty_new),
    .period_new(period_new),
    .pwm_out(pwm_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    duty_new = 8'd32;    // 25% duty
    period_new = 8'd127; // period

    #20 rst = 0;

    #2000;
    duty_new = 8'd96;    // Change to 75% duty

    #2000;
    period_new = 8'd63;  // Change frequency

    #3000 $finish;
end

endmodule
