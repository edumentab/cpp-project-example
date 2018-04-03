#include <string>

#include "jni/se_edument_palindrome_PalindromeActivity.h"
#include "palindrome.h"

using namespace palindrome;

JNIEXPORT jboolean JNICALL Java_se_edument_palindrome_PalindromeActivity_isPalindrome
  (JNIEnv *env, jclass, jstring javaString) {

  auto nativeString = env->GetStringUTFChars(javaString, 0);
  auto res = isPalindrome(nativeString);
  env->ReleaseStringUTFChars(javaString, nativeString);
  return res;
}
