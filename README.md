# Core change

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