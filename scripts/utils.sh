# Function to find the minimum of two floating-point numbers
min() {
    if (( $(echo "$1 < $2" | bc -l) )); then
        echo "$1"
    else
        echo "$2"
    fi
}

# Function to find the maximum of two floating-point numbers
max() {
    if (( $(echo "$1 > $2" | bc -l) )); then
        echo "$1"
    else
        echo "$2"
    fi
}


# Function to add two floating-point numbers
add() {
    result=$(echo "$1 + $2" | bc -l)
    echo "$result"
}

# Function to divide two floating-point numbers
divide() {
    if (( $(echo "$2 == 0" | bc -l) )); then
        print_bold_red "Error: Division by zero"
    else
        result=$(echo "scale=2; $1 / $2" | bc -l)
        echo "$result"
    fi
}

# Function to subtract two floating-point numbers
subtract() {
    result=$(echo "$1 - $2" | bc -l)
    echo "$result"
}


# check file existence
is_exist(){
    if ! [ -f "./$2/"$1 ]
    then
        print_bold_red "$2 is not found!"
        exit 1
    fi
}


# [[ string =~ regex ]] is used to check if a string matches a regex
is_number(){
    if ! [[ $1 =~ ^[1-9][0-9]*$ ]]
    then
        print_bold_red "Error: $1 is not a valid test case number"
        exit 1
    fi
}


find_filename(){
    filepath="$1"
    name=${second%.*}
    filename="bin/$name"
    echo $filename
}