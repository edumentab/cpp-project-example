add_subdirectory(libPalindrome)
add_subdirectory(palindrome)

# Copy public headers during `make install`
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

export(PACKAGE Palindrome)
