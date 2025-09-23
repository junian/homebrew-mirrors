cask "dotnet-sdk-macos@7" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "7.0.410"
    sha256 "c7c16c5e2e5c22c73e62a5d67c9aff15db5e65ad9905ec1deadfb86d3daef0a8"
  end
  on_intel do
    version "7.0.410"
    sha256 "42eab8294702d3f206031829eebda95315c6f47944f65e6462ed14f5730d6cb5"
  end

  url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version}/dotnet-sdk-#{version}-osx-#{arch}.pkg"
  name ".NET SDK"
  desc "Developer platform"
  homepage "https://www.microsoft.com/net/core#macos"

  livecheck do
    cask "dotnet"
    regex(%r{/download/pr/([^/]+)/([^/]+)/dotnet-sdk-v?(\d+(?:\.\d+)+)-osx-#{arch}\.pkg}i)
  end

  # conflicts_with cask: [
  #   "dotnet",
  #   "homebrew/cask-versions/dotnet-preview",
  #   "homebrew/cask-versions/dotnet-sdk-preview",
  # ], formula: "dotnet"
  depends_on macos: ">= :mojave"

  pkg "dotnet-sdk-#{version}-osx-#{arch}.pkg"
  # binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.dev.7.*",
              "com.microsoft.dotnet.hostfxr.7.*",
              "com.microsoft.dotnet.pack.apphost.7.*",
              "com.microsoft.dotnet.pack.targeting.7.*",
              "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.7.*",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
    "/etc/paths.d/dotnet",
    "/etc/paths.d/dotnet-cli-tools",
  ]
end
