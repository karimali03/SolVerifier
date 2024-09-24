#!/bin/bash

# Function to print in black
print_black() {
    echo -e "\e[30m$1\e[0m"
}

# Function to print in red
print_red() {
    echo -e "\e[31m$1\e[0m"
}

# Function to print in green
print_green() {
    echo -e "\e[32m$1\e[0m"
}

# Function to print in yellow
print_yellow() {
    echo -e "\e[33m$1\e[0m"
}

# Function to print in blue
print_blue() {
    echo -e "\e[34m$1\e[0m"
}

# Function to print in magenta
print_magenta() {
    echo -e "\e[35m$1\e[0m"
}

# Function to print in cyan
print_cyan() {
    echo -e "\e[36m$1\e[0m"
}

# Function to print in white
print_white() {
    echo -e "\e[37m$1\e[0m"
}

# Function to print in bold black
print_bold_black() {
    echo -e "\e[1;30m$1\e[0m"
}

# Function to print in bold red
print_bold_red() {
    echo -e "\e[1;31m$1\e[0m"
}

# Function to print in bold green
print_bold_green() {
    echo -e "\e[1;32m$1\e[0m"
}

# Function to print in bold yellow
print_bold_yellow() {
    echo -e "\e[1;33m$1\e[0m"
}

# Function to print in bold blue
print_bold_blue() {
    echo -e "\e[1;34m$1\e[0m"
}

# Function to print in bold magenta
print_bold_magenta() {
    echo -e "\e[1;35m$1\e[0m"
}

# Function to print in bold cyan
print_bold_cyan() {
    echo -e "\e[1;36m$1\e[0m"
}

# Function to print in bold white
print_bold_white() {
    echo -e "\e[1;37m$1\e[0m"
}

# Example usage
print_black "This is black text"
print_red "This is red text"
print_green "This is green text"
print_yellow "This is yellow text"
print_blue "This is blue text"
print_magenta "This is magenta text"
print_cyan "This is cyan text"
print_white "This is white text"
print_bold_black "This is bold black text"
print_bold_red "This is bold red text"
print_bold_green "This is bold green text"
print_bold_yellow "This is bold yellow text"
print_bold_blue "This is bold blue text"
print_bold_magenta "This is bold magenta text"
print_bold_cyan "This is bold cyan text"
print_bold_white "This is bold white text"
