cask "cooldown" do
  version "0.1.2"
  sha256 "a21d934294b8a41fe6a16c3fa7af8a8d43f5300f679f1688cecbaf10810817ab"

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
    Cooldown is not notarized by Apple yet. If macOS blocks the first launch
    ("Apple could not verify..."), click OK, then go to System Settings >
    Privacy & Security and click "Open Anyway" — or run:
      xattr -dr com.apple.quarantine /Applications/Cooldown.app
  EOS
end
