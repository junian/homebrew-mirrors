cask "microsoft-office-license-removal" do
  arch arm: "arm64", intel: "x64"
  
  version "2.7"
  sha256 "8064f0d7ee1bf4316a533a0156c4d4e3649c5302174c4a1322577e2d03cd89f8"

  url "https://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Office_License_Removal_#{version}.pkg"
  name "Microsoft Office License Removal"
  desc "Microsoft Office License Removal"
  homepage "https://support.microsoft.com/en-us/office/how-to-remove-office-license-files-on-a-mac-b032c0f6-a431-4dad-83a9-6b727c03b193"

  pkg "Microsoft_Office_License_Removal_#{version}.pkg"
end
