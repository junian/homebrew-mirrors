cask "webcamplus-app" do
  version "2.0.0"
  sha256 "ecd626ee0c0531254bfa546564b989ee1f96bc983224af2d7c03d5c6d632a0f3"

  url "https://github.com/WebcamPlus/WebcamPlus.github.io/releases/download/#{version}/WebcamPlus.Installer.#{version}.pkg"
  name "Webcam Plus"
  desc "Use your iPhone as a webcam"
  homepage "https://webcamplus.app/"

  pkg "WebcamPlus.Installer.#{version}.pkg"

  uninstall pkgutil: [
    "com.antonmeier.webcamplus.plugin",
    "com.antonmeier.webcamplus.server",
  ]
end
