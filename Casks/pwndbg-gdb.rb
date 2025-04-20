cask "pwndbg-gdb" do
  arch arm:   "7478e165333f7e1dc85edaddbcbf2438fc848ffd063431fd2430cd8a2b74996c"

  version "2025.04.13"
  sha256 arm:   "7478e165333f7e1dc85edaddbcbf2438fc848ffd063431fd2430cd8a2b74996c",
         intel: "d55b22d442c937262e3b49fc45976ee0cb3548dd105f9a46339b3c430ef245c7"

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
