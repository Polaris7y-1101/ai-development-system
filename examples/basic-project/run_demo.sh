#!/usr/bin/env bash
# D1 deterministic simulation — no LLM, network, or real approvals.
set -euo pipefail
cd "$(dirname "$0")"
demo_dir=$(mktemp -d "${TMPDIR:-/tmp}/ads-d1.XXXXXXXX")
cp -R scenario/project/. "$demo_dir/"
cd "$demo_dir"
printf 'DEMO_DIR=%s\n' "$demo_dir"
git init -q -b main .; git config user.email demo@local; git config user.name D1
git add -A >/dev/null; git commit -qm "bootstrap: project truth + fixture"
say(){ printf '== %s\n' "$1"; }
transition(){
    local from=$1 to=$2
    if ! grep -qx "State: $from" CURRENT_TASK.md; then
        echo "BLOCKED: UNEXPECTED_TASK_STATE (expected $from)" >&2
        return 1
    fi
    sed -i "s/^State: $from$/State: $to/" CURRENT_TASK.md
    printf '%s\n' "$to" >> transitions.log
}
review_gate(){
    local implementer=$1 reviewer=$2
    if [[ "$implementer" = "$reviewer" ]]; then
        echo "5 INDEPENDENT_REVIEW BLOCKED: REVIEW_INDEPENDENCE_MISSING"
        return 42
    fi
    transition REVIEW QA
}
printf 'PLANNED\n' > transitions.log
say "1 BOOTSTRAP            files=$(ls AGENTS.md CURRENT_TASK.md PROJECT_STATE.md handoffs/CURRENT_HANDOFF.md 2>/dev/null | wc -l)/4 truth files"
say "2 TASK                 $(grep -o 'State: [A-Z_]*' CURRENT_TASK.md)"
transition PLANNED READY_FOR_IMPLEMENTATION
say "3 READY_FOR_IMPLEMENTATION  $(grep -o 'State: [A-Z_]*' CURRENT_TASK.md)"
transition READY_FOR_IMPLEMENTATION IN_PROGRESS
echo "// implemented by backend" >> src/app.js
git add -A >/dev/null; git commit -qm "impl: backend feature"
say "4 IMPLEMENTATION       commit=$(git rev-parse --short HEAD) by=backend"
transition IN_PROGRESS REVIEW
review_gate backend architect
say "5 INDEPENDENT_REVIEW   SIMULATED reviewer=architect != implementer=backend -> PASS"
say "6 QA                   SIMULATED verdict=PASS by=yuheng-qa (independent)"
transition QA READY_FOR_HUMAN_ACCEPTANCE
say "7 HUMAN_ACCEPTANCE     SIMULATED approval=APPROVED (fixture only)"
transition READY_FOR_HUMAN_ACCEPTANCE CLOSED
say "8 CLOSED               $(grep -o 'State: [A-Z_]*' CURRENT_TASK.md)"
echo "-- VIOLATION PATH: architect implements AND reviews --"
mkdir violation
cp CURRENT_TASK.md violation/CURRENT_TASK.md
cd violation
sed -i 's/^State: CLOSED$/State: REVIEW/' CURRENT_TASK.md
if review_gate architect architect; then
    echo "ERROR: self-review was accepted" >&2
    exit 1
else
    result=$?
    [[ $result -eq 42 ]] || exit "$result"
fi
say "VIOLATION              $(grep '^State:' CURRENT_TASK.md) (QA blocked)"
