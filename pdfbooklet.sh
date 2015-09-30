#!/bin/bash

# Usage: pdfbooklet.sh <input_file> <output_file>
# Assumptions:
# 1. Input file has a page count which is a multiple of 4.
# 2. `cpdf` is installed on $PATH. (http://community.coherentpdf.com/)
# 3. `pdfinfo` is installed on $PATH.

set -e

PAGE_SIZE=$(pdfinfo $1 | grep Pages | awk '{ print $2 }')
MEDIAN=$(( $PAGE_SIZE / 2 ))

PAGE_LIST="~1,1,2,~2"
for i in $(seq 3 2 $MEDIAN); do
  PAGE_LIST=$PAGE_LIST,~$i,$i,$(($i+1)),~$(($i+1))
done

cpdf $1 $PAGE_LIST -o $2
cpdf -twoup-stack $2 -o $2
cpdf $2 -rotate 90 -o $2
cpdf $2 even -rotate 270 -o $2
