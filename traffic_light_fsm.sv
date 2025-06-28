module traffic_light_fsm(
    input clk,
    input reset,
    input sensor,
    input delay_3sec,
    output reg [1:0] highway,
    output reg [1:0] lane
);

    typedef enum reg [2:0] {
        S_HW_GREEN_LANE_RED = 3'b000,
        S_HW_YELLOW_LANE_RED= 3'b001,
        S_HW_RED_LANE_GREEN = 3'b010,
        S_HW_RED_LANE_YELLOW= 3'b011
    } state_t;

    state_t state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S_HW_GREEN_LANE_RED;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S_HW_GREEN_LANE_RED:
                next_state = state_t'(sensor ? S_HW_YELLOW_LANE_RED : S_HW_GREEN_LANE_RED);
            S_HW_YELLOW_LANE_RED:
                next_state = state_t'(delay_3sec ? S_HW_RED_LANE_GREEN : S_HW_YELLOW_LANE_RED);
            S_HW_RED_LANE_GREEN:
                next_state = state_t'(sensor ? S_HW_RED_LANE_GREEN : S_HW_RED_LANE_YELLOW);
            S_HW_RED_LANE_YELLOW:
                next_state = state_t'(delay_3sec ? S_HW_GREEN_LANE_RED : S_HW_RED_LANE_YELLOW);
            default:
                next_state = S_HW_GREEN_LANE_RED;
        endcase
    end

    always @(*) begin
        case (state)
            S_HW_GREEN_LANE_RED: {highway, lane} = {2'b10, 2'b00};
            S_HW_YELLOW_LANE_RED: {highway, lane} = {2'b01, 2'b00};
            S_HW_RED_LANE_GREEN: {highway, lane} = {2'b00, 2'b10};
            S_HW_RED_LANE_YELLOW: {highway, lane} = {2'b00, 2'b01};
            default: {highway, lane} = {2'b10, 2'b00};
        endcase
    end

endmodule
