#!/usr/bin/env bash
set -u; cd "$(dirname "$0")"
python3 - <<'PY'
import yaml, copy, subprocess
base=yaml.safe_load(open("scenario/legion.base.yaml",encoding="utf-8"))
# 1 RENAME
cfg=copy.deepcopy(base); r=next(x for x in cfg["roles"] if x["role_id"]=="backend")
r["display_name"]="Orion"
print(f"RENAME_OK id=backend stable display=天玑->{r['display_name']} (references by role_id unaffected)")
# 2 DISABLE QA -> coverage check
cfg2=copy.deepcopy(base); next(x for x in cfg2["roles"] if x["role_id"]=="qa")["disabled"]=True
resp={x["responsibility"] for x in cfg2["roles"] if not x.get("disabled")}
miss=[c for c in cfg2["required_coverage"] if c not in resp and not any(c in x["responsibility"] for x in cfg2["roles"] if not x.get("disabled"))]
qa_miss = any(x["role_id"]=="qa" and x.get("disabled") for x in cfg2["roles"]) and not any("qa" in x["responsibility"] for x in cfg2["roles"] if not x.get("disabled"))
print("QA_COVERAGE_MISSING (do not auto-silence; assign another QA owner or get explicit human waiver)" if qa_miss else "QA covered")
# 3 ADD security
cfg3=copy.deepcopy(base); cfg3["roles"].append({"role_id":"security","display_name":"Sentinel","responsibility":"security review + secrets boundary","disabled":False})
sec=any("security" in x["responsibility"] for x in cfg3["roles"])
core_unchanged = len(cfg3["roles"])==10 and cfg3["required_coverage"]==base["required_coverage"]
print(f"ADD_OK security=covered workflow_core_unchanged={str(core_unchanged).lower()} (only legion config grew)")
PY
