cask "microsoft-remote-desktop-for-mac" do
  on_big_sur :or_older do
    # macOS 10.12 (Sierra)
    on_sierra :or_older do
      version "10.3.9"
      sha256 "40970f99d9ecebb585173531fb1411bad1b65d5a228ed7718a4f435976210d6f"
    end
    # macOS 10.13 (High Sierra)
    on_high_sierra do
      version "10.5.2"
      sha256 "b648e704f3701116b9abbae7d5960a87fd45d85e9e129561c3cbfd692e48bb96"
    end
    # macOS 10.14 (Mojave)
    on_mojave do
      version "10.8.4"
      sha256 "158e6d5e0ecbf2421463c95e754fd9e422f93dd5ddcceccb50ecb5a0b24d9ac9"
    end
    # macOS 10.15 (Catalina)
    on_catalina do
      version "10.8.4"
      sha256 "158e6d5e0ecbf2421463c95e754fd9e422f93dd5ddcceccb50ecb5a0b24d9ac9"
    end
    # macOS 11 (Big Sur)
    on_big_sur do
      version "10.9.5"
      sha256 "c248d61cd6ebb70dcec9a58c0451806ca3c920b6452498cb37317716ae997457"
    end
    
    livecheck do
      skip "Legacy version"
    end
  end
  # macOS 12 (Monterey)
  on_monterey :or_newer do
    version "10.9.10"
    sha256 "732cf7f5f74f67032455907cb29743e53b6733770e0a92ebc6243e75e5fd99af"

    livecheck do
      skip "Legacy version"
    end
  end
  
  

  url "https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Remote_Desktop_#{version}_installer.pkg",
      verified: "officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/"
  name "Microsoft Remote Desktop Client for Mac"
  desc "Microsoft Remote desktop client for Mac, compatible with macOS 10.12 to macOS 12"
  homepage "https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-mac"

  # deprecate! date: "2024-09-30", because: :discontinued, replacement_cask: "windows-app"
  # disable! date: "2025-10-01", because: :discontinued, replacement_cask: "windows-app"

  auto_updates true
  conflicts_with cask: "windows-app"
  depends_on :macos

  pkg "Microsoft_Remote_Desktop_#{version}_installer.pkg"

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
