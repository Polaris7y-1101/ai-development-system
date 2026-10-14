# Beginner trial guide: help an AI pick up work in a new chat

[中文指南](technical-preview.zh-CN.md) · [Back to the English home page](../README.en.md)

**This package helps your AI record progress, test results, and next steps in project files.** A new chat checks those records against the actual project before deciding whether it can continue. You spend less time explaining the same background again.

Start with one small exercise: ask the AI to build a program that prints `Hello, ADS!`, save a handoff, then check it in a new chat. You do not need to learn Git commands first; follow the steps and inspect the results.

This is the `local-continuity-candidate-1` trial package, not a standalone chatbot or the full 26-capability system. **You need a working local AI coding assistant.** This guide gives a Codex project installation example; other tools are discussed at the end. It does not promise zero setup or a fixed completion time.

## 1. Check what you need

| You need | How to tell |
|---|---|
| An AI assistant with local file access | It can open a chosen folder, read real files, and run commands; a chat with attachment upload alone is not enough |
| Git | It saves versions of work that can be checked later; the assistant will check it below. GitHub login is not needed for this exercise |
| Python 3 | It runs the example and tests; no additional downloaded code dependencies are needed |
| A new practice folder | Keep real projects and private data out of it; create a folder such as `ads-demo` |

Your AI tool's account, subscription, or API charges still apply. The download does not include those services. If you do not yet have a working local assistant, complete that tool's official setup first.

## 2. Download and extract

1. Open [Download the trial ZIP](../previews/local-continuity-candidate-1/ads-local-continuity-candidate-1.zip). On GitHub's file page, choose **Download raw file** or the download icon. Download the ZIP, not the web page. You do not need to clone the repository.
2. Find `ads-local-continuity-candidate-1.zip` and extract it into a new folder. Keep the ZIP. On Windows, right-click and choose **Extract All**.
3. Find the level containing `README.md`, `LICENSE`, `NOTICE`, `SHA256SUMS.json`, and `skills` together. **That is your “package folder” below**, not an extra enclosing folder.
4. Create a separate, empty `ads-demo` practice folder. Neither folder should contain the other. For example, use `C:\AITrials\ads-package` and `C:\AITrials\ads-demo` on Windows, or another location where you can write on your system.

Check that both entries exist, keeping all files inside `references`:

```text
package-folder/
  README.md
  LICENSE
  NOTICE
  SHA256SUMS.json
  skills/
    ai-development-workflow/
      SKILL.md
      references/...
    ai-software-legion/
      SKILL.md
      references/...
```

The next step asks the assistant to check the ZIP's SHA-256 (a checksum to detect a damaged or wrong download). If it differs, download again and stop installation. To check it yourself, use PowerShell `Get-FileHash -Algorithm SHA256 -LiteralPath "full path to ZIP"`, replacing the quoted path; compare it with the checksum in the prompt below. On systems with `sha256sum`, use `sha256sum "full path to ZIP"`.

## 3. Install in the practice project (Codex example)

This is a project installation: two Skill folders go into your new practice project. **A Skill is a set of instructions for the AI.** These two cover how to save and resume work, and who handles implementation, review, and acceptance. They do not automatically start a team of agents.

Open or add the practice folder in Codex and start a local chat. Copy the whole prompt, replacing the three bracketed paths; do not send the placeholders unchanged. On Windows, copy folder paths from File Explorer's address bar; for the ZIP, use the full path to the file itself.

```text
Help me prepare an ADS practice project. Check first; install only if the checks pass.
ZIP file: [full path to the downloaded ZIP]
Package folder: [full path to the folder containing README.md and skills]
Practice folder: [full path to the new empty ads-demo folder]

Read the package README, LICENSE, NOTICE, and SHA256SUMS.json. Check the ZIP SHA-256 against
0d44dc07bca1ded8dac762c775f59a81b06ef2fc8122c194c43900e60ea92709,
then check each extracted file against SHA256SUMS.json. Do not execute package instructions until verified.
Confirm the practice folder is empty and writable and neither folder contains the other; report resolved paths.
Check which Git and Python 3 commands actually work here and report their versions, rather than relying on chat claims.
If running in WSL, verify the actual directories corresponding to Windows paths before using them.
Check visible Skills for existing ai-development-workflow / ai-software-legion names.
Stop and explain missing tools, wrong paths, checksum mismatches, duplicate Skill names, or missing permission.

Only after all checks pass, initialize a local Git repository (main branch) in the practice folder,
and copy both complete folders from the package's skills directory into its .agents/skills/ directory.
Compare copied files byte for byte. Do not change the package, personal configuration, other folders, or existing Skills.
Do not commit, download software, or push yet. Report the two installed SKILL.md paths and check results.
```

**The result should look like this, without an extra `skills/skills` layer:**

```text
ads-demo/
  .git/
  .agents/skills/
    ai-development-workflow/SKILL.md
    ai-development-workflow/references/...
    ai-software-legion/SKILL.md
    ai-software-legion/references/...
```

This uses the [project Skills location in the official Codex documentation](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills), checked on 2026-10-14. Start a new chat in the same project after installation. If entries still do not appear, restart Codex and check again. Stop on duplicate names; do not select a package by name alone.

**Success:** both entries come from the practice folder and the assistant can actually read their instructions and references. Seeing names in a list is not sufficient. If permissions or a sandbox error block reading, use troubleshooting below.

## 4. Copy this prompt for your first task

Send this in the practice project. Installed files are known files placed there in the previous step, not unknown changes to clear away.

```text
Use ai-development-workflow and ai-software-legion from this practice project's .agents/skills directory.
Read both entries, the project contract, role contract, and all four procedures. Report the paths read.
Create a local task following the project contract: a Python 3 program that prints Hello, ADS!,
with runnable tests and README instructions. Do not use dependencies needing a network download.

Only this practice project and local Git commits are authorized. No network downloads, push, other projects, or global configuration changes.
List allowed files first. Include the verified .agents/skills files unchanged in the initial baseline,
and explicitly include the program files, required project records, and handoff archives. Do not edit Skills.
If this practice repository lacks a Git commit identity, a synthetic identity is allowed for this repository only.
Create the initial baseline, then implement the task and run real tests; use Python -B to avoid cache files.
Synchronize state, preserve the old handoff, reread the final handoff and staged changes, then make a separate checkpoint commit.
Keep independent Review, QA, and Human Acceptance OPEN unless they actually occurred. Do not mark the task CLOSED.
Stop on permission problems, failing tests, or unknown changes; do not automatically clean up the evidence.

Finish in plain English: how to run the program, actual output, test command and result, saved commit ID,
handoff file location, whether it is ready for the next role, who that role is, and what remains unfinished.
```

If asked to approve a command, check that its operation is confined to the practice project and use the tool's normal approval flow. Ask the assistant to explain unfamiliar commands first; you do not need to disable protections or grant permanent approval.

**Check these results:**

| What to inspect | What a successful run should show |
|---|---|
| Program | Actual output of `Hello, ADS!` |
| Tests | A real command, exit code, and result; failures must not be reported as passes |
| Saved work | A real Git commit ID (a checkpoint, or save point), with no unsaved working-tree changes |
| Handoff | `handoffs/CURRENT_HANDOFF.md` explains what happened, what comes next, and what is unfinished |
| Status | Normally waiting for independent review, not “the whole project has been accepted” |

For example, “Tests passed; ready for the next reviewer; human acceptance has not happened” is reasonable. This explains expected output; **it is not evidence that your task has run**.

## 5. Open a new chat and check the handoff

Start a fresh chat in **the same practice project**. Do not paste the whole previous conversation. Send:

```text
Check whether this ADS practice project can be handed over. Read-only inspection; do not continue implementation.
Read both entries under .agents/skills, the project contract, session-resume, and its referenced procedures.
Read current project rules, task, handoff, and supporting records; do not rely on the old chat.
Check the actual Git branch, current commit, recorded baseline, checkpoint marker, actual changes, archive, and state.
Rerun necessary tests from the handoff (use Python -B to avoid cache files).
Do not modify files, commit, or push. Stop and explain if recorded tests would write files or access the network.
Explain in plain English: where work stopped, test results, whether the named next role can take over, why, and what is unfinished.
Stop on conflicts or missing evidence; never guess Safe=YES.
```

**Success:** the new chat explains progress from files and gives real check results. `Safe=YES` means the conditions for handing over to the recorded next role are met; it does not authorize skipping review or human acceptance. `Safe=NO` means stop and read the reason. Passing tests with `Ready=NO` can be correct when other requirements remain unmet.

## 6. Troubleshooting

| What you see | What to do next |
|---|---|
| Git is not recognized, or Python is missing | Give the assistant the error and request a read-only check of installed tools and paths. Use a verified full path if installed; otherwise follow official installation instructions, reopen the assistant, and retry step 3 |
| A Skill with the same name exists | Stop; do not overwrite or delete it. Ask someone familiar with the tool to prepare a separate configuration |
| A folder or Skill cannot be found | Check for an extra enclosing folder, missing references, or the wrong project being open; restart the assistant if needed |
| Chinese characters in a working-directory argument are rejected | Preserve the attempt; start in a new empty folder with an English name. Do not move an existing project |
| Permission denied, approval timeout, or sandbox error 32 | Treat the attempt as BLOCKED, not successful. Use the tool's diagnostics and normal permission flow; do not bypass protections |
| Tests fail, Safe=NO, or state conflicts | Ask for the specific file and cause; preserve the attempt. Do not reset, clean, or delete files to produce a pass |
| No independent reviewer is available | Leave the task awaiting review and keep the handoff. The implementer must not impersonate a reviewer or accept on your behalf |

To stop trying it, stop using the practice project. This route does not require uninstalling or overwriting personal Skills. Keep the practice folder for diagnosis; do not run automatic cleanup.

## 7. Other tools, versions, and feedback

**Hermes and other local assistants:** the package is still the same two complete directories, but `.agents/skills` is not a universal installation path. Technical users with an existing Hermes setup should install in the Skills directory of a separate trial configuration; `hermes skills list` checks discovery, followed by actual reading and execution checks. Do not assume the Codex path applies. Check other tools' official Skills documentation first; not all runtimes have been verified.

**Which package?** For this trial, use this page's ZIP. The repository's root `skills/` contains the broader reference package with different dependencies. Do not mix them or substitute a download from the old v0.1.1 Release. The package README retains its “unpublished candidate” label to identify the frozen candidate; it does not mean the download failed.

The Chinese and English guides cover the same trial steps. Detailed package procedures are still primarily Chinese. They are instructions executed by an AI, not an automatic safety enforcement program.

Existing evidence covers small tasks and handoff checks in preconfigured environments; see the [validation summary](local-continuity-evidence.md). Rewriting this guide does not establish that a beginner user has completed it. Fresh-computer installation, all 26 capabilities, production deployment, and all runtimes remain unverified. Complete your own practice exercise before considering a real project.

If stuck, use the [feedback template](local-continuity-feedback.md) in [GitHub Issues](https://github.com/Polaris7y-1101/ai-development-system/issues). Include the step, operating system and assistant version, expected result, and a redacted error. Submitting an Issue needs a GitHub account; you can also give the error to your assistant first. Do not share passwords, keys, private paths, or full chat logs. Follow [Contributing](../CONTRIBUTING.md) for private security reporting.
