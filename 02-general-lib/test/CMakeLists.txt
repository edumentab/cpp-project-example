# Build our unittests executable.
#
# Test files are suffixed with "_test" to make sure all file names
# are unique in our project (makes it easier to find the correct file if you are working in a big
# project).
add_executable(unittests
  palindrome_test.cpp
  unittests.cpp
)

target_link_libraries(unittests Palindrome::libPalindrome gtest)

# Execute "unittests" as part of "cmake" tests
add_test(NAME unittests COMMAND unittests)

# Rebuild unittests before executing tests when starting with "check" target.
add_dependencies(check unittests)
