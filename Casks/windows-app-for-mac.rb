cask "windows-app-for-mac" do
  if MacOS.version == :ventura
    version "11.3.3"
    sha256 "2cd505c3b0b042477276dd8beb48bd0162aaaab5b3aaab1c6954f219a2a74ec5"
    
    url "https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Windows_App_#{version}_installer.pkg",
        verified: "officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/"
    
    pkg "Windows_App_#{version}_installer.pkg"
  else
    # For Sonoma or later, redirect to the official core cask
    version "11.3.5"
    sha256 :no_check # URL/SHA isn't strictly used since depends_on fires first

    url "https://aka.ms/WindowsApp" # Dummy/Homepage fallback URL to pass parsing
    
    depends_on cask: "windows-app"
  end

  name "Windows App"
  desc "Connect to Windows"
  homepage "https://aka.ms/WindowsApp"

  # Only run livecheck on Ventura to lock down old versions, or disable entirely
  livecheck do
    skip "Legacy version tracking for macOS Ventura" if MacOS.version == :ventura
    url "https://go.microsoft.com/fwlink/?linkid=868963"
    strategy :header_match
  end

  conflicts_with cask: "microsoft-remote-desktop",
                 cask: "junian/mirrors/microsoft-remote-desktop-app"
  depends_on macos: ">= :ventura"

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
