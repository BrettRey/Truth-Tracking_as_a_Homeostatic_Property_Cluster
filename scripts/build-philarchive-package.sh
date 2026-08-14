#!/usr/bin/env bash
set -euo pipefail

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)
package_dir="$project_dir/submission/philarchive"
main_pdf="$package_dir/truth-tracking-profiles.pdf"
combined_pdf="$package_dir/truth-tracking-profiles-with-online-resource.pdf"

mkdir -p "$package_dir"
cp "$project_dir/truth-tracking-profiles.pdf" "$main_pdf"
qpdf --empty --pages "$project_dir/truth-tracking-profiles.pdf" \
  "$project_dir/online-resource-1.pdf" -- "$combined_pdf"
cp "$project_dir/packaging/philarchive/METADATA.txt" "$package_dir/METADATA.txt"

qpdf --check "$main_pdf" >/dev/null
qpdf --check "$combined_pdf" >/dev/null

echo "PhilArchive main PDF: $main_pdf"
echo "PhilArchive PDF with Online Resource 1: $combined_pdf"
echo "PhilArchive metadata: $package_dir/METADATA.txt"
