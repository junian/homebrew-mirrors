cask "turbo-boost-switcher-pro" do
  version "2.10.2"
  # sha256 "32ca4284914a6a69cd7dac0d8641a270323ba073a21be0ced044bb748691a9e4"
  sha256 :no_check

  url "https://files.gumroad.com/attachments/2401211130126/#{ENV["HOMEBREW_GUMROADHASH"]}/original/Turbo_Boost_Switcher_Pro_v2.10.2.dmg?response-content-disposition=attachment&verify=#{ENV["HOMEBREW_GUMROADVERIFY"]}"
  name "Turbo Boost Switcher Pro"
  desc "Enable and disable the Intel CPU Turbo Boost feature"
  homepage "https://www.rugarciap.com/turbo-boost-switcher-for-os-x/"

  livecheck do
    url "https://www.rugarciap.com/turbo-boost-switcher-for-os-x-blog/"
  end

  suite "tbswitcher_resources"
  app "Turbo Boost Switcher Pro.app"

  uninstall quit: "rugarciap.com.Turbo-Boost-Switcher-Pro-Pro",
            kext: "com.rugarciap.DisableTurboBoost"

  zap trash: "~/Library/Preferences/rugarciap.com.Turbo-Boost-Switcher-Pro-Pro.plist"
end
