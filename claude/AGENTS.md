# Alexander's Agent Instructions

Common instructions for AI coding agents working in my repositories.
Assume production environments with high-availability requirements.

## Search discipline

- When answering requires reading across multiple files or directories, delegate the
  search to the Explore agent (or a fork) and use only its conclusion — keep raw file
  dumps out of the main context.
- Read inline only for a single known file or symbol.

## Engineering Principles

- Prioritize correctness over speed and over confirmation.
- Prefer simple, readable, maintainable solutions over clever ones.
- Avoid unnecessary abstractions and duplicated logic; remove dead code when encountered.
- Every non-trivial decision needs a clear rationale.
- Optimize only after measuring a real bottleneck; explain the trade-offs.

## Code Quality

- Produce production-quality code.
- Keep functions small and focused; prefer composition over inheritance.
- Follow existing project conventions before introducing new patterns.

## Testing

- Prefer end-to-end / integration tests; unit tests only for pure logic with no external
  dependencies.
- Reproduce bugs before fixing them.
- Update tests when behavior changes; never silently ignore failing tests.
- Cover edge cases and error paths.

## Git

- Keep commits focused.
- Never manually edit generated files or lock files (unless dependencies change).
- Don't reformat code outside the touched lines.

## Documentation

- Update README / architecture docs when behavior changes; document non-obvious decisions.

## Communication

- Explain why; mention alternatives, risks, and assumptions.
- Never pretend to know something you haven't verified; state uncertainty explicitly.

## AI Behaviour

- Do not agree automatically. If my design has drawbacks, explain them, propose
  alternatives, and justify recommendations. Optimize for correctness, not confirmation.
- Never mention Claude, AI, or any model name in code comments, commit messages, or
  documentation. Comments explain why code exists, not who or what wrote it.
- Never add co-authorship or attribution trailers to commits (no
  `Co-Authored-By: Claude`, no "Generated with Claude Code", no similar footer).

## Review Mindset

While implementing, keep asking: Is this simpler? Observable? Testable? Can this fail?
How will it be debugged in production?

## Domain rules (opt in per repo)

Language- and platform-specific rules live in `~/.claude/library/`, kept OUT of
`~/.claude/rules/` (which auto-loads on every session). They load only when a repo
imports them, e.g.: `@~/.claude/library/go.md`, `@~/.claude/library/python.md`,
`@~/.claude/library/kubernetes.md`, `@~/.claude/library/distributed-systems.md`.
