cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.02.18"
  sha256 arm:   "139c512c8154c3eb035edd66d1628685020c36a93ecb3c4b8ee457d2fa002399",
         intel: "c8940d51b65a09ff4c7857b62ff24a9b0a0c0100b8d661d831b42f6bb59a8a74"

  url "https://releases.pwndbg.re/releases/#{version}/pwndbg_#{version}_macos_#{arch}-portable.tar.xz"
  name "pwndbg-gdb"
  desc "Exploit Development and Reverse Engineering with GDB Made Easy"
  homepage "https://github.com/pwndbg/pwndbg"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "pwndbg/bin/pwndbg"

  postflight do
    system "xattr", "-d", "-r", "com.apple.quarantine", "#{staged_path}/pwndbg/"
  end

  caveats do
    <<~EOS
      ****************************************************
      pwndbg-gdb cannot be used to debug Mach-O binaries
      natively. However, it can still serve as a frontend
      for remote debugging.

      If you wish to debug native Mach-O/Darwin binaries,
      you should install pwndbg-lldb instead.

      ****************************************************

                    Enjoy remote debugging!
    EOS
  end

  zap trash: "~/.cache/pwndbg"
end
