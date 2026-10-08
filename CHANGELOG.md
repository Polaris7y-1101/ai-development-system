# Changelog

## Unreleased

Developer preview maintenance; no new release is implied by this section.

### Fixed

- Removed the boundary scanner's whole-line angle-placeholder exemption, which could suppress a secret-shaped value on the same line.
- Corrected the basic-project demo to update actual task states through CLOSED and leave a rejected self-review task at REVIEW. Each run now uses its own temporary directory and labels approvals as simulated.
- Corrected the Codex project installation directory to `.agents/skills/`.

### Added

- T12: 20 exact scanner regression cases with benign controls; T13: generated lifecycle artifacts and blocked self-review checks.
- Bilingual preview notices and a dated verification matrix explaining external dependencies and remaining runtime checks.

### Validation and limitations

- Local suite: 13/13 PASS; four offline demos and ten YAML files passed. These results do not establish live review, QA, human approval, or cross-runtime execution.
- Codex discovered both project skills; the model-driven file-reading probe was blocked by a local sandbox helper failure. Capability execution and a live Hermes/Codex round trip remain unverified.
- Existing releases are unchanged. See [verification status](docs/verification-status.md) for scope and remaining acceptance steps.

## v0.1.1

Compatible maintenance release.

### Fixed

- Corrected both top-level Skill license metadata from `MIT` to `Apache-2.0` to match the repository license.
- Corrected the test-suite description from `T1-T10` to `T1-T11`.

## v0.1.0
First public release of ai-development-system.

### Added
- Two top-level skills: `ai-development-workflow` (14-step flow + capability index), `ai-software-legion` (legion + Beidou 9-role preset)
- Protocols: task-lifecycle, handoff, ai-switch, dispatch-package, provider-error-handling
- Generic registries: runtime / model (logical profiles) / provider (anonymous slots)
- Four deterministic demos: basic-project, cross-ai-handoff, state-drift, custom-legion
- Test suite T1-T11 (offline, deterministic): structure, capabilities, persona, workflow, memory, drift, evidence, registry separation, boundary, references
- Docs: bilingual README, quick start, architecture, project-memory, state-drift, legion, safety, provider policy, obsidian integration
- Adapters: hermes (VERIFIED), claude-code (VERIFIED), codex (DRAFT — protocol validated historically; local provider availability environment-specific)
- Obsidian integration rules + pointer dashboard templates
- Apache-2.0 license + NOTICE; .github local templates & CI workflows (GITHUB_VALIDATED: 3/3 PASS)
