cask "dotnet-sdk-macos@10" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "10.0.100-preview.7.25380.108"
    sha256 "f4aa82cb724114a87e0296eb197d0abe4e3762f531d82a297e3ae747453f647d"
  end
  on_intel do
    version "10.0.100-preview.7.25380.108"
    sha256 "63e9f6b70ad8f947aa36db959e490c90054d3ee9aff58f73c913b0ca59cd96f6"
  end

  url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version}/dotnet-sdk-#{version}-osx-#{arch}.pkg"
  name ".NET SDK"
  desc "Developer platform"
  homepage "https://www.microsoft.com/net/core#macos"

  # This identifies releases with the same major/minor version as the current
  # cask version. New major/minor releases occur annually in November and the
  # check will automatically update its behavior when the cask is updated.
  livecheck do
    url "https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/#{version.major_minor}/releases.json"
    regex(%r{/download/pr/([^/]+)/([^/]+)/dotnet-sdk[._-]v?(\d+(?:\.\d+)+)[._-]osx[._-]#{arch}\.pkg}i)
    strategy :json do |json, regex|
      json["releases"]&.map do |release|
        release.dig("sdk", "files")&.map do |file|
          file["url"]&.scan(regex)&.map { |match| "#{match[2]},#{match[0]},#{match[1]}" }
        end
      end&.flatten
    end
  end

  # conflicts_with cask: [
  #   "dotnet",
  #   "dotnet-sdk@preview",
  #   "dotnet@preview",
  # ], formula: "dotnet"
  depends_on macos: ">= :mojave"

  pkg "dotnet-sdk-#{version.csv.first}-osx-#{arch}.pkg"
  # binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.dev.10.*",
              "com.microsoft.dotnet.hostfxr.10.*",
              "com.microsoft.dotnet.pack.apphost.10.*",
              "com.microsoft.dotnet.pack.targeting.10.*",
              "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.10.*",
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
