cask "vosviewer@latest" do
  version "1.6.20"
  sha256 "4db3f51264f9b51a72ad7a5b739d5183381e7fe6976fb1ce826a8ea183c76a5f"

  url "https://www.vosviewer.com/downloads/VOSviewer_#{version}_mac.zip"
  name "VOSviewer"
  desc "Tool for constructing and visualizing bibliometric networks"
  homepage "https://www.vosviewer.com/"

  app "VOSviewer.app"
end
