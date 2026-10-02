#!/usr/bin/env bash
set -u; SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$SCRIPT_DIR"; rm -rf /tmp/ads-d3; cp -r scenario/repo /tmp/ads-d3; cd /tmp/ads-d3
git init -q -b main . >/dev/null; git config user.email d@l; git config user.name D3
git add -A >/dev/null; git commit -qm base; echo x > a.txt; git add -A >/dev/null; git commit -qm second
python3 "$SCRIPT_DIR/scenario/detect_drift.py" /tmp/ads-d3 caseA   # recorded HEAD forged
git checkout -q -b feature-x; python3 "$SCRIPT_DIR/scenario/detect_drift.py" /tmp/ads-d3 caseB
git checkout -q main; echo "unknown local change" > a.txt
before=$(sha256sum a.txt | cut -c1-12); python3 "$SCRIPT_DIR/scenario/detect_drift.py" /tmp/ads-d3 caseC
after=$(sha256sum a.txt | cut -c1-12)
[ "$before" = "$after" ] && echo "preserved_sha_equal=true (no reset/clean/overwrite)" || echo "preserved_sha_equal=FALSE (VIOLATION)"
