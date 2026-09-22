---
description: When performing a Git commit
name: commit
---

# Commit

Review, approve, create, and verify Git commits.

## Purpose

- Commit changes in units that are easy to review.
- Always obtain user approval before committing.
- Do not run `git commit` until approval has been granted.

## Execution Flow

1. Inspect uncommitted changes.
2. Assess the size of the changes (small or large).
3. Prepare a proposal.
4. Ask for user approval.
5. Commit only after approval has been granted.
6. Verify the contents immediately after each commit.
7. Report the results (commit SHAs and summaries).

## 1) Inspect Uncommitted Changes

Always run the following commands and inspect their output:

```bash
git branch --show-current
git status --short
git diff --stat
git diff
```

Use `git diff -- <path>` to inspect changes to individual files as needed.

## 2) Assess Change Size

Classify the changes as small or large using the criteria below.

### Small Changes (Candidates for a Single Commit)

Treat changes as small when they meet all of the following criteria:

- They serve a single purpose.
- They affect a small number of files and share a logical theme.
- They can be explained as one coherent intent during review.

### Large Changes (Candidates for Multiple Commits)

Treat changes as large when any of the following conditions apply:

- They mix multiple themes (e.g., a new feature, refactoring, and documentation
  updates).
- The number of files or the size of the diff makes reviewing everything at once
  difficult.
- They have a dependency order and can be split into meaningful incremental
  changes.

## 3) Prepare a Proposal

Use the following format for commit messages:

```text
<chore|docs|feat|fix|refactor|style|test>: <emoji> <issue?> <title>

<why?>
```

Rules:

- Choose the `type` that best matches the changes.
- Choose one emoji from Gitmoji.
  - If multiple emojis apply, choose the one closest to the intent of the
    changes.
- Include `<issue?>` only when an issue number is explicitly provided.
- If the branch name contains an issue number (e.g., `issue-12-...`), you may
  infer and include it.
- For the asynoa project, write `<title>` and `<why?>` in English by default.

### For Small Changes

- Present a single proposed commit message.
- Ask for approval to commit as proposed.

### For Large Changes

- Present a commit plan that splits the changes into small, reviewable units.
- For each commit, provide:
  - Its purpose
  - Target files (or portions of the diff)
  - A proposed commit message in the required format
- Ask for approval of the entire plan.

## 4) Confirm Approval (Required)

After presenting the proposal, explicitly ask:

- For small changes: "May I proceed with this single commit?"
- For large changes: "May I create the commits in this plan in order?"

Do not commit if approval is ambiguous.

## 5) Execute Commits

Proceed only after receiving explicit user approval.

### Small Changes

```bash
git add <required files>
git commit -m "<header>" -m "<body>"
```

### Large Changes

Repeat the following in the order specified by the plan:

```bash
git add <files for this commit>
git commit -m "<header>" -m "<body>"
```

Notes:

- Avoid `git add .` by default; specify the files to stage explicitly.
- If unexpected changes appear during execution, stop and check with the user.
- Do not use `git commit --amend` unless requested.

## 6) Verify Immediately After Each Commit (Required)

Always verify the contents immediately after each commit.

```bash
git show --stat --name-only --oneline HEAD
git show HEAD
```

Check the following:

- Only the files intended for that commit are included.
- The diff matches the proposed purpose.
- The commit message (header and body) is as intended.

If the result differs from expectations:

- Undo the most recent commit, correct its contents, and commit again.

```bash
git reset --soft HEAD~1
```

For large changes involving multiple commits, **always perform this verification
after every commit**.

## 7) Report Completion

After committing, report:

- The number of commits created
- The `SHA` and first line of each commit message
- Whether any uncommitted changes remain (`git status --short`)

## Gitmoji List

- 🎨 - :art: - Improve structure / format of the code.
- ⚡️ - :zap: - Improve performance.
- 🔥 - :fire: - Remove code or files.
- 🐛 - :bug: - Fix a bug.
- 🚑️ - :ambulance: - Critical hotfix.
- ✨ - :sparkles: - Introduce new features.
- 📝 - :memo: - Add or update documentation.
- 🚀 - :rocket: - Deploy stuff.
- 💄 - :lipstick: - Add or update the UI and style files.
- 🎉 - :tada: - Begin a project.
- ✅ - :white_check_mark: - Add, update, or pass tests.
- 🔒️ - :lock: - Fix security or privacy issues.
- 🔐 - :closed_lock_with_key: - Add or update secrets.
- 🔖 - :bookmark: - Release / Version tags.
- 🚨 - :rotating_light: - Fix compiler / linter warnings.
- 🚧 - :construction: - Work in progress.
- 💚 - :green_heart: - Fix CI Build.
- ⬇️ - :arrow_down: - Downgrade dependencies.
- ⬆️ - :arrow_up: - Upgrade dependencies.
- 📌 - :pushpin: - Pin dependencies to specific versions.
- 👷 - :construction_worker: - Add or update CI build system.
- 📈 - :chart_with_upwards_trend: - Add or update analytics or track code.
- ♻️ - :recycle: - Refactor code.
- ➕ - :heavy_plus_sign: - Add a dependency.
- ➖ - :heavy_minus_sign: - Remove a dependency.
- 🔧 - :wrench: - Add or update configuration files.
- 🔨 - :hammer: - Add or update development scripts.
- 🌐 - :globe_with_meridians: - Internationalization and localization.
- ✏️ - :pencil2: - Fix typos.
- 💩 - :poop: - Write bad code that needs to be improved.
- ⏪️ - :rewind: - Revert changes.
- 🔀 - :twisted_rightwards_arrows: - Merge branches.
- 📦️ - :package: - Add or update compiled files or packages.
- 👽️ - :alien: - Update code due to external API changes.
- 🚚 - :truck: - Move or rename resources (e.g.: files, paths, routes).
- 📄 - :page_facing_up: - Add or update license.
- 💥 - :boom: - Introduce breaking changes.
- 🍱 - :bento: - Add or update assets.
- ♿️ - :wheelchair: - Improve accessibility.
- 💡 - :bulb: - Add or update comments in source code.
- 🍻 - :beers: - Write code drunkenly.
- 💬 - :speech_balloon: - Add or update text and literals.
- 🗃️ - :card_file_box: - Perform database related changes.
- 🔊 - :loud_sound: - Add or update logs.
- 🔇 - :mute: - Remove logs.
- 👥 - :busts_in_silhouette: - Add or update contributor(s).
- 🚸 - :children_crossing: - Improve user experience / usability.
- 🏗️ - :building_construction: - Make architectural changes.
- 📱 - :iphone: - Work on responsive design.
- 🤡 - :clown_face: - Mock things.
- 🥚 - :egg: - Add or update an easter egg.
- 🙈 - :see_no_evil: - Add or update a .gitignore file.
- 📸 - :camera_flash: - Add or update snapshots.
- ⚗️ - :alembic: - Perform experiments.
- 🔍️ - :mag: - Improve SEO.
- 🏷️ - :label: - Add or update types.
- 🌱 - :seedling: - Add or update seed files.
- 🚩 - :triangular_flag_on_post: - Add, update, or remove feature flags.
- 🥅 - :goal_net: - Catch errors.
- 💫 - :dizzy: - Add or update animations and transitions.
- 🗑️ - :wastebasket: - Deprecate code that needs to be cleaned up.
- 🛂 - :passport_control: - Work on code related to authorization, roles and
  permissions.
- 🩹 - :adhesive_bandage: - Simple fix for a non-critical issue.
- 🧐 - :monocle_face: - Data exploration/inspection.
- ⚰️ - :coffin: - Remove dead code.
- 🧪 - :test_tube: - Add a failing test.
- 👔 - :necktie: - Add or update business logic.
- 🩺 - :stethoscope: - Add or update healthcheck.
- 🧱 - :bricks: - Infrastructure related changes.
- 🧑‍💻 - :technologist: - Improve developer experience.
- 💸 - :money_with_wings: - Add sponsorships or money related infrastructure.
- 🧵 - :thread: - Add or update code related to multithreading or concurrency.
- 🦺 - :safety_vest: - Add or update code related to validation.
- ✈️ - :airplane: - Improve offline support.
- 🦖 - :t-rex: - Code that adds backwards compatibility.
