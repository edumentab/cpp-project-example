# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

# Don't compile native unittests for Android
if (NOT CMAKE_SYSTEM_NAME STREQUAL "Android")
  # Enable testing, but we want to show the output from google test when executing from console, so we
  # add our own target. Execute with for instance `make check`.
  enable_testing()
  add_custom_target(check COMMAND GTEST_COLOR=1 ${CMAKE_CTEST_COMMAND} --verbose)

  # Import the "download_project" function for downloading dependencies during the configure phase.
  include(../contrib/cmake-downloadProject/DownloadProject.cmake)

  # Download googletest dependency during CMake configure time
  download_project(
      PROJ                googletest
      GIT_REPOSITORY      https://github.com/google/googletest.git
      GIT_TAG             release-1.8.0
      GIT_SHALLOW         true
      ${UPDATE_DISCONNECTED_IF_AVAILABLE}
  )

  # Prevent googletest from overriding the parent project's compiler/linker
  # when building with Microsoft Visual Studio
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

  # Add googletest directly to our build. This defines the gtest and gtest_main targets.
  add_subdirectory(${googletest_SOURCE_DIR}
                   ${googletest_BINARY_DIR}
                   EXCLUDE_FROM_ALL)
endif()

add_subdirectory(src/main/cpp)
add_subdirectory(src/test/cpp)
