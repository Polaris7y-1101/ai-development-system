#!/usr/bin/env bash
# D1 deterministic lifecycle demo — no LLM, no network, no provider.
set -u; cd "$(dirname "$0")"; rm -rf /tmp/ads-d1; cp -r scenario/project /tmp/ads-d1; cd /tmp/ads-d1
git init -q -b main .; git config user.email demo@local; git config user.name D1
git add -A >/dev/null; git commit -qm "bootstrap: project truth + fixture"
say(){ printf '== %s\n' "$1"; }
say "1 BOOTSTRAP            files=$(ls AGENTS.md CURRENT_TASK.md PROJECT_STATE.md handoffs/CURRENT_HANDOFF.md 2>/dev/null | wc -l)/4 truth files"
say "2 TASK                 $(grep -o 'State: [A-Z_]*' CURRENT_TASK.md)"
sed -i 's/State: PLANNED/State: READY_FOR_IMPLEMENTATION/' CURRENT_TASK.md
say "3 READY_FOR_IMPLEMENTATION  $(grep -o 'State: [A-Z_]*' CURRENT_TASK.md)"
echo "// implemented by backend" >> src/app.js
git add -A >/dev/null; git commit -qm "impl: backend feature"
say "4 IMPLEMENTATION       commit=$(git rev-parse --short HEAD) by=backend"
reviewer="architect"; implementer="backend"
if [ "$reviewer" = "$implementer" ]; then say "5 REVIEW               BLOCKED: REVIEW_INDEPENDENCE_MISSING"; exit 42; fi
say "5 INDEPENDENT_REVIEW   reviewer=$reviewer != implementer=$implementer -> PASS"
say "6 QA                   verdict=PASS tests=3/3 by=yuheng-qa (independent)"
sed -i 's/State: IN_PROGRESS/State: READY_FOR_HUMAN_ACCEPTANCE/' CURRENT_TASK.md
say "7 HUMAN_ACCEPTANCE_PREP checklist=3 items attached"
sed -i 's/State: READY_FOR_HUMAN_ACCEPTANCE/State: CLOSED/' CURRENT_TASK.md
say "8 CLOSED               $(grep -o 'State: [A-Z_]*' CURRENT_TASK.md)"
echo "-- VIOLATION PATH: architect implements AND reviews --"
implementer="architect"; reviewer="architect"
if [ "$reviewer" = "$implementer" ]; then echo "5 INDEPENDENT_REVIEW  BLOCKED: REVIEW_INDEPENDENCE_MISSING (developer==reviewer; alternate reviewer required)"; fi
