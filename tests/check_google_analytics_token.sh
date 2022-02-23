#!/bin/bash

# Makes sure the Google Analytics token appears in the prod build.

# Echo commands to console.
set -x
# Exit on first failing command.
set -e
# Exit on unset variable.
set -u

BUILD_DIR=public
UA_TOKEN="G-V39NQ0VG66"
if ! grep "${UA_TOKEN}" "$BUILD_DIR" -R; then
  echo "ERROR: Google Analytics token didn't appear in prod build!";
  exit 1;
fi
