add_library(libPalindrome
            palindrome.h palindrome.cpp)

# CMake automatically prefixes our target name with "lib" for libraries, i.e. the built target
# will by default be called "liblibPalindrome.a". We adjust the library name so it becomes
# "libPalindrome.a" for cosmetic reasons.
set_target_properties(libPalindrome PROPERTIES PREFIX "")

# This adds the current source directory as an include directory for consumers of our library.
# If we have generated headers we would also add CMAKE_CURRENT_BINARY_DIR.
target_include_directories(libPalindrome INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

# We are using C++11 features (and so will all users of this library)
target_compile_features(libPalindrome PUBLIC cxx_std_11)

# Add a target in our namespace
add_library(Palindrome::libPalindrome ALIAS libPalindrome)
