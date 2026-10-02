#!/usr/bin/env python3
"""Deterministic STATE_DRIFT detector (demo). usage: detect_drift.py <repo> <caseA|caseB|caseC>"""
import subprocess, sys, re
repo, case = sys.argv[1], sys.argv[2]
def git(*a): return subprocess.run(["git","-C",repo,*a],capture_output=True,text=True).stdout.strip()
actual_head, actual_branch = git("rev-parse","HEAD"), git("branch","--show-current")
if case=="caseA":
    recorded_head="0"*40  # forged: recorded != actual
    cls = "HEAD_MISMATCH" if recorded_head!=actual_head else "OK"
    print(f"DETECTED {cls} claimed={recorded_head[:7]} actual={actual_head[:7]} -> STOP blind execution; reconcile (update record or reset to verified reality)")
elif case=="caseB":
    recorded_branch="main"
    cls = "BRANCH_MISMATCH" if recorded_branch!=actual_branch else "OK"
    print(f"DETECTED {cls} claimed={recorded_branch} actual={actual_branch} -> STOP; reconcile (record intended branch or switch explicitly)")
else:
    dirty=git("status","--porcelain")
    cls="UNKNOWN_DIRTY_WORKTREE" if dirty else "OK"
    print(f"DETECTED {cls} dirty={dirty!r} -> PRESERVE (protective freeze): no reset / no clean / no overwrite; ask human / reconcile list first")
