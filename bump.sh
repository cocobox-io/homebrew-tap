#!/bin/sh
# Updates Casks/cocobox.rb to the latest release (or the version given) and prints the new version.
# Usage: ./bump.sh [version]    then: git commit -am "cocobox <version>" && git push
set -eu
cd "$(dirname "$0")"
V=${1:-$(curl -sfL https://releases.cocobox.io/latest.json | sed -n 's/.*"version": *"\([0-9.]*\)".*/\1/p')}
case "$V" in [0-9]*.[0-9]*.[0-9]*) ;; *) echo "bump.sh: bad version '$V'" >&2; exit 1 ;; esac
SHA=$(curl -sfL "https://releases.cocobox.io/darwin-aarch64/Cocobox_${V}_aarch64.dmg" | shasum -a 256 | cut -d' ' -f1)
# sha256 of empty input = download failed
[ "$SHA" != e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855 ] || { echo "bump.sh: DMG for $V not found" >&2; exit 1; }
sed -i.bak -e "s/^  version \".*\"/  version \"$V\"/" -e "s/^  sha256 \".*\"/  sha256 \"$SHA\"/" Casks/cocobox.rb && rm Casks/cocobox.rb.bak
echo "$V"
