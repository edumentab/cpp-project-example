# CMake setup for a C and C++ project

This repository is a rework of our companion to our blogpost on
[Configuring CMake for success](https://edument.se/en/news/configuring-cmake-for-success). It
contains an example of our structure for a minimal program called `palindrome` which checks if a
word is a palindrome, i.e. a word that reads the same backward as forward,
see [Wikipedia's article on Palindromes](https://en.wikipedia.org/wiki/Palindrome) for some examples.

This repository contains subfolders with different versions of our project setup:

## general-lib

Setup for building `libPalindrome` in C as a public library to be used by others (C and C++).
