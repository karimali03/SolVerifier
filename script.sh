#!/bin/bash

g++ ./checker/Icmp.cpp -o ./checker/Icmp
g++ ./correct/main.cpp -o ./correct/main
g++ ./test/main.cpp -o ./test/main
g++ ./generator/gen.cpp -o ./generator/gen

for i in {1..10} 
do
./generator/gen > input.in ${i}
cat input.in
./correct/main < input.in > correct.out
./test/main < input.in > test.out
./checker/Icmp input.in correct.out test.out
done