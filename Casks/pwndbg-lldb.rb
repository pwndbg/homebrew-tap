cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.07.29"
  sha256 arm:   "e96f5bf1e0f4567e4c386cf340558fb6435feeaf5780022b59952cff6bb8e34c",
         intel: "85431a8601c6e7a7079640fb530159dd1c8da86d2bbd5487465cf6f1db6f41f1"

  url "https://releases.pwndbg.re/releases/#{version}/pwndbg-lldb_#{version}_macos_#{arch}-portable.tar.xz"
  name "pwndbg-lldb"
  desc "Exploit Development and Reverse Engineering with LLDB Made Easy"
  homepage "https://github.com/pwndbg/pwndbg"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "pwndbg/bin/pwndbg-lldb"

  postflight_steps do
    system "xattr", "-d", "-r", "com.apple.quarantine", "#{staged_path}/pwndbg/"
  end

  zap trash: "~/.cache/pwndbg"
end
