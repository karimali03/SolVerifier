#!/bin/bash
source scripts/compile_file.sh
source scripts/read_input.sh
source scripts/print_output.sh
source scripts/utils.sh
source scripts/colors.sh
source scripts/run_file.sh


if [ ! -d "./bin" ]; then
    mkdir bin
fi

if [ -z "$1" ]; then
    read_input
else 
    if [ -z $2 ] || [ -z $3 ] || [ -z $4 ] || [ -z $5 ]; then
        print_bold_red "Error : there should be 5 arguments"
        print_yellow "Usage: ./script.sh <correct_solution> <test_solution> <generator> <checker> <number_of_test_cases>"
        exit 1
    fi
    is_exist $1 "correct_solution" ; correct=$1
    is_exist $2 "test_solution" ; test=$2
    is_exist $3 "generator" ; generator=$3
    is_exist $4 "checker" ; checker=$4
    is_number $5 ; t=$5
fi


print_cyan "Compiling all files......"
compile_file "./correct_solution/$correct"  ; correct_exe=$filename
compile_file "./test_solution/$test" ; test_exe=$filename
compile_file "./generator/$generator" ; generator_exe=$filename
compile_file "./checker/$checker"  ; checker_exe=$filename
wait 


print_bold_green "All files compiled successfully"


echo "# SolVerifier Results" > ./results/result.md
echo "# SolVerifier Wrong Tests" > ./results/wrong.md

test_sum=0
correct_sum=0
min_test_time=1000000
max_test_time=0
min_correct_time=1000000
max_correct_time=0

print_cyan "Running test cases......"
for ((i=1; i<=t; i++))
do
    $generator_exe ${i} > stream/input.in 
    if [ $? -gt 0 ]; then
        print_bold_red "Generator failed"
        exit 1
    fi
    correct_time=$(run_correct &) ; test_time=$(run_test &)  ; wait

    test_sum=$(  add $test_sum $test_time )
    min_test_time=$( min $test_time $min_test_time )
    max_test_time=$( max $test_time $max_test_time ) 

    correct_sum=$( add $correct_sum $correct_time )
    min_correct_time=$( min $correct_time $min_correct_time )
    max_correct_time=$( max $correct_time $max_correct_time )

    $checker_exe ./stream/input.in ./stream/test_output.out ./stream/correct_output.out > ./stream/checker_output.out 2>&1
    print_output ./results/result.md ./results/wrong.md $i ./stream/checker_output.out $correct_time $test_time
done

avg_correct=$(  divide $correct_sum $t )
avg_test=$(  divide $test_sum $t )

print_statistics ./results/statistics.md $avg_correct $min_correct_time $max_correct_time $avg_test $min_test_time $max_test_time $t

print_bold_green "Testing completed successfully"
print_cyan "Test Solution Passed : $passed / $t test"
print_cyan "See the Results folder for further details."
