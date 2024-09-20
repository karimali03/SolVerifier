#!/bin/bash
# Purpose: Compile a file based on its extension

compile_file(){
    filepath="$1"
    first=${filepath#*/} ; first=${first%/*}
    second=${filepath##*/} ; second=${second%.*}
    filename="bin/$first-$second"
    extension="${filepath##*.}"
   
    
    # Compile based on the file extension
    case "$extension" in
    c)
        # Compile C files
        gcc "$1" -o "$filename"
        if [ $? -gt 0 ]; then
        echo "Failed to compile $filename"
        exit 1
        fi
        ;;
    cpp)
        # Compile C++ files
        g++ "$1" -o "$filename"
        if [ $? -gt 0 ]; then
        echo "Failed to compile $filename"
        exit 1
        fi
        ;;
    java)
        # Compile Java files
        javac "$1"
        if [ $? -gt 0 ]; then
        echo "Failed to compile $filename"
        exit 1
        fi
        ;;
    py|js)
        # No need to compile Python and JavaScript files
        ;;
    *)
        echo "Unsupported file type: .$extension"
        exit 1
        ;;
    esac
}
