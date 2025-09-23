cask "dotnet-sdk-macos@6" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "6.0.428"
    sha256 "a613c068212533d6b034cd614daf63633abcfe6697bc016d76a4ece1ce577c7f"
  end
  on_intel do
    version "6.0.428"
    sha256 "17bd1338041f37b242379b78a92ed9a9529c79894f13e47ae1ecf890a339d3b2"
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
              "com.microsoft.dotnet.dev.6.*",
              "com.microsoft.dotnet.hostfxr.6.*",
              "com.microsoft.dotnet.pack.apphost.6.*",
              "com.microsoft.dotnet.pack.targeting.6.*",
              "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.6.*",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
    "/etc/paths.d/dotnet",
    "/etc/paths.d/dotnet-cli-tools",
  ]
end
