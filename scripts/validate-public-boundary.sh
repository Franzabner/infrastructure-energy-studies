#!/usr/bin/env bash
set -u

missing=0

required_files=(
  "AGENTS.md"
  "README.md"
  "STATUS.md"
  "PUBLIC_BOUNDARY.md"
  "CLAIMS.md"
  "VALIDATION.md"
  "ARTIFACT_REGISTER.md"
  "REVIEW_LOG.md"
  "requirements.txt"
  "water-current-electricity/README.md"
  "water-current-electricity/water-current-study-template.md"
  "solar-to-hydrogen/README.md"
  "solar-to-hydrogen/synthetic-solar-to-hydrogen-control-ledger-study.md"
  "resilient-power-conversion/README.md"
  "resilient-power-conversion/conversion-assumptions-template.md"
  "storage-assumptions/README.md"
  "storage-assumptions/storage-assumptions-table-template.md"
  "control-states/README.md"
  "control-states/public-safe-control-state-notes.md"
  "safety-boundaries/README.md"
  "safety-boundaries/non-certified-safety-boundary.md"
  "validation-plans/README.md"
  "validation-plans/energy-validation-plan-template.md"
  "inputs/README.md"
  "inputs/synthetic/solar_to_hydrogen_control_inputs.csv"
  "inputs/synthetic/energy_control_states.json"
  "reports/README.md"
  "reports/markdown-energy-validation-report-template.md"
  "diagrams/README.md"
  "diagrams/energy-study-validation-flow.mmd"
  "scripts/validate-public-boundary.sh"
  "scripts/run-synthetic-energy-study-template.py"
  "templates/energy-study-template.md"
  "templates/assumptions-table-template.md"
  "templates/validation-report-template.md"
)

for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    printf "PASS %s\n" "$file"
  else
    printf "FAIL %s\n" "$file"
    missing=$((missing + 1))
  fi
done

required_terms=(
  "planned"
  "scaffolded"
  "published"
  "released"
  "private/not-public"
  "deployed energy"
  "proven output"
  "certified safety"
  "commercial-readiness"
  "private measurements"
  "production CAD"
  "production schematics"
  "BOMs"
  "Gerbers"
  "exact dimensions"
  "live operations"
  "private sites"
  "sealed geometry"
  "validation"
  "review"
)

for term in "${required_terms[@]}"; do
  if rg -q "$term" .; then
    printf "PASS term: %s\n" "$term"
  else
    printf "FAIL term: %s\n" "$term"
    missing=$((missing + 1))
  fi
done

blocked_files="$(find . -path ./.git -prune -o \( -iname '*.f3d' -o -iname '*.step' -o -iname '*.stp' -o -iname '*.kicad_pcb' -o -iname '*.sch' -o -iname '*.brd' -o -iname '*.gbr' -o -iname '*bom*' \) -print)"
if [ -z "$blocked_files" ]; then
  printf "PASS blocked production artifact scan\n"
else
  printf "FAIL blocked production artifact scan\n%s\n" "$blocked_files"
  missing=$((missing + 1))
fi

if [ "$missing" -eq 0 ]; then
  printf "Result: PASS - energy public boundary scaffold is complete.\n"
else
  printf "Result: FAIL - %s required checks failed.\n" "$missing"
fi

exit "$missing"
