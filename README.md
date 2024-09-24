# SolVerifier

**SolVerifier** is a Bash script-based verification tool designed to compare two solutions by generating test cases and verifying their correctness. It uses a solution generator to create a variety of test cases, runs both the correct and test solutions against them, and employs a checker to validate the outputs. This makes **SolVerifier** a powerful utility for verifying the accuracy of algorithms in competitive programming and software development projects.

## Supported Languages

SolVerifier supports writing solutions in the following programming languages:

- C++
- C
- Java
- TypeScript
- JavaScript
- Python

## Use Cases

1. **Check solution correctness**  
   You want to check if a solution is correct by comparing its output to a known correct solution.
   
2. **Find failing test case for an incorrect solution**  
   If your solution is wrong, you can generate a specific test case that reveals the error.

3. **Determine the correctness percentage**  
   You want to know how often a solution gives the correct output (as a percentage of test cases).

4. **Compare time performance of two solutions**  
   You can compare the time performance of two solutions, including minimum, maximum, and average times.

## Steps to Use

1. **Write your correct solution**  
   Save your correct solution in the `./correct_solution` folder.

2. **Write your test solution**  
   Save your test solution in the `./test_solution` folder.

3. **Choose or write a generator**  
   You can select an existing generator from the `./generator` folder or write your own generator using [testlib](https://github.com/MikeMirzayanov/testlib). Refer to their documentation for help in creating generators.

4. **Choose or write a checker**  
   Select a checker from the `./checker` folder or write your own, also using [testlib](https://github.com/MikeMirzayanov/testlib).

5. **Run the main script**  
   - Execute the main script by running:
   ```bash
   ./script.sh
   ``` 
   This will prompt you to enter the file names and number of test cases.
   - Alternatively, you can run the script with all arguments directly:
   ```bash
   ./script.sh <correct_sol_name> <test_sol_name> <generator_name> <checker_name> <number_of_test_cases>

   ```
6. Review results
Detailed results, including comparison metrics, will be saved in the `./results` folder.
