cask "citra-emu@latest" do
  version "2.0"
  sha256 "ecfdcfb89b8c961fe1b68313121d2af37370b43af38e9bcd16cccc162ab121ec"

  url "https://github.com/junian/homebrew-apps/releases/download/latest/citra-setup-mac.dmg",
      verified: "github.com/junian/homebrew-apps/"
  name "Citra"
  desc "Nintendo 3DS emulator"
  homepage "https://citra-emu.org/"

  installer manual: "citra-setup-mac.app"

  uninstall delete: "/Applications/Citra"

  zap trash: [
    "~/Library/Preferences/com.citra-emu.citra.plist",
    "~/Library/Saved Application State/com.citra-emu.citra.savedState",
  ]
end
