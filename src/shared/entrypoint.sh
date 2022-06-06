#!/bin/sh

set -x
mkdir -p $CONTRAST_MOUNT_PATH
cp --no-clobber --recursive --verbose /contrast/* $CONTRAST_MOUNT_PATH/

echo "Completed setup of $CONTRAST_VERSION. Have fun!"
