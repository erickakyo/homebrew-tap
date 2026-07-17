cask "cooldown" do
  version "1.0"
  sha256 "02acb935b44d7e7a4272dd8d7f4533dc693bfd9eef7d050b5a1d387f294e26d4"

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
