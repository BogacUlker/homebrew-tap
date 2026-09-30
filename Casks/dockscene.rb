cask "dockscene" do
  version "0.9.0"
  sha256 "c1a32265f9f38d0549c1c62948186875b43733285c9be1265fa0216f425f31b9"

  url "https://github.com/BogacUlker/dockscene-releases/releases/download/v#{version}/Dockscene.dmg"
  name "Dockscene"
  desc "Dock that changes its apps and widgets with what you're doing"
  homepage "https://dockscene.netlify.app/"

  livecheck do
    url "https://dockscene.netlify.app/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Dockscene.app"
  binary "#{appdir}/Dockscene.app/Contents/Helpers/dockscene"

  # Quitting puts back the macOS Dock that Dockscene hid.
  uninstall quit: "app.dockscene.Dockscene"

  zap trash: [
    "~/Library/Application Support/Dockscene",
    "~/Library/Caches/app.dockscene.Dockscene",
    "~/Library/HTTPStorages/app.dockscene.Dockscene",
    "~/Library/Preferences/app.dockscene.Dockscene.plist",
    "~/Library/Saved Application State/app.dockscene.Dockscene.savedState",
  ]
end
