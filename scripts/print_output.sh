#!/bin/bash

passed=0

IO_section(){
    echo "**Input**" >> $1
    echo "\`\`\`" >> $1
    cat ./stream/input.in >> $1
    echo "\`\`\`" >> $1
    echo "**Correct Output**" >> $1
    echo "\`\`\`" >> $1
    cat ./stream/correct_output.out >> $1
    echo "\`\`\`" >> $1
    echo "**Test Output**" >> $1
    echo "\`\`\`" >> $1
    cat ./stream/test_output.out >> $1
    echo "\`\`\`" >> $1
} 


wrong_test(){
    echo "### Test case $3: $4" | tee -a $1 $2  > /dev/null
    echo "**Message:**" $7 | tee -a $1 $2  > /dev/null
    echo "**Correct Time :** $5 ms" | tee -a $1 $2  > /dev/null
    echo "**Test Time :** $6 ms" | tee -a $1 $2  > /dev/null
    IO_section $1 ; IO_section $2
    echo "---" >> $1 ; echo "---" >> $2  
}

## This function is used to check the status of the output file
# $1: result file
# $2: wrong file
# $3: test case number
# $4: checker output
print_output(){
    text=$(cat $4)
    if [[ $text == "ok"* ]]; then
        echo "### Test case $3: OK" >> $1
        echo "**Correct Time :** $5 ms" >> $1
        echo "**Test Time :** $6 ms" >> $1
        IO_section $1
        echo "---" >> $1 
        passed=$(( passed + 1 ))
    elif [[ $text == "wrong answer"* ]]; then
        wrong_test $1 $2 $3 "Wrong Answer" $5 $6 "${text#"wrong answer"}"
    elif [[ $text == "wrong output format"* ]]; then
        wrong_test $1 $2 $3 "Peresentation Error" $5 $6 "${text#"wrong output format"}"
    elif [[ $text == "FAIL"* ]]; then
        wrong_test $1 $2 $3 "Fail" $5 $6 "${text#"FAIL"}"
    elif [[ $text == "unexpected eof"* ]]; then
        wrong_test $1 $2 $3 "Unexpected EOF" $5 $6 "${text#"unexpected eof"}"
    else
        wrong_test $1 $2 $3 "Unknown" $5 $6 "${text}"
    fi    

}


print_statistics(){
    echo "# SolVerifier Statistics" > $1
    echo "Test Solution Passed ( ${passed} / $8 ) Tests" >> $1
    echo "### Correct Solution" >> $1
    echo "**Avg Time :** $2 ms" >> $1
    echo "**Min Time :** $3 ms" >> $1
    echo "**Max Time :** $4 ms" >> $1
    echo "### Test Solution" >> $1
    echo "**Avg Time :** $5 ms" >> $1
    echo "**Min Time :** $6 ms" >> $1
    echo "**Max Time :** $7 ms" >> $1
}