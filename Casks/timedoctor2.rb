cask "timedoctor2" do
  version "3.11.74"
  sha256 "5ca5fc93321ed971f96986e1142e481afd8e80764bca1433bc04639c9a269193"
  
  url "https://download.timedoctor.com/#{version}/macos/dmg/timedoctor2-#{version}-macos.dmg"
  name "Time Doctor 2"
  desc "Employee-friendly time tracking and productivity insights that enable teams to do their best work."
  homepage "https://www.timedoctor.com/"

  app "Time Doctor 2.app"
end
