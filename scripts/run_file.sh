#!/bin/bash

run_correct(){
     start=$(  divide $(date +%s%N)  1000000 )
    $correct_exe < ./stream/input.in > ./stream/correct_output.out 
    end=$(  divide $(date +%s%N)  1000000 )
    correct_time=$( subtract $end $start )
    if [ $? -gt 0 ]; then
        print_bold_red "Correct solution failed"
        exit 1
    fi
    echo $correct_time
}

run_test(){
    start=$(  divide $(date +%s%N)  1000000 )
    $test_exe < ./stream/input.in > ./stream/test_output.out 
    end=$(  divide $(date +%s%N)  1000000 )
    test_time=$( subtract $end $start )
    if [ $? -gt 0 ]; then
        print_bold_red "Test solution failed"
        exit 1
    fi
    echo $test_time
}