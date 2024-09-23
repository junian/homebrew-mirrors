cask "parallels-desktop@15" do
  version "15.1.5-47309"
  sha256 "94df473f7bddfd1371f78fd32d7f7bb16e5c9a1d1b39751bed77c992b6d3013e"

  url "https://download.parallels.com/desktop/v#{version.major}/#{version}/ParallelsDesktop-#{version}.dmg"
  name "Parallels Desktop"
  homepage "https://www.parallels.com/products/desktop/"

  livecheck do
    url "https://kb.parallels.com/eu/124724"
  end
  
  auto_updates true
  depends_on macos: ">= :sierra"
  # This .dmg cannot be extracted normally
  # Original discussion: https://github.com/Homebrew/homebrew-cask/pull/67202
  container type: :naked

  preflight do
    system_command "/usr/bin/hdiutil",
                   args: ["attach", "-nobrowse", "#{staged_path}/ParallelsDesktop-#{version}.dmg"]
    system_command "/Volumes/Parallels Desktop #{version.major}/Parallels Desktop.app/Contents/MacOS/inittool",
                   args: ["install", "-t", "#{appdir}/Parallels Desktop.app"],
                   sudo: true
    system_command "/usr/bin/hdiutil",
                   args: ["detach", "/Volumes/Parallels Desktop #{version.major}"]
  end

  uninstall_preflight do
    set_ownership "#{appdir}/Parallels Desktop.app"
  end

  uninstall delete: [
    "/usr/local/bin/prl_convert",
    "/usr/local/bin/prl_disk_tool",
    "/usr/local/bin/prl_perf_ctl",
    "/usr/local/bin/prlcore2dmp",
    "/usr/local/bin/prlctl",
    "/usr/local/bin/prlexec",
    "/usr/local/bin/prlsrvctl",
    "/Applications/Parallels Desktop.app",
    "/Applications/Parallels Desktop.app/Contents/Applications/Parallels Link.app",
    "/Applications/Parallels Desktop.app/Contents/Applications/Parallels Mounter.app",
    "/Applications/Parallels Desktop.app/Contents/Applications/Parallels Technical Data Reporter.app",
    "/Applications/Parallels Desktop.app/Contents/MacOS/Parallels Service.app",
    "/Applications/Parallels Desktop.app/Contents/MacOS/Parallels VM.app",
  ]

  zap trash: [
    "~/.parallels_settings",
    "~/Library/Caches/com.parallels.desktop.console",
    "~/Library/Preferences/com.parallels.desktop.console.LSSharedFileList.plist",
    "~/Library/Preferences/com.parallels.desktop.console.plist",
    "~/Library/Preferences/com.parallels.Parallels Desktop Statistics.plist",
    "~/Library/Preferences/com.parallels.Parallels Desktop.plist",
    "~/Library/Preferences/com.parallels.Parallels.plist",
  ]
end
