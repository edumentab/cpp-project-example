add_library(libPalindrome
  ../include/palindrome/palindrome.h
  palindrome.cpp
)

# CMake automatically prefixes our target name with "lib" for libraries, i.e. the built target
# will by default be called "liblibPalindrome.a". We adjust the library name so it becomes
# "libPalindrome.a" for cosmetic reasons.
set_target_properties(libPalindrome PROPERTIES PREFIX "")

# This adds the current source directory as an include directory for consumers of our library.
# If we have generated headers we would also add CMAKE_CURRENT_BINARY_DIR.
target_include_directories(libPalindrome PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>/../include
  $<INSTALL_INTERFACE:include>
)

# Add a target in our namespace
add_library(Palindrome::libPalindrome ALIAS libPalindrome)

# We are using C++11 features (and so will all users of this library)
target_compile_features(libPalindrome PUBLIC cxx_std_11)

# Install libPalindrome.so target
install(TARGETS libPalindrome
    EXPORT libPalindrome-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

# Write an PalindromeConfig.cmake file that can be used by `find_package` when some dependent
# project wants to use our library.
# `find_package` requires the file to have `Config.cmake` suffix. If we need to do more than just
# exporting some variables (e.g. do `find_package` on our other dependencies) then we could write
# to `PalindromeTargets.cmake` instead and generate `PalindromeConfig.cmake` with
# `configure_package_config_file` and include `PalindromeTargets.cmake` from
# `PalindromeConfig.cmake`.
install(
  EXPORT libPalindrome-targets
  FILE PalindromeConfig.cmake
  NAMESPACE Palindrome::
  DESTINATION ${INSTALL_CMAKE_CONFIGDIR}
)
