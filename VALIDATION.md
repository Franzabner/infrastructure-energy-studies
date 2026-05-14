# Validation

Run from the repository root:

```bash
test -f README.md
test -f PUBLIC_BOUNDARY.md
test -f scripts/validate-public-boundary.sh
bash scripts/validate-public-boundary.sh
rg -n "planned|scaffolded|published|released|private/not-public|deployed energy|proven output|certified safety|commercial-readiness|private measurements|production CAD|production schematics|BOMs|Gerbers|exact dimensions|live operations|private sites|sealed geometry|validation|review" .
git diff --check
git status --short
```

Validation confirms file presence and boundary language. It does not certify engineering performance.
