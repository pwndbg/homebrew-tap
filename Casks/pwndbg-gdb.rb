cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.07.29"
  sha256 arm:   "22aa46f3670688f7256a2a1af7431457e13ef13deabdb3d4a84180f1b76d4032",
         intel: "9f690d13a797e1db63188aa198aab76832da7292e280e974ad84e72cdc5a3812"

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
