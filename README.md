# Controller-for-Traffic-Signals
## Overview

This project implements a parameterized traffic light controller for a two-way intersection using Verilog. The design uses a finite state machine (FSM) with configurable timing for green, yellow, and red lights. It includes a comprehensive testbench with waveform (VCD) generation for simulation and verification.

The project demonstrates best practices in digital circuit design, FSM implementation, and verification, making it an excellent example of hardware design skills using Verilog.

## Features

- Parameterized timing for green, yellow, and red light durations  
- Counter-based state transitions for realistic timing control  
- Clear state encoding using Verilog parameters  
- Separation of state transition logic and output logic  
- Comprehensive testbench with reset, sensor stimulus, and output verification  
- VCD waveform generation for detailed simulation analysis  

## Repository Structure
.
├── traffic_light_fsm.v      # Main FSM module
├── tb_traffic_light_fsm.v   # Testbench for verification
└── README.md                # Project documentation

## Getting Started

### Prerequisites

- Verilog simulator such as Icarus Verilog, ModelSim, or Vivado  
- GTKWave or any VCD viewer for waveform analysis  

### Running the Simulation

 Clone the repository:


 Open the generated waveform file:


 
## Design Details

### FSM States

| State                  | Description                   |
|------------------------|-------------------------------|
| `S_HW_GREEN_LANE_RED`  | Highway green, lane red        |
| `S_HW_YELLOW_LANE_RED` | Highway yellow, lane red       |
| `S_HW_RED_LANE_GREEN`  | Highway red, lane green        |
| `S_HW_RED_LANE_YELLOW` | Highway red, lane yellow       |

### Parameters

- `GREEN_TIME`: Duration of green light (default 20 clock cycles)  
- `YELLOW_TIME`: Duration of yellow light (default 5 clock cycles)  
- `RED_TIME`: Duration of red light (default 20 clock cycles)  

### Inputs and Outputs

| Signal   | Direction | Description                          |
|----------|-----------|------------------------------------|
| `clk`    | Input     | System clock                       |
| `reset`  | Input     | Asynchronous reset                 |
| `sensor` | Input     | Lane vehicle sensor (1 = detected) |
| `highway`| Output    | Highway traffic light (2-bit code) |
| `lane`   | Output    | Lane traffic light (2-bit code)    |

## Testbench Features

- Applies reset and sensor stimuli  
- Monitors and displays state and output changes  
- Generates VCD waveform file for detailed inspection  
- Verifies correct FSM operation under various conditions  


*This project showcases practical Verilog skills in digital FSM design and verification, suitable for academic portfolios and internship applications.*  


