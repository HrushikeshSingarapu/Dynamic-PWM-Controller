module register_manager #(
    parameter WIDTH = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire rollover,
    input  wire [WIDTH-1:0] duty_new,
    input  wire [WIDTH-1:0] period_new,
    output reg  [WIDTH-1:0] duty_reg,
    output reg  [WIDTH-1:0] period_reg
);

reg [WIDTH-1:0] duty_shadow;
reg [WIDTH-1:0] period_shadow;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        duty_shadow   <= 0;
        period_shadow <= 0;
    end else begin
        duty_shadow   <= duty_new;
        period_shadow <= period_new;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        duty_reg   <= 0;
        period_reg <= 0;
    end else if (rollover) begin
        if (duty_shadow <= period_shadow) begin
            duty_reg   <= duty_shadow;
            period_reg <= period_shadow;
        end
    end
end

endmodule
