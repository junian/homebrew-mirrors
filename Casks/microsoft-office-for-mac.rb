cask "microsoft-office-for-mac" do
  on_ventura :or_older do
    # macOS 10.12 (Sierra)
    on_sierra do
      version "16.30.19101301"
      sha256 "9eee9de31663bc46552dd39183ba13347baaee6871e8dbad218e0817eebcd031"
    end
    # macOS 10.13 (High Sierra)
    on_high_sierra do
      version "16.43.20110804"
      sha256 "7609cd86617723f80dea8dbd244a2d9a4f035f8019864833de6a9e64e62f73a9"
    end
    # macOS 10.14 (Mojave)
    on_mojave do
      version "16.54.21101001"
      sha256 "963962717a9f246b433426edf3da6d6e718c2880e80da71cc204dd5704d52169"
    end
    # macOS 10.15 (Catalina)
    on_catalina do
      version "16.66.22101101"
      sha256 "2c6bac94224406f6b7d4ddb210e209fbe43a413b3f3285a078495cd79beba6c7"
    end
    # macOS 11 (Big Sur)
    on_big_sur do
      version "16.77.23091003"
      sha256 "65da5545d580bccf993a8038b0cc58105d7f2258b072c724b1f710ab9d51c640"
    end
    # macOS 12 (Monterey)
    on_monterey do
      version "16.88.24081116"
      sha256 "e10db9d22641e187e893abc4dc44dabadb1f8c331f9c1467e01d3e4538220259"
    end
    # macOS 13 (Ventura)
    on_ventura do
      version "16.101.25091314"
      sha256 "783ff93c0914617645a9206d9da7967cf02a9a3bf874ce7372088745d77f9f7f"
    end

    livecheck do
      skip "Legacy version"
    end
  end
  # macOS 14 (Sonoma)
  on_sonoma :or_newer do
    version "16.109.26053122"
    sha256 "f069d50b2e7a846de6e21be229a1aeba49c5a035e9852e40da9c7bf3108f1ed1"

    livecheck do
      url "https://go.microsoft.com/fwlink/p/?linkid=525133"
      regex(/(\d+(?:\.\d+)+)/i)
      strategy :header_match
    end
  end

  url "https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_365_and_Office_#{version}_Installer.pkg"
  name "Microsoft Office"
  desc "Office suite"
  homepage "https://www.microsoft.com/en-us/microsoft-365/mac/microsoft-365-for-mac/"

  auto_updates true
  conflicts_with cask: %w[
    microsoft-excel
    microsoft-office-businesspro
    microsoft-onenote
    microsoft-outlook
    microsoft-powerpoint
    microsoft-word
    onedrive
  ]
  depends_on :macos

  pkg "Microsoft_365_and_Office_#{version}_Installer.pkg",
      choices: [
        {
          "choiceIdentifier" => "com.microsoft.autoupdate", # Office16_all_autoupdate.pkg
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
      ]

  uninstall launchctl: [
              "com.microsoft.office.licensing.helper",
              "com.microsoft.office.licensingV2.helper",
              "com.microsoft.OneDriveStandaloneUpdater",
              "com.microsoft.OneDriveStandaloneUpdaterDaemon",
              "com.microsoft.OneDriveUpdaterDaemon",
              "com.microsoft.SyncReporter",
            ],
            quit:      "com.microsoft.autoupdate2",
            pkgutil:   [
              "com.microsoft.OneDrive",
              "com.microsoft.package.DFonts",
              "com.microsoft.package.Frameworks",
              "com.microsoft.package.Microsoft_Excel.app",
              "com.microsoft.package.Microsoft_OneNote.app",
              "com.microsoft.package.Microsoft_Outlook.app",
              "com.microsoft.package.Microsoft_PowerPoint.app",
              "com.microsoft.package.Microsoft_Word.app",
              "com.microsoft.package.Proofing_Tools",
              "com.microsoft.pkg.licensing",
              "com.microsoft.wdav",
              "com.microsoft.wdav.shim",
            ],
            delete:    [
              "/Applications/Microsoft Defender Shim.app",
              "/Applications/Microsoft Defender.app",
              "/Applications/Microsoft Excel.app",
              "/Applications/Microsoft OneNote.app",
              "/Applications/Microsoft Outlook.app",
              "/Applications/Microsoft PowerPoint.app",
              "/Applications/Microsoft Word.app",
              "/Applications/OneDrive.app",
            ]

  zap trash: [
    "~/Library/Application Scripts/com.microsoft.errorreporting",
    "~/Library/Application Scripts/com.microsoft.Excel",
    "~/Library/Application Scripts/com.microsoft.Office365ServiceV2",
    "~/Library/Application Scripts/com.microsoft.OneDrive.FileProvider",
    "~/Library/Application Scripts/com.microsoft.OneDrive.FinderSync",
    "~/Library/Application Scripts/com.microsoft.OneDriveLauncher",
    "~/Library/Application Scripts/com.microsoft.onenote.mac",
    "~/Library/Application Scripts/com.microsoft.onenote.mac.shareextension",
    "~/Library/Application Scripts/com.microsoft.openxml.excel.app",
    "~/Library/Application Scripts/com.microsoft.Outlook",
    "~/Library/Application Scripts/com.microsoft.outlook.profilemanager",
    "~/Library/Application Scripts/com.microsoft.Powerpoint",
    "~/Library/Application Scripts/com.microsoft.Word",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.excel.sfl*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.powerpoint.sfl*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.word.sfl*",
    "~/Library/Application Support/CrashReporter/Microsoft Error Reporting_*.plist",
    "~/Library/Application Support/Microsoft Update Assistant",
    "~/Library/Caches/com.microsoft.OneDriveStandaloneUpdater",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.microsoft.OneDriveStandaloneUpdater",
    "~/Library/Containers/com.microsoft.com.microsoft.RMS-XPCService",
    "~/Library/Containers/com.microsoft.errorreporting",
    "~/Library/Containers/com.microsoft.Excel",
    "~/Library/Containers/com.microsoft.netlib.shipassertprocess",
    "~/Library/Containers/com.microsoft.Office365ServiceV2",
    "~/Library/Containers/com.microsoft.onenote.mac",
    "~/Library/Containers/com.microsoft.onenote.mac.shareextension",
    "~/Library/Containers/com.microsoft.openxml.excel.app",
    "~/Library/Containers/com.microsoft.Outlook",
    "~/Library/Containers/com.microsoft.outlook.profilemanager",
    "~/Library/Containers/com.microsoft.Powerpoint",
    "~/Library/Containers/com.microsoft.Word",
    "~/Library/Group Containers/UBF8T346G9.ms",
    "~/Library/Group Containers/UBF8T346G9.Office",
    "~/Library/Group Containers/UBF8T346G9.OfficeOneDriveSyncIntegration",
    "~/Library/Group Containers/UBF8T346G9.OfficeOsfWebHost",
    "~/Library/HTTPStorages/com.microsoft.OneDriveStandaloneUpdater",
    "~/Library/HTTPStorages/com.microsoft.OneDriveStandaloneUpdater.binarycookies",
    "~/Library/Preferences/com.microsoft.Excel.plist",
    "~/Library/Preferences/com.microsoft.Outlook.plist",
    "~/Library/Preferences/com.microsoft.Powerpoint.plist",
    "~/Library/Preferences/com.microsoft.Word.plist",
    "~/Library/Saved Application State/com.microsoft.office.setupassistant.savedState",
    "~/Library/Saved Application State/com.microsoft.Word.savedState",
  ]
end
