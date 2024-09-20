#!/bin/bash
source compile.sh
source menu.sh


read_files
echo "Compiling all files......"
compile_file "./correct/$correct" ; correct_exe=$filename
compile_file "./test/$test" ; test_exe=$filename
compile_file "./generator/$generator" ; generator_exe=$filename
compile_file "./checker/$checker" ; checker_exe=$filename
echo "All files compiled successfully"


read -p "Enter the number of test cases: " t
echo "------------ result ---------------" > ./stream/result.out
echo "------------ wrong tests ---------------" > ./stream/wrong.out

for ((i=1; i<=t; i++))
do
    echo "Running test case $i"
    $generator_exe > stream/input.in ${i}
    echo "Input test case $i" >> ./stream/result.out
    echo "Correct output :" >> ./stream/result.out
    $correct_exe < ./stream/input.in > ./stream/correct_output.out 
    cat ./stream/correct_output.out >> ./stream/result.out
    echo "Test output :" >> ./stream/result.out
    $test_exe < ./stream/input.in > ./stream/test_output.out 
    cat ./stream/test_output.out >> ./stream/result.out 
    $checker_exe ./stream/input.in ./stream/correct_output.out ./stream/test_output.out
     # Check the result of the checker
    if [ $? -gt 0 ]; then
        echo "Test case $i:" >> ./stream/wrong.out
        echo "Input:" >> ./stream/wrong.out
        cat ./stream/input.in >> ./stream/wrong.out
        echo "Correct output:" >> ./stream/wrong.out
        cat ./stream/correct_output.out >> ./stream/wrong.out
        echo "Test output:" >> ./stream/wrong.out
        cat ./stream/test_output.out >> ./stream/wrong.out
        echo "----------------------------------------" >> ./stream/wrong.out
    fi

done