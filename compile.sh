#!/bin/bash
# Create build directory if it doesn't exist
mkdir -p build

# Show help if -h or --help is provided
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: ./compile.sh [options]"
    echo ""
    echo "Options:"
    echo "  -d          Compile documentation in addition to CV and letter"
    echo "  -h, --help  Show this help message"
    echo ""
    echo "Default: Compiles CV and letter only."
    exit 0
fi

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

# Compile docs if -d flag is provided
if [ "$1" = "-d" ]; then
    typst compile --root . docs/docs.typ build/docs.pdf --font-path template/fonts
    if [ $? -eq 0 ]; then
        echo "✅ Docs compiled successfully to build/docs.pdf"
    else
        echo "❌ Docs compilation failed"
    fi
fi