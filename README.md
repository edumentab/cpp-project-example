[![Build Status](https://travis-ci.org/edumentab/cpp-project-example.svg?branch=master)](https://travis-ci.org/edumentab/cpp-project-example)

# CMake setup for a C++ project

This repository is a companion to our blogpost on C++ project structure. This is an example of our
structure for a minimal program called `palindrome` which checks if a word is a palindrome, i.e. a
word that reads the same backward as forward,
[see Wikipedia](https://en.wikipedia.org/wiki/Palindrome) for some examples.

This repository contains some subfolders with different versions of our project setup:

## 01-general-executable

This is the general setup for building a `palindrome` executable with some unittests.

## 02-general-lib

Setup for building `libPalindrome` as a public library to be used by others.

## 03-android-jni

Example setup for building an Android app for our C++ `libPalindrome` which we connect to via JNI
(Java Native Interface). We keep the unittests from the general setup and hook them up so we can
still can execute them outside the Android environment.
