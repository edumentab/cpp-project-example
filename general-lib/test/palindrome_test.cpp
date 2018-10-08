#include <gtest/gtest.h>

#include "palindrome/palindrome.h"

using namespace palindrome;

TEST(Palindrome, isPalindrome_true) {
  EXPECT_TRUE(isPalindrome("ana"));
  EXPECT_TRUE(isPalindrome("anna"));
}

TEST(isPalindrome, isPalindrome_false) {
  EXPECT_FALSE(isPalindrome("anda"));
  EXPECT_FALSE(isPalindrome("bnna"));
}
