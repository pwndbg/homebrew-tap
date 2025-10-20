cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.10.20"
  sha256 arm:   "48a0e5a7ac8453cf339fd7d81e45b9d544d6d9ab2af1ff503efe6481b9aa2d61",
         intel: "af4b6e59ebf3b4472722ce979c0a92240e00ce99a49e11d2335a9f08fd04e0d8"

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
