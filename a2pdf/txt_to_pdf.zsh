#!/usr/bin/env zsh

# Check if the right number of arguments are given
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input.txt>"
  exit 1
fi

# Check if the input file exists
if [ ! -f "$1" ]; then
  echo "File not found: $1"
  exit 1
fi

# Extract filename without extension
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Convert to PostScript using a2ps
# -1: One page per sheet
# -C: Add line numbers
# -M A4: Use A4 paper
# --landscape: Use landscape orientation
# --fontsize=10: Use font size 10
# -o: Specifies output file
a2ps -2 -C -M A4 "$1" -o "${filename}.ps"

# Convert to PDF using ps2pdf
# -sPAPERSIZE=a4: Use A4 paper
ps2pdf -sPAPERSIZE=a4 "${filename}.ps" "${filename}.pdf"

# Remove temporary PostScript file
rm -f "${filename}.ps"

echo "Conversion complete: ${filename}.pdf"

