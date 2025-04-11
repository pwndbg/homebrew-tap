cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.02.19"
  sha256 arm:   "c95e5aab29197c751720d7b5f9ede285485f2d5aa5b8335052e3f1c08c280a5e",
         intel: "b84a8c0d576fc88dea6fede0ab3a870b93c740f1921f67ff72f14f149d3c1a3a"

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
