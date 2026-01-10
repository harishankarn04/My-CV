#!/bin/bash
# Create build directory if it doesn't exist
mkdir -p build

# Compile CV with local fonts
typst compile --root . --font-path template/fonts template/cv.typ build/cv.pdf
if [ $? -eq 0 ]; then
    echo "✅ CV compiled successfully to build/cv.pdf"
else
    echo "❌ CV compilation failed"
fi

# Compile letter with local fonts
typst compile --root . --font-path template/fonts template/letter.typ build/letter.pdf
if [ $? -eq 0 ]; then
    echo "✅ Letter compiled successfully to build/letter.pdf"
else
    echo "❌ Letter compilation failed"
fi