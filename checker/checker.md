# Checkers

This repository contains various solution checkers implemented in C++. These checkers are designed to compare outputs of solutions against expected outputs with specific criteria.

## Checker Descriptions

- **`fcmp.cpp`**: Compares lines without ignoring whitespaces.
- **`hcmp.cpp`**: Compares a single huge integer.
- **`icmp.cpp`**: Compares lines while ignoring whitespaces.
- **`ncmp.cpp`**: Compares one or more int64 values while ignoring whitespaces.
- **`nyesno.cpp`**: Compares zero or more "yes"/"no" values, case insensitive.
- **`rcmp4.cpp`**: Compares one or more double values with a maximum allowable error of 1E-4.
- **`rcmp6.cpp`**: Compares one or more double values with a maximum allowable error of 1E-6.
- **`rcmp9.cpp`**: Compares one or more double values with a maximum allowable error of 1E-9.
- **`wcmp.cpp`**: Compares a sequence of tokens.
- **`yesno.cpp`**: Compares a single "yes" or "no" value, case insensitive.

# Note
These checkers are part of the [testlib library](https://codeforces.com/portal/page?view=testlib). 
You can use the `custom_chk.cpp` to start creating your own checker or modify existing ones to fit your needs.

Feel free to explore and customize the checkers for your projects!
