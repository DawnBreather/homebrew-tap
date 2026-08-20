# homebrew-tap

Homebrew tap for DawnBreather's tools.

    brew install DawnBreather/tap/tmux-hub

**Use the qualified name.** A bare `brew install tmux-hub` searches homebrew-core, which does not
have these, and answers `No available formula with the name "tmux-hub"`. Asking by the full tap path
is also what trusts the cask, so nothing else is needed.

To type the short name instead, tap and trust once — Homebrew refuses a cask from a third-party tap
until you do:

    brew tap DawnBreather/tap
    brew trust dawnbreather/tap
    brew install tmux-hub

## Casks

- [tmux-hub](https://github.com/DawnBreather/tmux-hub) — a control panel over local and remote tmux
  servers, built for orchestrating many Claude Code sessions at once. Depends on `tmux`.

Casks here are generated on release by GoReleaser; edit the source repository, not this one.
