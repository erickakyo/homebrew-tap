cask "cooldown" do
  version "0.1.1"
  sha256 "7cd818a8fda6e273c8b6af138ee9117b9310d2bda2cecf273e3b2ec32cda165f"

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
