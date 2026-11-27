# Cocobox Homebrew tap

[Cocobox](https://cocobox.io) runs AI coding agents side by side, each on its own branch.
Mac (Apple Silicon).

```sh
brew tap cocobox-io/tap
brew trust cocobox-io/tap
brew install --cask cocobox
```

Homebrew refuses casks from taps you haven't trusted, so `brew trust` is needed once.
One line: `brew tap cocobox-io/tap && brew trust cocobox-io/tap && brew install --cask cocobox`

Cocobox updates itself in the app; `brew upgrade --cask --greedy cocobox` also works.
Uninstall: `brew uninstall --cask cocobox` (add `--zap` to remove settings and caches; the agents'
worktrees in `~/.local/share/cocobox` are always kept).

Linux builds (AppImage, .deb) and release notes: https://github.com/cocobox-io/cocobox/releases.
Issues: https://github.com/cocobox-io/cocobox/issues.

## Maintainers

After each release: `./bump.sh` (reads https://releases.cocobox.io/latest.json, or pass a version),
then commit and push. CI could run it on a schedule; not set up.
