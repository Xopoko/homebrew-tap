class Ascctl < Formula
  desc "Agent-first, spec-driven CLI for the App Store Connect API"
  homepage "https://github.com/Xopoko/AppStoreConnectCLI"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Xopoko/AppStoreConnectCLI/releases/download/v0.1.1/ascctl-v0.1.1-macos-arm64.tar.gz"
      sha256 "d224eba2c30057674145c6daadf1a404abbc7f5cd078ba5d6b6d38c2eb372ea8"
    end
    on_intel do
      url "https://github.com/Xopoko/AppStoreConnectCLI/releases/download/v0.1.1/ascctl-v0.1.1-macos-x86_64.tar.gz"
      sha256 "e150258683acbfb534b8f14be9cc7301e1c692ec5669704d6dd015d10028f714"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Xopoko/AppStoreConnectCLI/releases/download/v0.1.1/ascctl-v0.1.1-linux-x86_64.tar.gz"
      sha256 "9682f4a031f52a277ca6680e67fd4625b81f2c0d506b373a4c2c92a332872095"
    end
    on_arm do
      odie "linux arm64 is not supported yet"
    end
  end

  def install
    candidate = Dir["ascctl", "*/ascctl"].find { |p| File.file?(p) }
    odie "ascctl binary not found in archive" unless candidate
    bin.install candidate => "ascctl"
  end

  test do
    output = shell_output("#{bin}/ascctl --help")
    require "json"
    data = JSON.parse(output)
    assert data["ok"]
  end
end
