cask "rpcs3-emu" do
  version "0.0.24-14153,2807be7080ab71d5c542a2bef7323f9b43f192e6"
  sha256 "07b31cfe3d4c9d5fb5c17b151b5506206ce71839fe2ebc225adbc40695204f60"
  
  url "https://github.com/RPCS3/rpcs3-binaries-mac/releases/download/build-#{version.csv.second}/rpcs3-v#{version.csv.first}-#{version.csv.second[0..7]}_macos.dmg"
  name "RPCS3"
  desc "The Open-source PlayStation 3 Emulator"
  homepage "https://rpcs3.net/"

  app "RPCS3.app"
end
