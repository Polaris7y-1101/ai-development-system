# AI Development System

> **Git-first, cross-agent project continuity and AI software development orchestration.**
> A configurable AI software legion system where the project's Git repository — not any AI's chat history — is the single source of engineering truth.

**Status: v0.1.0 — early public development.** Derived and validated through real multi-runtime software development workflows.

---

## 1. What is AI Development System?

A set of skills, protocols, registries, and presets that let multiple AI coding agents (different runtimes, different models, different providers) work on the same project **without losing continuity** when you switch between them.

You keep using the AI tools you already use. This system adds the missing layer: **shared project memory and workflow discipline that lives in your Git repo**, so any agent — or any human — can pick up exactly where the last one stopped.

## 2. The Problem It Solves

- Every AI runtime has its own session memory. Switch runtimes → context is gone.
- Chat transcripts are not auditable engineering state. "The AI said tests passed" is not evidence.
- Recorded state silently drifts from repository reality (wrong branch, stale HEAD, dirty worktree) → blind execution on top of fiction.
- Multi-agent teams need roles, review independence, and QA — not just "another bot."

## 3. Core Architecture

```
Human Owner (approval boundaries)
   ↓
AI Software Legion (roles & responsibility coverage)      ← configurable, preset-based
   ↓
Workflow (lifecycle, gates, evidence rules)               ← protocol layer
   ↓
Runtime Adapters (Hermes / Claude Code / Codex / ...)     ← replaceable
   ↓
Model profiles (logical tiers)                            ← replaceable
   ↓
Providers (you configure any compatible one)              ← replaceable
```

Each layer is **separable**. Changing a provider never changes your roles; changing a runtime never rewrites your workflow; a role never hardcodes a model brand.

## 4. Two Top-Level Skills

The whole system ships as exactly two installable top-level skills:

- `skills/ai-development-workflow/` — the HOW: 14-step standard flow, capability index, gate levels, cross-AI switching
- `skills/ai-software-legion/` — the WHO: legion navigation, role contract template, provider registry template, and the **Beidou preset** (9 roles)

Everything else (protocols, registries, adapters, docs, examples, tests) supports these two.

## 5. Git-first Project Truth

Engineering facts live in the repository, in six well-known files (see `docs/project-memory.md`):

`CURRENT_TASK.md` · `CURRENT_HANDOFF.md` · `PROJECT_STATE.md` · `memory/PROJECT_MEMORY.md` · `memory/LESSONS.md` · `docs/decisions/ADR-*.md`

Branch, HEAD, worktree, test/review/QA evidence: the repo is the only authority. No runtime-specific duplicate truth files.

## 6. Cross-AI Project Memory

A handoff is a **claim to verify, not a credential to trust**. Runtime B resumes from `CURRENT_HANDOFF.md` + `CURRENT_TASK.md` + an independent `git` reality check — never from Runtime A's chat history. Demo: `examples/cross-ai-handoff/`.

## 7. STATE_DRIFT

When recorded state ≠ repository reality, the system detects, classifies, **stops blind execution**, and reconciles. Three canonical cases (HEAD mismatch / branch mismatch / unknown dirty worktree) with protective freeze — no reset, no clean, no overwrite. See `docs/state-drift.md`, demo `examples/state-drift/`.

## 8. AI Software Legion

Roles with explicit responsibility coverage. Rename a role, disable a role, add a security role — the workflow core stays untouched. Demo: `examples/custom-legion/`.

## 9. Beidou Default Preset

Nine roles out of the box (orchestrator, product validation, architect, backend, frontend, QA, shipping, experience, content) — a **default preset, not mandatory**. `Display Name != Stable Role ID`: rename freely, references stay stable via role_id.

## 10. Runtime / Model / Provider Separation

- `registries/runtime-registry.example.yaml` — which coding runtimes exist
- `registries/model-registry.example.yaml` — logical model profiles (`<coding-model>`, `<daily-model>`, …) with zero brands
- `registries/provider-registry.example.yaml` — generic provider slots (`provider-a`, `official-provider`, `relay-provider`, …)

**This project does not provide, recommend, endorse, or bundle any provider/relay service.** You configure any compatible provider yourself (`docs/provider-policy.md`).

## 11. Workflow Lifecycle

`PLANNED → READY_FOR_IMPLEMENTATION → IN_PROGRESS → REVIEW → QA → READY_FOR_HUMAN_ACCEPTANCE → CLOSED` — full states and blocking rules in `protocols/task-lifecycle.md`, demo `examples/basic-project/`.

## 12. Independent Review / QA / Human Approval

- **Developer ≠ final independent reviewer** (implementer never signs off their own work; gate: `REVIEW_INDEPENDENCE_MISSING`)
- QA validates independently of review
- Actions in `AUTO_FORBIDDEN` / `HUMAN_APPROVAL_REQUIRED` classes (production deploys, protected-branch merges, credential rotation, force push, …) require explicit human approval — see `docs/safety-boundary.md`

## 13. Quick Start

See `docs/quick-start.md` — copy two skills, bootstrap six truth files, pick a legion, create your first CURRENT_TASK, verify git reality. No programming knowledge assumed.

## 14. Examples

Four deterministic, self-contained demos (offline, no API keys): `examples/basic-project/` · `examples/cross-ai-handoff/` · `examples/state-drift/` · `examples/custom-legion/`

## 15. Runtime Adapters

| Adapter | Verification status |
|---|---|
| Hermes | **VERIFIED** (validated end-to-end in real projects, incl. in-gateway delegation) |
| Claude Code | **VERIFIED** (cross-AI round-trip validated; remains unaffected by provider changes) |
| Codex | **DRAFT** — adapter/protocol validated historically; current local provider availability is environment-specific |

Details & integration contracts: `adapters/*/README.md`.

## 16. Obsidian Integration

Obsidian = Human Knowledge Layer (dashboards, ideas, retrospectives). Git Repo = Engineering Source of Truth. Pointer dashboards + explicit promotion flows (Idea→Task, Note→Rule, Retrospective→Lesson, Brainstorm→ADR). No bidirectional editable sync. See `integrations/obsidian/`.

## 17. Safety Boundary

Three action classes: `AUTO_ALLOWED` / `HUMAN_APPROVAL_REQUIRED` / `AUTO_FORBIDDEN`. The system never auto-deploys to production, never merges protected branches, never rotates credentials, never force-pushes. Full list: `docs/safety-boundary.md`.

## 18. Custom Legion

Start from any preset (or none), define roles + `required_coverage`, and the system recomputes responsibility coverage — disabling QA yields `QA_COVERAGE_MISSING`, not silence. `docs/legion.md`.

## 19. Current v0.1 Limitations

- Adapter docs describe contracts; runtime-specific tooling beyond skills is not bundled
- CI workflows validated on GitHub Actions: tests / boundary-scan / yaml-validation all PASS (see `.github/README.md`)
- Codex adapter end-to-end run depends on a working provider configured by you

## 20. Roadmap

v0.1.x: more adapter contracts, richer test fixtures, community presets. v1.0: requires consecutive stable minors, CI-green demos/tests across at least two external runtime combinations.

## 21. Contributing

See `CONTRIBUTING.md` — scoped tasks, deterministic tests, evidence-based claims, provider neutrality, public boundary rules.

## 22. License

Apache License 2.0 — see `LICENSE` and `NOTICE`.
