cask "pwndbg-gdb" do
  arch arm: "arm64", intel: "amd64"

  version "2025.02.19"
  sha256 arm:   "29b6e65affb6b0c22eaefc29fbe1d96afc0b667fce440af4bf363aaf50c8e727",
         intel: "83eb5444a4217c57d4add829f94a17e016f55b76027d905f8be13fc46f93e6ad"

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
