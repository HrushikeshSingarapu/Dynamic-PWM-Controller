

module pwm_core #(
    parameter WIDTH = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire [WIDTH-1:0] duty,
    input  wire [WIDTH-1:0] period,
    output reg  pwm_out,
    output wire rollover
);

reg [WIDTH-1:0] counter;

assign rollover = (counter == period);

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 0;
    else if (counter >= period)
        counter <= 0;
    else
        counter <= counter + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        pwm_out <= 0;
    else if (counter < duty)
        pwm_out <= 1;
    else
        pwm_out <= 0;
end

endmodule
