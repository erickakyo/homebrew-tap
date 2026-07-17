cask "cooldown" do
  version "0.1.0"
  sha256 "417164b02e5fa53f59f72fdbc7ff940a61ff28e44f8e91542a161529f2b6027a"

  url "https://github.com/erickakyo/cooldown/releases/download/v#{version}/Cooldown-#{version}.dmg"
  name "Cooldown"
  desc "Menu bar timer that alerts when Claude, ChatGPT or Gemini limits reset"
  homepage "https://github.com/erickakyo/cooldown"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "Cooldown.app"

  zap trash: "~/Library/Preferences/solutions.salto.cooldown.plist"

  caveats <<~EOS
    Cooldown is not notarized by Apple yet. If macOS blocks the first launch,
    right-click Cooldown.app in /Applications and choose "Open", or run:
      xattr -dr com.apple.quarantine /Applications/Cooldown.app
  EOS
end
