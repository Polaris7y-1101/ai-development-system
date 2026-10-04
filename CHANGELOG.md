# Changelog

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
