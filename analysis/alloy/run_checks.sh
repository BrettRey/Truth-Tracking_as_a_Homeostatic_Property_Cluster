#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_dir=$(CDPATH= cd -- "$script_dir/../.." && pwd)
alloy_version=6.2.0
alloy_sha256=6b8c1cb5bc93bedfc7c61435c4e1ab6e688a242dc702a394628d9a9801edb78d
alloy_dir="$project_dir/tmp/alloy"
alloy_jar=${ALLOY_JAR:-"$alloy_dir/org.alloytools.alloy.dist.jar"}
result_dir="$alloy_dir/results"

if [ ! -f "$alloy_jar" ]; then
  mkdir -p "$alloy_dir"
  curl -fL \
    "https://github.com/AlloyTools/org.alloytools.alloy/releases/download/v${alloy_version}/org.alloytools.alloy.dist.jar" \
    -o "$alloy_jar"
fi

actual_sha256=$(shasum -a 256 "$alloy_jar" | awk '{print $1}')
if [ "$actual_sha256" != "$alloy_sha256" ]; then
  echo "Unexpected Alloy jar checksum: $actual_sha256" >&2
  exit 1
fi

java -jar "$alloy_jar" exec -q -f -t json -o "$result_dir" \
  "$script_dir/corrective_control.als"

jq -r '
  .commands | to_entries[] |
  (.value.solution // [] | length) as $solutions |
  if .value.type == "run" then
    "\(.key): \(if $solutions > 0 then "instance found" else "NO INSTANCE" end)"
  else
    "\(.key): \(if $solutions > 0 then "counterexample found" else "no counterexample in scope" end)"
  end
' "$result_dir/receipt.json"
