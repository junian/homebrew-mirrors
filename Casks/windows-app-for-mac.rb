cask "windows-app-for-mac" do
  on_ventura :or_older do
    # macOS 12 (Monterey)
    on_monterey :or_older do
      version "11.2.0"
      sha256 "e2a3eafaffc9d6bc5ddc3a79ddde71f819ba21e9e9b8b6269ec05af4ffd80bb9"
    end
    # macOS 13 (Ventura)
    on_ventura do
      version "11.3.3"
      sha256 "2cd505c3b0b042477276dd8beb48bd0162aaaab5b3aaab1c6954f219a2a74ec5"
    end

    livecheck do
      skip "Legacy version"
    end
  end
  # macOS 14 (Sonoma)
  on_sonoma :or_newer do
    version "11.3.5"
    sha256 "f725f2a4e48203c6e943d11507f0467938433aeafd220e950456f63638ac05fb"

    livecheck do
      url "https://go.microsoft.com/fwlink/?linkid=868963"
      strategy :header_match
    end
  end
  
  url "https://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Windows_App_#{version}_installer.pkg",
      verified: "officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/"
  name "Windows App"
  desc "Connect to Windows"
  homepage "https://aka.ms/WindowsApp"

  conflicts_with cask: [
    "microsoft-remote-desktop",
    "junian/mirrors/microsoft-remote-desktop-for-mac"
  ]
  depends_on :macos

  pkg "Windows_App_#{version}_installer.pkg"

  uninstall launchctl: [
              "com.microsoft.autoupdate.helper",
              "com.microsoft.update.agent",
            ],
            quit:      [
              "com.microsoft.autoupdate.fba",
              "com.microsoft.autoupdate2",
              "com.microsoft.errorreporting",
            ],
            pkgutil:   [
              "com.microsoft.package.Microsoft_AutoUpdate.app",
              "com.microsoft.rdc.macos",
            ]

  zap trash: [
    "~/Library/Application Scripts/com.microsoft.rdc.macos",
    "~/Library/Containers/com.microsoft.rdc.macos",
    "~/Library/Group Containers/UBF8T346G9.com.microsoft.rdc",
  ]
end
