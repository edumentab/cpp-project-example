set(JNI_HEADERS jni/se_edument_palindrome_PalindromeActivity.h)

add_library(libPalindrome_jni SHARED
  palindrome_jni.cpp
  ${JNI_HEADERS}
)
set_target_properties(libPalindrome_jni PROPERTIES PREFIX "")
target_link_libraries(libPalindrome_jni libPalindrome)
