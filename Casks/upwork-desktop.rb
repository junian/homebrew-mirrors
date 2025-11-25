cask "upwork-desktop" do
  version "5.8.0.41,f0de03505cc349f2"
  sha256 "b7304b2ae7caab5775ef1a3f7021d5fb97a456fcd17a46d7e46c4152009eea67"

  url "https://upwork-usw2-desktopapp.upwork.com/binaries/v#{version.csv.first.dots_to_underscores}_#{version.csv.second}/Upwork.dmg",
      user_agent: :browser
  name "Upwork"
  desc "Work marketplace for freelancing"
  homepage "https://www.upwork.com/"

  livecheck do
    url "https://upwork-usw2-desktopapp.upwork.com/binaries/versions-mac.json"
    strategy :page_match do |page|
      match = page.match(%r{/v(\d+(?:_\d+)*)_([^/]+)/Upwork\.dmg}i)
      next if match.blank?

      "#{match[1].tr("_", ".")},#{match[2]}"
    end
  end

  app "Upwork.app"

  zap trash: [
    "~/Library/Application Support/CrashReporter/Upwork_*",
    "~/Library/Application Support/Upwork",
    "~/Library/Caches/Upwork",
    "~/Library/Logs/Upwork",
    "~/Library/Preferences/com.upwork.Upwork.plist",
    "~/Library/Saved Application State/com.upwork.upwork.savedState",
  ]
end
