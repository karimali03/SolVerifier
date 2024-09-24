#!/bin/bash
# Purpose: Compile a file based on its extension

compile(){
       # Compile based on the file extension
    case "$extension" in
    c)
        # Compile C files
        gcc "$1" -o "$filename"
        if [ $? -gt 0 ]; then
        print_red "Failed to compile $filename"
        exit 1
        fi
        ;;
    cpp)
        # Compile C++ files
        g++ "$1" -o "$filename"
        if [ $? -gt 0 ]; then
        print_red "Failed to compile $filename"
        exit 1
        fi
        ;;
    java)
        # Compile Java files
        javac "$1"
        if [ $? -gt 0 ]; then
        print_red "Failed to compile $filename"
        exit 1
        fi
        ;;
    py)
        filename="python3 $1"
        # No need to compile Python files
        ;;
    js|ts)
        filename="node $1"
        # No need to compile Java/Type Script files
        ;;
    *)
        print_red "Unsupported file type: .$extension"
        exit 1
        ;;
    esac
}


compile_file(){
    filepath="$1"
    first=${filepath#*/} ; first=${first%/*}
    second=${filepath##*/} ; second=${second%.*}
    filename="bin/$first-$second"
    extension="${filepath##*.}"
    compile $filepath &
}
