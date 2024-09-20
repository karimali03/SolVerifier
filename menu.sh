#!/bin/bash
# Purpose: Display a menu on screen


read_file(){
    read -p "Enter name of $1 file [with extension]: "  file
    until [ -f "./$1/"$file ]
    do
    echo "File not found!"
    read -p "Enter name of $1 file [with extension]: "  file
    done
}

read_files(){
    read_file "correct" ; correct=$file
    read_file "test" ; test=$file
    read_file "generator" ; generator=$file
    read_file "checker" ; checker=$file
}
