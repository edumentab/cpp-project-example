#include <iostream>

#include "palindrome.h"

using namespace palindrome;

int main(int argc, const char **argp) {
  for (int i = 1; i < argc; i++) {
    if (isPalindrome(argp[i])) {
      std::cout << argp[i] << " is a palindrome\n";
    }
    else {
      std::cout << argp[i] << " is not a palindrome\n";      
    }
  }

  return 0;
}