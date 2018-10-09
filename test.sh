#!/bin/sh
set -e

# Echo command to execute and then execute
echoExecute() {
  echo "\$ $@"
  "$@"
}

echoExecute docker build -t general-lib .
echoExecute docker run general-lib
