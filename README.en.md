# AI Development System | AI project handoff toolkit

**Help your AI record progress, then check it before continuing in a new chat.**

[中文](README.md) · English

This is an open-source Skills project. A Skill is a set of instructions for your AI assistant: it helps record completed work, test results, and next steps in project files, reducing how much background you need to repeat when switching chats.

**A limited trial is available.** You need an existing AI coding assistant that can read and write local files and run commands. This is not a standalone chatbot or a complete development system with one-click setup.

## Start here

| What you want to do | Open this |
|---|---|
| Follow the first trial step by step | **[English beginner guide](docs/technical-preview.md)** |
| 阅读中文分步说明 | **[中文新手指南](docs/technical-preview.zh-CN.md)** |
| Get this trial package | **[Download the trial ZIP](previews/local-continuity-candidate-1/ads-local-continuity-candidate-1.zip)** |
| Check the evidence and limitations | [Trial validation summary](docs/local-continuity-evidence.md) |

The download link opens a GitHub file page; choose **Download raw file** or the download icon. Read the guide first, then download and verify the files. The trial is not an attachment to an old Release, and you do not need to clone the repository.

## What problem does it address?

When you change chats or assistants halfway through a project, you often need to explain again: what is finished, whether tests ran, and what happens next.

This project asks the AI to keep that information in project files. The next assistant checks it against actual files and Git version history. If records conflict, it stops and explains the problem, helping reduce guesses based on old conversations.

For example, one chat builds a small program, runs its tests, and saves a handoff. A fresh chat reads those files and checks whether work can continue and which steps are still missing.

## What is in the trial?

| Skill | Responsibility |
|---|---|
| `ai-development-workflow` | Check the actual project, synchronize the handoff, save a checkpoint, and check whether work can resume |
| `ai-software-legion` | Identify who implements, independently reviews, validates, and waits for your acceptance |

There are two Skill directories and four local procedures. An AI reads and executes them; they do not automatically launch a team of agents and are not a safety enforcement program.

## Who is it for?

- People already using a local AI coding assistant who want to repeat less project background when changing chats.
- People willing to start in a new practice project and report unclear steps or problems.
- People with Git and Python 3, or willing to set them up; the beginner guide asks the assistant to check the environment first.

If you only have a chat interface that cannot read or write local project files or run commands, first set up a local AI coding tool. Its account, subscription, or API charges still apply; this package does not include those services.

## How do I try it?

1. Open the [English beginner guide](docs/technical-preview.md) and check the prerequisites.
2. Download and extract the trial package, then create a separate empty practice folder.
3. Copy the setup prompt from the guide. The assistant checks files and tools before installing in the practice project.
4. Ask the AI to build a program that prints `Hello, ADS!`, run tests, and save a handoff.
5. Start a new chat in the same practice project for a read-only check of progress and handoff readiness.

The guide includes concrete directories, copyable prompts, expected results, and troubleshooting. You do not need to learn every technical term first. Stop on permission or test problems and ask the assistant to explain them.

## Current progress and limits

The trial has undergone small local tasks, handoff and resume-condition checks, and limited human acceptance. See the [validation summary](docs/local-continuity-evidence.md) for the exact scope. Check [GitHub Actions](https://github.com/Polaris7y-1101/ai-development-system/actions) for the current revision's automated checks.

Keep these limits in mind:

- The package version is `local-continuity-candidate-1`, not a new formal Release.
- Beginner setup from a clean computer, every AI tool, all 26 capabilities, and production deployment have not been established.
- Both user guides are available; detailed package procedures remain primarily Chinese.
- Passing tests do not complete independent review, QA, or human acceptance. Missing steps stay explicitly open.

Start with a practice project. A successful trial is not a safety guarantee for real projects.

## Trial package versus broader system

| Content | Location | Guidance |
|---|---|---|
| The local handoff trial described here | `previews/local-continuity-candidate-1/` | Start here for your first trial; use both complete directories together |
| Broader reference package, protocols, and role presets | Root `skills/`, `protocols/`, `registries/`, and related folders | For technical users who can configure external capabilities and runtime dependencies |

Both packages use the same Skill names. **Do not mix them or overwrite an existing installation.** For the broader design and adapter status, see the [documentation index](docs/README.md), [reference-package installation guide](docs/quick-start.md), and [verification status](docs/verification-status.md). The trial does not upgrade broader-system adapter statuses.

## Feedback and support ⭐

If this direction is useful to you, sign in to GitHub and click **Star ⭐** on the repository page to find it again and show support. Starring is not required to download or try the package.

We especially welcome feedback on **what was unclear, where you got stuck, and what helped**. Use the [feedback template](docs/local-continuity-feedback.md) in [Issues](https://github.com/Polaris7y-1101/ai-development-system/issues). Redact passwords, keys, private paths, and private project data; do not upload full chat logs. Follow [Contributing](CONTRIBUTING.md) for private security reporting.

## More information

[Documentation](docs/README.md) · [Contributing](CONTRIBUTING.md) · [Changelog](CHANGELOG.md) · [Historical Releases](https://github.com/Polaris7y-1101/ai-development-system/releases)

This project does not provide, recommend, or bundle a specific model provider or relay service. Users configure their own connections; see the [provider policy](docs/provider-policy.md).

## License

Apache License 2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
