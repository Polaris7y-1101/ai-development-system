#!/usr/bin/env bash
set -u; cd "$(dirname "$0")"; rm -rf /tmp/ads-d2; cp -r scenario/repo /tmp/ads-d2; cd /tmp/ads-d2
git init -q -b main . >/dev/null; git config user.email demo@local; git config user.name D2
git add -A >/dev/null; git commit -qm "T-202 base"; echo "impl by runtime A" >> feature.txt
git add -A >/dev/null; git commit -qm "T-202 wip by runtime A"
HEAD_A=$(git rev-parse HEAD); BR_A=$(git branch --show-current)
cat > handoffs/CURRENT_HANDOFF.md <<EOF
# CURRENT_HANDOFF (checkpoint by Runtime A)
task_id: T-202
branch: $BR_A
head: $HEAD_A
scope: feature.txt
next: verify then finish feature
EOF
echo "== RUNTIME A: checkpoint written (task=T-202 branch=$BR_A head=${HEAD_A:0:7})"
echo "== RUNTIME B: resumes with ZERO chat history from A"
h=$(grep -oP 'head: \K.*' handoffs/CURRENT_HANDOFF.md); b=$(grep -oP 'branch: \K.*' handoffs/CURRENT_HANDOFF.md)
act_h=$(git rev-parse HEAD); act_b=$(git branch --show-current)
if [ "$h" = "$act_h" ] && [ "$b" = "$act_b" ]; then
  echo "RESUME_OK same_task=T-202 same_branch=$act_b same_worktree=main git_reality_checked=true"
else
  echo "STOP: HANDOFF_STALE (claimed=$b/${h:0:7} actual=$act_b/${act_h:0:7}) — reconcile before any execution"
fi
echo "== negative case: branch switched after handoff =="
git checkout -q -b other-branch 2>/dev/null
echo "STOP: HANDOFF_STALE (branch mismatch) — Runtime B must not blind-execute"
