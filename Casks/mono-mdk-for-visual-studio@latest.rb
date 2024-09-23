cask "mono-mdk-for-visual-studio@latest" do
  version "6.12.0.188"
  sha256 "07cdd4e5e72b562892960b7fc73af470db7a4ffc2f68bb834eb3d0a874bbd12c"

  url "https://download.mono-project.com/archive/#{version.major_minor_patch}/macos-10-universal/MonoFramework-MDK-#{version}.macos10.xamarin.universal.pkg"
  name "Mono"
  desc "Open source implementation of Microsoft's .NET Framework"
  homepage "https://www.mono-project.com/"

  # https://learn.microsoft.com/en-us/visualstudio/releases/2022/what-happened-to-vs-for-mac
  # deprecate! date: "2024-09-01", because: :discontinued

  conflicts_with cask:    "mono-mdk",
                 formula: "mono"

  pkg "MonoFramework-MDK-#{version}.macos10.xamarin.universal.pkg"

  uninstall pkgutil: "com.xamarin.mono-*",
            delete:  [
              "/Library/Frameworks/Mono.framework/Versions/#{version.major_minor_patch}",
              "/private/etc/paths.d/mono-commands",
            ],
            rmdir:   [
              "/Library/Frameworks/Mono.framework",
              "/Library/Frameworks/Mono.framework/Versions",
            ]

  zap delete: "~/Library/Preferences/mono-sgen64.plist",
      trash:  [
        "~/.mono",
        "~/Library/Caches/com.xamarin.fontconfig",
      ]

  caveats <<~EOS
    This is a version specific for Visual Studio users. This cask should follow the specific Visual Studio channel/branch maintained by mono developers.

    Installing #{token} removes mono and mono dependant formula binaries in
    /usr/local/bin and adds #{token} to /private/etc/paths.d/
    You may want to:

      brew unlink {formula} && brew link {formula}

    and/or remove /private/etc/paths.d/mono-commands
  EOS
end
