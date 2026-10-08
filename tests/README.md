# Public deterministic tests

Run `python3 tests/run_tests.py` on Linux with Python 3, Bash and Git installed.
No model, credentials, network, or provider is used.

T1–T11 cover structure, registries, documented workflow and memory rules,
drift fixtures, boundary scanning, and internal references.

T12 checks 20 isolated synthetic secret fixtures across the root, tests, docs,
examples, and .github directories. Each checks the exact category, path, line,
raw count, classified count, and confirmed count. A placeholder before, after,
or on the preceding line cannot suppress a hit. Benign controls remain accepted.

T13 reads D1's generated task files and transition log. The normal task reaches
CLOSED through every demo state; self-review leaves its separate task at REVIEW.
Demo approvals are simulations, not evidence of real review or acceptance.

## Limits

These checks do not prove cross-runtime execution. The scanner is not a complete
secret detector: existing rule-definition and T11 source-region classifications
remain, as do the environment-name and public-path classifications. Private
semantic audits and Git metadata/history checks remain separate. This change
addresses only the whole-line placeholder false negative.

For a linked Git worktree, test a clean source snapshot without its `.git`
pointer file, which contains a host-specific path. This is harness isolation,
not a new scanner exemption.
