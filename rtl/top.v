
module top #(
    parameter WIDTH = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire [WIDTH-1:0] duty_new,
    input  wire [WIDTH-1:0] period_new,
    output wire pwm_out
);

wire [WIDTH-1:0] duty_reg;
wire [WIDTH-1:0] period_reg;
wire rollover;

register_manager #(WIDTH) u_reg_mgr (
    .clk(clk),
    .rst(rst),
    .rollover(rollover),
    .duty_new(duty_new),
    .period_new(period_new),
    .duty_reg(duty_reg),
    .period_reg(period_reg)
);

pwm_core #(WIDTH) u_pwm_core (
    .clk(clk),
    .rst(rst),
    .duty(duty_reg),
    .period(period_reg),
    .pwm_out(pwm_out),
    .rollover(rollover)
);

endmodule
