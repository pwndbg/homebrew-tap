cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.05.30"
  sha256 arm:   "41723f5bf3d3422058d4c62210c3b01557ce90c53c715c89b11bfc048b022618",
         intel: "e44efb0d0c5e9ce336d5ccae0880aabbc9f07da1cffb8a70fe35c4b23181c692"

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
