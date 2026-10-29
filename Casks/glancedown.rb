cask "glancedown" do
  version "0.1.0"
  sha256 "da3b6251460d11ecc69bfe1a027b3d04c3de16105a11c01a198b5edf6eba7493"

  url "https://github.com/makcgr/glancedown/releases/download/v#{version}/Glancedown-#{version}.dmg"
  name "Glancedown"
  desc "Lightweight Markdown viewer with syntax highlighting, zoom and Quick Look"
  homepage "https://github.com/makcgr/glancedown"

  depends_on macos: :sonoma

  app "Glancedown.app"
  app "Glancedown Editor.app"

  zap trash: [
    "~/Library/Preferences/io.github.makcgr.glancedown.plist",
    "~/Library/Preferences/io.github.makcgr.glancedown.editor.plist",
    "~/Library/Saved Application State/io.github.makcgr.glancedown.savedState",
    "~/Library/Saved Application State/io.github.makcgr.glancedown.editor.savedState",
  ]

  caveats <<~EOS
    This build is not notarized yet. If macOS blocks the first launch, run:
      xattr -dr com.apple.quarantine "/Applications/Glancedown.app" "/Applications/Glancedown Editor.app"
  EOS
end
