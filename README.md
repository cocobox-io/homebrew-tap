# Cocobox Homebrew tap

[Cocobox](https://cocobox.io) runs AI coding agents side by side, each on its own branch.
Mac (Apple Silicon).

```sh
brew install --cask cocobox-io/tap/cocobox
```

Cocobox updates itself in the app; `brew upgrade --cask --greedy cocobox` also works.
Uninstall: `brew uninstall --cask cocobox` (add `--zap` to remove settings and caches; the agents'
worktrees in `~/.local/share/cocobox` are always kept).

Linux builds (AppImage, .deb) and release notes: https://github.com/cocobox-io/cocobox/releases.
Issues: https://github.com/cocobox-io/cocobox/issues.

## Maintainers

After each release: `./bump.sh` (reads https://releases.cocobox.io/latest.json, or pass a version),
then commit and push. CI could run it on a schedule; not set up.
