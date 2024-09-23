cask "nps-browser-macos" do
  version "1.4.6"
  sha256 "d4f12f178e1147070fac36a288e53a53a9ae47e89530041e54e559b20efda620"

  url "https://github.com/JK3Y/NPS-Browser-macOS/releases/download/v#{version.csv.first}/NPSBrowser.dmg"
  name "NPS Browser"
  desc "A Swift 4 implementation of NPS Browser / NoPayStation"
  homepage "https://github.com/JK3Y/NPS-Browser-macOS/"

  app "NPS Browser.app"
end
