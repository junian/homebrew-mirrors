cask "dotnet-sdk@7" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "7.0.408,5cd047f7-899a-4e00-9c86-d79fe7fe3d6e,82f1cb63ebebe92d084cfc7ab6204b6f"
    sha256 "04dd3dab6265f299059e14aa87d6e26dd3207fb78fae6b8e768fdc789c9e6a80"
  end
  on_intel do
    version "7.0.408,a54f7102-d834-48b0-b6f4-32d9d215dd51,57c2418d3d1d7be290e032e535af2d13"
    sha256 "ca3e72f9dab83dba6194bff886711483cb3c590cf9c6bbcdf8d0dbb6e1622bfd"
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
