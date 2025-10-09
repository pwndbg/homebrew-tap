cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.10.10"
  sha256 arm:   "8aa543c6a9de2710dbfe7c8d16ccf91a588e52d218a19dde6c5f2342d09b6dd2",
         intel: "f613df0784522453d130f5fe549bd9f878905cce875101c65b52a14e4a9590a2"

  url "https://github.com/pwndbg/pwndbg/releases/download/#{version}/pwndbg_#{version}_macos_#{arch}-portable.tar.xz"
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
