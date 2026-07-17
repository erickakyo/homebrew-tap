cask "cooldown" do
  version "1.0"
  sha256 "0029b5c5f98e6b973c6b3f76429de8a0873a8afc3f4257762e5b46a77e436165"

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
