#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Clean previous builds by removing the object directory
rm -rf obj_dir

# Create the object directory if it doesn't exist
mkdir -p obj_dir

# Compile the Verilog and C++ files using Verilator with tracing enabled
verilator --cc circuit_1.v sim_main.cpp --exe --trace --build

# if successful, clear screen, otherwise exit
if [ $? -eq 0 ]; then
    clear
else
    echo
    echo "Compilation failed!"
    exit 1
fi

echo "Compilation successful!"
echo 

# Run the simulation
./obj_dir/Vcircuit_1
