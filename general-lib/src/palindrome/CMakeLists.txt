add_executable(palindrome main.cpp)
target_link_libraries(palindrome Palindrome::libPalindrome)

# Install the palindrome executable during "make install".
# This variables from GNUInstallDirs included from the top CMakeLists.txt
install(TARGETS palindrome
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})