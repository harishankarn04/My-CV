#!/bin/bash

# delete current directory
# rm -r build

# Create build directory if it doesn't exist
mkdir -p build

# Compile CV with local fonts
typst compile --root /Users/harishankar/Desktop/My-CV --font-path template/fonts --font-path /path/to/your/custom/fonts template/cv.typ build/cv.pdf

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "✅ CV compiled successfully to build/cv.pdf"
    # Optional: Open the PDF automatically (uncomment if desired)
    # open build/cv.pdf
else
    echo "❌ Compilation failed"
    exit 1
fi