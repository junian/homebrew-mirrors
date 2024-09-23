cask "scratchjr-app" do
  version "1.3.2"
  sha256 "1789d2b77d91725dc7405eb76ff5d8e1a05905c873acfece3befa2f4138e1c13"

  url "https://github.com/jfo8000/ScratchJr-Desktop/releases/download/v#{version}/ScratchJr-#{version}.dmg"
  name "ScratchJr"
  desc "Coding for young children"
  homepage "http://scratchjr.org/"

  app "ScratchJr.app"
end
