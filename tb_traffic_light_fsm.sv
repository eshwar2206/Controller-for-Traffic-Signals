`timescale 1ns/1ps
module tb_traffic_light_fsm;
    reg clk, reset, sensor, delay_3sec;
    wire [1:0] highway, lane;
    
    traffic_light_fsm dut (
        .clk(clk),
        .reset(reset),
        .sensor(sensor),
        .delay_3sec(delay_3sec),
        .highway(highway),
        .lane(lane)
    );
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_traffic_light_fsm);
    end
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        sensor = 0;
        delay_3sec = 0;
        #12 reset = 0;
        
        // Stay in HW_GREEN_LANE_RED
        #20;
        
        // Trigger transition to HW_YELLOW_LANE_RED
        sensor = 1;
        #10 sensor = 0;
        #10;
        
        // Trigger HW_RED_LANE_GREEN
        delay_3sec = 1;
        #10 delay_3sec = 0;
        #20;
        
        // Trigger HW_RED_LANE_YELLOW
        sensor = 0;
        #10;
        
        // Return to HW_GREEN_LANE_RED
        delay_3sec = 1;
        #10 delay_3sec = 0;
        
        #30 $finish;
    end
    
    initial begin
        $monitor("Time=%0t | State=%b | HW=%b LN=%b | Sensor=%b Delay=%b",
                 $time, dut.state, highway, lane, sensor, delay_3sec);
    end
endmodule


