cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.04.13"
  sha256 arm:   "6aac98b06f4e4fe90000a0c6f7126a223a31292306af2d1289b06a5c68098e59",
         intel: "85532e4c9ecd91f2a0bc4ba92082cc661ee66955f44296dd641d7295ad38be50"

  url "https://github.com/pwndbg/pwndbg/releases/download/#{version}/pwndbg-lldb_#{version}_macos_#{arch}-portable.tar.xz"
  name "pwndbg-lldb"
  desc "Exploit Development and Reverse Engineering with LLDB Made Easy"
  homepage "https://github.com/pwndbg/pwndbg"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "pwndbg/bin/pwndbg-lldb"

  postflight do
    system "xattr", "-d", "-r", "com.apple.quarantine", "#{staged_path}/pwndbg/"
  end

  zap trash: "~/.cache/pwndbg"
end
