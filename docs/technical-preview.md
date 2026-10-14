# Local continuity technical preview

[中文说明](technical-preview.zh-CN.md)

This preview is for technical users with an AI coding runtime, Git, and a working test environment. Two Skill directories contain four local procedures: repository reality checks, handoff synchronization, checkpoints, and resume checks. The AI must read and execute these procedures; the package is not an automatic enforcement engine.

The version is `local-continuity-candidate-1`, not v0.1.1 or the full 26-capability system. The repository's root `skills/` remains the broader reference package. Install one package into an isolated configuration; do not merge directories with identical Skill names.

## Download and install

Download the [ZIP included in this revision](../previews/local-continuity-candidate-1/ads-local-continuity-candidate-1.zip), or inspect the [package contents](../previews/local-continuity-candidate-1/README.md). On GitHub's file page, download the raw file. Expected SHA-256:

```text
0d44dc07bca1ded8dac762c775f59a81b06ef2fc8122c194c43900e60ea92709
```

Use `sha256sum ads-local-continuity-candidate-1.zip`, or PowerShell `Get-FileHash -Algorithm SHA256 -LiteralPath .\ads-local-continuity-candidate-1.zip`. Stop on mismatch. [Per-file hashes](../previews/local-continuity-candidate-1/SHA256SUMS.json) accompany the package.

1. Read the package README, LICENSE and NOTICE. Its frozen README identifies an unpublished candidate, not a formal Release; this preview preserves that candidate identity.
2. Prepare a separate configuration for your existing runtime. Supply your own model account and test dependencies; no credentials are included.
3. Copy both complete directories from `previews/local-continuity-candidate-1/skills/` into the runtime's supported Skills directory. Preserve references. Stop if names already exist; never overwrite a personal installation.
4. Confirm both entries are visible and have the assistant read their referenced procedures. Hermes discovery was checked with `hermes skills list`; discovery alone is not execution.

The package's detailed procedures are primarily Chinese. This English guide does not establish that every instruction has an English translation.

## First task

Choose a new empty test directory and replace the placeholder in this prompt:

> Work only in [authorized test directory]. Read ai-development-workflow, ai-software-legion, the project contract and all four procedures. Define the file allowlist, initialize an isolated local Git test project and baseline, then create a minimal greeting program with runnable tests and README instructions. Run actual tests, synchronize state, archive the previous handoff, reread the final handoff and check staged contents before a separate checkpoint commit. Only this test directory and local commits are authorized. No network, push, other projects, global Git configuration or installed Skill changes. Keep unperformed Review, QA and Human Acceptance OPEN. Stop and report permission, confirmation, Git or path failures; never call an unperformed action a pass.

Use the runtime's normal interactive approval flow after inspecting the specific command and path. Treat denial or timeout as a blocker; do not disable protection or grant permanent approval to make a test pass.

In a new session, provide the same project path and request a read-only resume: reread project rules, task, handoff and the resume procedure; inspect branch, HEAD, base, checkpoint marker, actual changes, archive and state; run the recorded tests; report whether continuation is safe with command exit codes. Do not modify files or commit. Stop on conflicts or missing evidence.

Ready=YES means ready for the named next role, not human acceptance. PASS+NO is a valid blocked handoff; resume must stop. Keep negative experiments in separate authorized copies.

## Evidence and limits

The 2026-10-13 isolated trials covered a Codex task, four independently checked negative cases, a Hermes handoff task, and a directed pre-commit reread retest. Independent final-state/resume checks passed 18/18; these are checks, not 18 business scenarios. Limited human acceptance followed on 2026-10-14. See the [evidence summary](local-continuity-evidence.md).

Observed runtime differences included `python3` replacing unavailable `python`, rejection of a Chinese working-directory parameter, and noninteractive approval timeouts. The retest does not establish a general fix for these runtime limitations. Fresh-OS installation, all runtimes, all 26 capabilities, the full lifecycle, external boards and production deployment remain unverified.

Use the [feedback template](local-continuity-feedback.md) for redacted issue reports. Do not share configuration, session databases, unreviewed full logs or credentials. Follow [Contributing](../CONTRIBUTING.md) for private security reporting.
