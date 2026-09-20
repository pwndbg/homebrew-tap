cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.09.15"
  sha256 arm:   "7bb7dacc3b7fa217c6e7e59c0c87e359b245d57c1bc8dae3849fb2c6679307cf",
         intel: "ef40f389c9059269322d413357f014e9d778785923f7c25c51e90858e96ee059"

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
