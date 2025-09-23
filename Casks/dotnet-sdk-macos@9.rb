cask "dotnet-sdk-macos@9" do
  arch arm: "arm64", intel: "x64"

  on_arm do
    version "9.0.305"
    sha256 "7bbaf37675331cc58704bd4201800e8049658f4670ba256c86e7c42d49c7389b"
  end
  on_intel do
    version "9.0.305"
    sha256 "02eaf71a1485949b95d8b75e47c92439726e30eba3565e5dace0e120e9a2384d"
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

  pkg "dotnet-sdk-#{version}-osx-#{arch}.pkg"
  # binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.dev.9.*",
              "com.microsoft.dotnet.hostfxr.9.*",
              "com.microsoft.dotnet.pack.apphost.9.*",
              "com.microsoft.dotnet.pack.targeting.9.*",
              "com.microsoft.dotnet.sharedframework.Microsoft.NETCore.App.9.*",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
    "/etc/paths.d/dotnet",
    "/etc/paths.d/dotnet-cli-tools",
  ]
end
