#!/bin/bash
# Purpose: Read Input from user


read_file(){
    read -p "$(print_blue "Enter name of $1 file [with extension]: ")"  file
    until [ -f "./$1/"$file ]
    do
    print_bold_red "File not found!"
    read -p "$(print_blue "Enter name of $1 file [with extension]: ") " file
    done
}

read_input(){
    read_file "correct_solution" ; correct=$file
    read_file "test_solution" ; test=$file
    read_file "generator" ; generator=$file
    read_file "checker" ; checker=$file
    read -p "$(print_blue "Enter the number of test cases: ")" t
    until [[ $t =~ ^[1-9][0-9]*$ ]]
    do
    print_bold_red "Error: $t is not a valid test case number"
    read -p "$(print_blue "Enter the number of test cases: ")" t
    done
}
