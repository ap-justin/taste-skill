#!/usr/bin/env bash

# Local skill registry. Directory names match the `name:` in each SKILL.md
# frontmatter, which is also the name Claude Code invokes as taste-skill:<name>.
declare -A SKILLS=(
  [design-taste]="skills/design-taste/SKILL.md"
  [design-taste-frontend-v1]="skills/design-taste-frontend-v1/SKILL.md"
  [gpt-taste]="skills/gpt-taste/SKILL.md"
  [image-to-code]="skills/image-to-code/SKILL.md"
  [imagegen-frontend-web]="skills/imagegen-frontend-web/SKILL.md"
  [imagegen-frontend-mobile]="skills/imagegen-frontend-mobile/SKILL.md"
  [brandkit]="skills/brandkit/SKILL.md"
  [redesign-existing-projects]="skills/redesign-existing-projects/SKILL.md"
  [high-end-visual-design]="skills/high-end-visual-design/SKILL.md"
  [full-output-enforcement]="skills/full-output-enforcement/SKILL.md"
  [minimalist-ui]="skills/minimalist-ui/SKILL.md"
  [industrial-brutalist-ui]="skills/industrial-brutalist-ui/SKILL.md"
  [stitch-design-taste]="skills/stitch-design-taste/SKILL.md"

  # legacy aliases (pre-plugin directory names)
  [taste-skill]="skills/design-taste/SKILL.md"
  [design-taste-frontend]="skills/design-taste/SKILL.md"
  [taste-skill-v1]="skills/design-taste-frontend-v1/SKILL.md"
  [image-to-code-skill]="skills/image-to-code/SKILL.md"
  [redesign-skill]="skills/redesign-existing-projects/SKILL.md"
  [soft-skill]="skills/high-end-visual-design/SKILL.md"
  [output-skill]="skills/full-output-enforcement/SKILL.md"
  [minimalist-skill]="skills/minimalist-ui/SKILL.md"
  [brutalist-skill]="skills/industrial-brutalist-ui/SKILL.md"
  [stitch-skill]="skills/stitch-design-taste/SKILL.md"
)

if [[ $# -eq 0 ]]; then
  echo "Usage: source ./skill.sh <skill-name>"
  echo "Available skills: ${!SKILLS[@]}"
else
  echo "${SKILLS[$1]}"
fi
