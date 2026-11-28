cask "cocobox" do
  version "0.14.10"
  sha256 "fa14bd18c1f185d3312ecfc3b3c0366be22b9eb21eaf5e1e344522c15357db57"

  url "https://releases.cocobox.io/darwin-aarch64/Cocobox_#{version}_aarch64.dmg"
  name "Cocobox"
  desc "Run AI coding agents side by side, each on its own branch"
  homepage "https://cocobox.io/"

  livecheck do
    url "https://releases.cocobox.io/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Cocobox.app"

  # ~/.local/share/cocobox is left out on purpose: it holds the agents' git worktrees,
  # which can contain uncommitted work.
  zap trash: [
    "~/.config/cocobox",
    "~/Library/Caches/cocobox-desktop",
    "~/Library/Caches/io.cocobox.desktop",
    "~/Library/Preferences/cocobox-desktop.plist",
    "~/Library/Preferences/io.cocobox.desktop.plist",
    "~/Library/Saved Application State/io.cocobox.desktop.savedState",
    "~/Library/WebKit/cocobox-desktop",
    "~/Library/WebKit/cocobox-office",
    "~/Library/WebKit/io.cocobox.desktop",
  ]
end
