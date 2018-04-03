#!/bin/sh
set -e

JAVAH=javah
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "x${ANDROID_SDK_ROOT}x" == xx ]; then 
  if [ "x${ANDROID_HOME}x" != xx ]; then 
    ANDROID_SDK_ROOT="${ANDROID_HOME}"
  else
    echo "Must set ANDROID_SDK_ROOT or ANDROID_HOME"
    exit -1
  fi
fi

# Use android-26 by defaults
echo Using ${ANDROID_PLATFORM:=android-26}

ANDROID_CP="${ANDROID_SDK_ROOT}/platforms/${ANDROID_PLATFORM}/android.jar:${ANDROID_SDK_ROOT}/extras/android/support/v7/appcompat/libs/android-support-v7-appcompat.jar:${ANDROID_SDK_ROOT}/extras/android/support/v4/android-support-v4.jar"

classes_PATH="${SCRIPTDIR}/app/build/intermediates/classes/debug/"

nativeClasses="se.edument.palindrome.PalindromeActivity"

(set -x; "${JAVAH}" -d "${SCRIPTDIR}/app/src/main/cpp/libPalindrome_jni/jni" -cp "${ANDROID_CP}:${classes_PATH}" ${nativeClasses})
