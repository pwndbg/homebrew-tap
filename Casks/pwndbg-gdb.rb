cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2026.10.22"
  sha256 arm:   "c9ea540ddc1836244bde3f3394f08e09d0fccba5bb45312105ad01811ba5ddd4",
         intel: "91f777fa34db13060d42eed5124ed390945354953ac8affbf1a215ed4a3e1a14"

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
