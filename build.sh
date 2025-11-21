#!/bin/bash

# Build script for SearchEngine
# Usage: ./build.sh

set -e

echo "Creating build directory..."
mkdir -p build
cd build

echo "Configuring CMake..."
cmake ..

echo "Building project..."
cmake --build .

echo "Build complete! Executable is in: build/bin/SearchEngine"
echo "Run with: ./build/bin/SearchEngine"

