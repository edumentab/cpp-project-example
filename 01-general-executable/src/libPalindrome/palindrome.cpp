#include "palindrome.h"

bool palindrome::isPalindrome(const std::string &str) noexcept {
  for (size_t i = 0; i < str.length() / 2; i++) {
    if (str[i] != str[str.length() - 1 - i]) {
      return false;
    }
  }  
  return true;
}
