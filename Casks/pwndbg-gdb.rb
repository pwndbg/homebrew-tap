cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.04.18"
  sha256 arm:   "6e5ec6933031a1d5b4fcb4dbd215114f555a0d7645ebcf346fdea57713e59c23",
         intel: "75f488824d91462bd78ff7881f2c97e7ae4ffd397691bd76d3cc1963a3365a7d"

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
