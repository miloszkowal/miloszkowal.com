#!/bin/bash

# Makes sure the Beam Analytics token appears in the prod build.

# Echo commands to console.
set -x
# Exit on first failing command.
set -e
# Exit on unset variable.
set -u

BUILD_DIR=public
BEAM_TOKEN="19abd765-a363-481e-b45c-f6d608a42476"
if ! grep "${BEAM_TOKEN}" "$BUILD_DIR" -R; then
  echo "ERROR: Beam Analytics token didn't appear in prod build!";
  exit 1;
fi
