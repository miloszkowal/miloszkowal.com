#!/bin/bash

# Echo commands to console.
set -xeu

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
  --checks "Links,Images,Favicon,Scripts,OpenGraph" \
  --allow-hash-href \
  --ignore-empty-alt \
  --ignore-missing-alt \
  --swap-urls "https\://miloszkowal.com/:/" \
  --ignore-status-codes "400,403,429" \
  --no-enforce-https \
  "$htmlproofer_args_extra"

