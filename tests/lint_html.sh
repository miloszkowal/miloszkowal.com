#!/bin/bash

# Echo commands to console.
set -x
# Exit on first failing command.
set -e
# Exit on unset variable.
set -u

BUILD_DIR=public

# Skips validation checks that take a long time.
htmlproofer_args_extra=""
if [ "${1-}" = "--quick" ]; then
  htmlproofer_args_extra="--disable-external"
else
  htmlproofer_args_extra="--check-external-hash"
fi

# Run HTMLProofer
htmlproofer "$BUILD_DIR" \
  --only-4xx \
  --check-favicon \
  --check-html \
  --check-opengraph \
  --allow-hash-href \
  --empty-alt-ignore \
  --url-swap "https\://miloszkowal.com/:/" \
  --http-status-ignore "400,429" \
  "$htmlproofer_args_extra"
