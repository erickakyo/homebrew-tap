cask "cooldown" do
  version "0.1.3"
  sha256 "07b58d45524a8f24b596be94a16f16f9a6c6c71a3af20688197154c2553d5157"

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

  uninstall quit: "solutions.salto.cooldown"

  zap trash: "~/Library/Preferences/solutions.salto.cooldown.plist"

  caveats <<~EOS
    Cooldown is not notarized by Apple yet. If macOS blocks the first launch
    ("Apple could not verify..."), click OK, then go to System Settings >
    Privacy & Security and click "Open Anyway" — or run:
      xattr -dr com.apple.quarantine /Applications/Cooldown.app
  EOS
end
