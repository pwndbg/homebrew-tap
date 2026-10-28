cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.10.28"
  sha256 arm:   "9c540bffce655aee35977380f272c685bb4c029f62b8d259f958737b20aad91f",
         intel: "15d3e508470c6a8564da031502e24aac2a7df301ccb326b97bfe67d9cc344554"

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
    run "xattr", args: ["-d", "-r", "com.apple.quarantine", "{{staged_path}}/pwndbg"]
  end

  zap trash: "~/.cache/pwndbg"
end
