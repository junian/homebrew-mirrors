cask "dotnet-sdk@6" do
  arch arm: "arm64", intel: "x64"

  on_intel do
    version "6.0.421,3654f673-8801-454b-8d34-607a33f3ac39,2b642a9d794c3d3c5a4b218d9f5020d7"
    sha256 "a75cf0f07457b50ad021629ad7c07b9556b6fdec236d0062c7531aee4cf62a3a"
  end
  on_arm do
    version "6.0.421,ddaffb02-761d-4e21-a1fb-c96849a76428,9b97f4cc8a77e337486d5ffbef86ea1e"
    sha256 "52ea87e25061bb4eabe370b9ec6e0a4867c099e2521159a369eeb9d7cce708af"
  end

  url "https://download.visualstudio.microsoft.com/download/pr/#{version.csv.second}/#{version.csv.third}/dotnet-sdk-#{version.csv.first}-osx-#{arch}.pkg"
  name ".NET SDK"
  desc "Developer platform"
  homepage "https://www.microsoft.com/net/core#macos"

  livecheck do
    cask "dotnet"
    regex(%r{/download/pr/([^/]+)/([^/]+)/dotnet-sdk-v?(\d+(?:\.\d+)+)-osx-#{arch}\.pkg}i)
  end

  conflicts_with cask: [
    "dotnet",
    "homebrew/cask-versions/dotnet-preview",
    "homebrew/cask-versions/dotnet-sdk-preview",
  ], formula: "dotnet"
  depends_on macos: ">= :mojave"

  pkg "dotnet-sdk-#{version.csv.first}-osx-#{arch}.pkg"
  # binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.*",
              "com.microsoft.netstandard.pack.targeting.*",
            ],
            delete:  [
              "/etc/paths.d/dotnet",
              "/etc/paths.d/dotnet-cli-tools",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
  ]
end
