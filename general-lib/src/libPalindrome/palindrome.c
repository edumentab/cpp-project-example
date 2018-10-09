#include <palindrome/palindrome.h>
#include <string.h>

bool isPalindrome(const char *str) {
  for (unsigned int i = 0; i < strlen(str) / 2; i++) {
    if (str[i] != str[strlen(str) - 1 - i]) {
      return false;
    }
  }  
  return true;
}
