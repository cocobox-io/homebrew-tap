cask "cocobox" do
  version "0.14.11"
  sha256 "2f94b0b7aa3d8db566b27be011b3e58b2a35a3fe430c1c4ae3b7c039d969bd48"

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
