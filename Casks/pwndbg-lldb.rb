cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.10.10"
  sha256 arm:   "39acae49f54a3dc7ddbcace60ac52ddc276205cd7027766cbe08532e80aaeee2",
         intel: "6765e46b216018a8e63132fbafda8545f33760f30273245a47be51ad07c15797"

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
