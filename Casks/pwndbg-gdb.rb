cask "pwndbg" do
  arch arm: "arm64", intel: "amd64"

  version "2025.02.19"
  sha256 arm:   "29b6e65affb6b0c22eaefc29fbe1d96afc0b667fce440af4bf363aaf50c8e727",
         intel: "83eb5444a4217c57d4add829f94a17e016f55b76027d905f8be13fc46f93e6ad"

  url "https://github.com/pwndbg/pwndbg/releases/download/#{version}/pwndbg_#{version}_macos_#{arch}-portable.tar.xz"
  name "pwndbg"
  desc "Exploit Development and Reverse Engineering with GDB Made Easy"
  homepage "https://github.com/pwndbg/pwndbg"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "pwndbg/bin/pwndbg"

  zap trash: "~/.cache/pwndbg"
end
