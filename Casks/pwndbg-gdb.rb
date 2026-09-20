cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.09.15"
  sha256 arm:   "282d7532ea4330e193c33074dd5989115f9ae2e7cf174e73a99fe9faadbc130f",
         intel: "fe4b1391a7c2b8ba3e9599132c8f8e496889a48a3b8b83a9ea142196549a5c21"

  url "https://releases.pwndbg.re/releases/#{version}/pwndbg_#{version}_macos_#{arch}-portable.tar.xz"
  name "pwndbg-gdb"
  desc "Exploit Development and Reverse Engineering with GDB Made Easy"
  homepage "https://github.com/pwndbg/pwndbg"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "pwndbg/bin/pwndbg"

  postflight_steps do
    run "xattr", args: ["-d", "-r", "com.apple.quarantine", "{{staged_path}}/pwndbg"]
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
