cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.02.17"
  sha256 arm:   "436ba642a68cace021de043149b4ea37c42f361b924c0e504d9d5a991bb79103",
         intel: "17547e8a421fa64ea2b3252d4788dd99631df2944418ce3867197495fd613b94"

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
