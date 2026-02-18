cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.02.18"
  sha256 arm:   "1387994a7feec6091ed6d594917f9841098f7f2dedfa0783c48c53b694d94d04",
         intel: "3c791b970ff06f3c72aad3b8b212bd10043f7d1e4b162894644b5906670c1544"

  url "https://releases.pwndbg.re/releases/#{version}/pwndbg-lldb_#{version}_macos_#{arch}-portable.tar.xz"
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
