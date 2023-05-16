#!/bin/bash

echo "Please enter the filename:"
read FILENAME

echo "Please enter the expected checksum:"
read EXPECTED_CHECKSUM

FILE_CHECKSUM=$(sha256sum "$FILENAME" | cut -d ' ' -f 1 | xxd -r -p | base64)

if [[ "$EXPECTED_CHECKSUM" == "$FILE_CHECKSUM" ]]; then
  echo "--RESULT: Checksum matches!"
else
  echo "--RESULT: Checksum does not match!"
fi

echo "Press Enter to exit..."
read
