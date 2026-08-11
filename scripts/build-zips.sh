#!/usr/bin/env bash
# Build one upload-ready zip per skill into dist/.
# Each zip contains a single top-level folder holding SKILL.md, which is the
# shape claude.ai expects at Settings -> Capabilities -> Skills.
#
#   ./scripts/build-zips.sh            # all skills
#   ./scripts/build-zips.sh design-taste gpt-taste
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
dist="$root/dist"
cd "$root/skills"

mkdir -p "$dist"

targets=("$@")
if [[ ${#targets[@]} -eq 0 ]]; then
  targets=()
  for d in */; do targets+=("${d%/}"); done
fi

for name in "${targets[@]}"; do
  if [[ ! -f "$name/SKILL.md" ]]; then
    echo "skip $name (no SKILL.md)" >&2
    continue
  fi

  # claude.ai matches the skill by frontmatter name; a folder that disagrees
  # with it is the most common upload failure, so fail loudly instead.
  declared="$(awk -F': ' '/^name:/{print $2; exit}' "$name/SKILL.md")"
  if [[ "$declared" != "$name" ]]; then
    echo "ERROR: $name/SKILL.md declares name: $declared" >&2
    exit 1
  fi

  rm -f "$dist/$name.zip"
  zip -rq "$dist/$name.zip" "$name" -x '.*' -x '__MACOSX/*'
  echo "built dist/$name.zip"
done
