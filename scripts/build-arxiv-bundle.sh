#!/usr/bin/env bash
set -euo pipefail

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)
bundle_root="$project_dir/submission/arxiv"
bundle_dir="$bundle_root/source"
archive="$bundle_root/truth-tracking-profiles-arxiv.tar.gz"

mkdir -p "$bundle_root"
if [[ -d "$bundle_dir" ]]; then
  find "$bundle_dir" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +
else
  mkdir -p "$bundle_dir"
fi
mkdir -p "$bundle_dir/anc"

cp "$project_dir/packaging/arxiv/main.tex" "$bundle_dir/main.tex"
cp "$project_dir/packaging/arxiv/preamble-arxiv.tex" "$bundle_dir/preamble-arxiv.tex"
cp "$project_dir/packaging/arxiv/00README.json" "$bundle_dir/00README.json"
cp "$project_dir/truth-tracking-profiles.tex" "$bundle_dir/truth-tracking-profiles.tex"
cp -L "$project_dir/references.bib" "$bundle_dir/references.bib"
cp "$project_dir/references-local.bib" "$bundle_dir/references-local.bib"

cp "$project_dir/online-resource-1.pdf" "$bundle_dir/anc/online-resource-1.pdf"
cp "$project_dir/packaging/arxiv/ancillary-README.txt" "$bundle_dir/anc/README.txt"
cp "$project_dir/analysis/gelman_fake_data_workflow.R" "$bundle_dir/anc/"
cp "$project_dir/analysis/results/gelman_fake_data_calibration.csv" "$bundle_dir/anc/"
cp "$project_dir/analysis/results/gelman_fake_data_metadata.txt" "$bundle_dir/anc/"
cp "$project_dir/analysis/results/gelman_fake_data_paired_comparisons.csv" "$bundle_dir/anc/"
cp "$project_dir/analysis/results/gelman_fake_data_replications.csv" "$bundle_dir/anc/"
cp "$project_dir/analysis/results/gelman_fake_data_summary.csv" "$bundle_dir/anc/"
cp "$project_dir/packaging/arxiv/METADATA.txt" "$bundle_root/METADATA.txt"

(
  cd "$bundle_dir"
  xelatex -interaction=nonstopmode -halt-on-error main.tex >/dev/null
  biber main >/dev/null
  xelatex -interaction=nonstopmode -halt-on-error main.tex >/dev/null
  xelatex -interaction=nonstopmode -halt-on-error main.tex >/dev/null
)

if rg -n "Undefined|undefined|LaTeX Warning|Overfull|Underfull|Error" "$bundle_dir/main.log" \
  | rg -v "microtype Warning: Unable to apply patch .footnote"; then
  echo "arXiv bundle build produced warnings requiring review" >&2
  exit 1
fi

cp "$bundle_dir/main.pdf" "$bundle_root/truth-tracking-profiles-arxiv-preview.pdf"

find "$bundle_dir" -maxdepth 1 -type f \
  \( -name '*.aux' -o -name '*.bbl' -o -name '*.bcf' -o -name '*.blg' \
     -o -name '*.log' -o -name '*.out' -o -name '*.run.xml' -o -name 'main.pdf' \) \
  -delete

rm -f "$archive"
tar -czf "$archive" -C "$bundle_dir" .

echo "arXiv source bundle: $archive"
echo "Submission metadata: $bundle_root/METADATA.txt"
