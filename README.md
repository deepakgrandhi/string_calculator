# Change Log for String Calculator

- **strictMode**
    - if strickMode is true then throws Exceptions
    - if strictMode is false, it skips invalid input gracefully and logs what was skipped.

### S1

- Updated the add function and created a step1_test file that satisfies our step 1 functionality of
  adding comma separated numbers
- added more tests inside step1_test imagining possible real world cases

### S2

- integration test for S2 is almost done in S1 itself. Here Ive made sure that n number of items in
  the list will be added properly and also tried doing the same using List.generate(100, (i) => '$
  {i + 1}').join(',')

### S3

- Updated the string_calculator add method to handle delimiters. now we are handling , and /n here

### S4

- Updated the add method to handle custom regex where the input starts with //
- updated teh logic to handle more delimiters like ;
- Ive added empty input handling also here

### S5

- Updated the add method with logic to handle negative numbers.
- Im throwing exceptions on catching negative numbers

### S6

- Added a new test case where the numbers greater than and equal to 1000 are ignored

### S7

- Added support for handling delimiters of any length
- Modified the regex pattern that is being used since S4 where we handled single delimiter to
  handling delimiter of any length in pattern

### S8
- Added multiple custom delimiters in specified format
- handled delimiters of n length in brackets
- updated the final test file string_calculator_test with all the steps did till now