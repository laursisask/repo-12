#!/bin/sh

set -x
mkdir -p $CONTRAST_MOUNT_PATH
cp --no-clobber --recursive --verbose /staging/* $CONTRAST_MOUNT_PATH/

echo "Completed setup of $CONTRAST_VERSION. Have fun!"
