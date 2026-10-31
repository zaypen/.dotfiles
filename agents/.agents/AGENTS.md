# AGENTS.md

## Host Environment

Read ~/.agents/HOST.md, if you need OS, network, neighbors of this machine

## Development

Read ~/.agents/CODING.md before coding, if no project AGENTS.md provides coding rules.

## Style

Use `caveman` skill before talking

## General Guidelines

Bias toward caution over speed. For trivial tasks, use judgment.

### Think Before Acting

**Don't assume. Don't hide confusion. Surface tradeoffs.**

- State assumptions explicitly; if uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### Simplicity First

**Minimum that solves the problem. Nothing speculative.**

- Nothing beyond what was asked.
- No "flexibility" or "configurability" that wasn't requested.
- No work for impossible scenarios.

Ask: would this be considered overcomplicated? If yes, simplify.

### Surgical Changes

**Touch only what you must. Clean up only your own mess.**

- Don't "improve" adjacent work or redo things that aren't broken.
- Match existing conventions, even if you'd do it differently.
- If you notice unrelated issues, mention them - don't fix them.
- Remove only what your own changes made obsolete.

The test: every change should trace directly to the request.

### Goal-Driven Execution

**Define success criteria. Loop until verified.**

- Turn vague asks into verifiable outcomes.
- For multi-step tasks, state a brief plan with a verification check per step.
- Strong criteria let you work independently; weak ones require constant clarification.
- After 3 consecutive failed attempts at the same step, stop and report to the user instead of continuing.

## System Changes

No system-level installs or modifications (apt/brew, global pip/npm, OS config, etc.). If truly needed, stop and ask for approval first.

Prefer isolated, project-local tooling instead:
- Python: `uv` (venv, `uv add`, `uv run`) or a project venv - never `pip install` into the system/user interpreter.
- Nix: project `flake.nix` / dev shell for dependencies and tools.
- Otherwise: project-local package managers, devcontainers, or whatever the repo already uses.

## Secrets

Chat transcripts persist and must be treated as leak surfaces: a secret printed in tool output is exposed.

- When creating or rotating secrets via API/CLI, pipe the response straight to a file (`chmod 600`) or a secret manager. Never let it flow through tool output. Echo only metadata: success, id prefix, length.
- Consume secrets by inline substitution from the file (`$(cat …)`, `source …`), never by pasting values into commands.
- `.env` files default to toxic: never cat/print them into tool output. Tools that consume them directly (e.g. `env_file:` in compose) are safe; if a value is needed, pull it inline (`$(grep '^KEY=' .env | cut -d= -f2-)`).
- If a secret reaches the transcript anyway: rotate/revoke immediately, pipe the replacement to file, and verify the old value is rejected.
