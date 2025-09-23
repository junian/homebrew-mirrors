cask "dotnet-sdk-macos@10" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "10.0.100-rc.1.25451.107"
    sha512 "ad94ab7ddeafba6a19cb71d7e4af8f5937cea8d50a15e1fa20751b41ec82cf140b40fded39dbd7d4d50f89ee174ac034a6ae55313aeeb67b453a53dc66cbee5f"
  end
  on_intel do
    version "10.0.100-rc.1.25451.107"
    sha512 "de469378e1f613e867ab34dc7ae69a3c7f39a1fe70537650e3b0a9010c7cecb9e0c3c757c2bb1ea2c96a189014910b354c881b31d91eb876c502e57c5083b7d0"
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
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
    "/etc/paths.d/dotnet",
    "/etc/paths.d/dotnet-cli-tools",
  ]
end
