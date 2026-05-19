# Four Bit Full Adder

## Overview
This project implements a 4-bit ripple-carry full adder using VHDL on the DE10-Lite FPGA platform.

## Features
- Structural VHDL design
- Four instantiated full adders
- Carry propagation
- Mixed-language integration with Verilog top-level wrapper

## Hardware
- Intel DE10-Lite FPGA
- Intel Quartus Prime
- ModelSim

## Inputs
- SW7-4 : Input A
- SW3-0 : Input B
- SW8   : Carry In

## Outputs
- LEDR3-0 : Sum
- LEDR4   : Carry Out