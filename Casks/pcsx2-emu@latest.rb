cask "pcsx2-emu@latest" do
  version "1.7.5760"
  sha256 "ed34ad3d0f58173050323bc769fb498f993f6a56d9004d0ec070e9572bb91bf3"

  url "https://github.com/PCSX2/pcsx2/releases/download/v#{version.csv.first}/pcsx2-v#{version.csv.first}-macos-Qt.tar.xz"
  name "PCSX2"
  desc "Open-Source Playstation 2 Emulator Supporting Over 98% Of The Original PS2 Library"
  homepage "https://pcsx2.net/"

  app "PCSX2-v#{version.csv.first}.app", target: "PCSX2.app"
end
