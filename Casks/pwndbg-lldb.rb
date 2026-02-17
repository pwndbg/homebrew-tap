cask "pwndbg-lldb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.02.17"
  sha256 arm:   "4b0fd513c4dd9ba1d34780b061fc42f6ff7c370f9fa64417b724660bb9fbb466",
         intel: "e762c3c4dbaa61703d2ddb8f952d4e0bed0fbe403168011b43e5e42fdfa8e19f"

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
