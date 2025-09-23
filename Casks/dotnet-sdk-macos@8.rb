cask "dotnet-sdk-macos@8" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "8.0.414"
    sha256 "34897089f3f67551f847c5d80d639ab9a50e7dea05181f57f9f997a5f21fea2d"
  end
  on_intel do
    version "8.0.414"
    sha256 "6ea82992ea66a75325d7a5ffe10bf2face4d9417ae16cb098483f17e144bffc7"
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
  #   "dotnet-sdk@preview",
  #   "dotnet@preview",
  # ], formula: "dotnet"
  depends_on macos: ">= :mojave"

  pkg "dotnet-sdk-#{version}-osx-#{arch}.pkg"
  # binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.dev.8.*",
              "com.microsoft.dotnet.hostfxr.8.*",
              "com.microsoft.dotnet.pack.apphost.8.*",
              "com.microsoft.dotnet.pack.targeting.8.*",
              "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.8.*",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
    "/etc/paths.d/dotnet",
    "/etc/paths.d/dotnet-cli-tools",
  ]
end
