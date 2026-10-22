cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.10.22"
  sha256 arm:   "cae851cda8b37c0e7640a04cbd0c2eb4f938d8ce9f99195db43a86b12fa0ec81",
         intel: "ccb77fcae5ffe281726cf43ae31b30816a21f638a0e11273cedcdf427c3ccc04"

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
