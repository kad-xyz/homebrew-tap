class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.0/spbstu-mcp_v0.10.0_darwin_arm64.tar.gz"
      sha256 "c71ab4286c12da70b9eb7309c83651db2ed9c86f75eaddf3bbefae7ed4ca71b3"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.0/spbstu-mcp_v0.10.0_darwin_amd64.tar.gz"
      sha256 "0d0760b0437f02ad83ded98a3dd9e5b3edc1b971658a93bd50108a15a16d0f04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.0/spbstu-mcp_v0.10.0_linux_arm64.tar.gz"
      sha256 "efaeaa30895e37ed2e3c4ffa6f047e420c6dbda6cee705d11dcd8ba33ae63b24"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.0/spbstu-mcp_v0.10.0_linux_amd64.tar.gz"
      sha256 "56b740b01c9f055f43ff4aaf03fae5e5645a916e3c3b3ced60134e2e4d048e67"
    end
  end

  def install
    bin.install "spbstu-mcp"
  end

  def caveats
    <<~EOS
      Store your university login first, then connect the server to Claude:
        security add-generic-password -s spbstu -a LOGIN@edu.spbstu.ru -T /usr/bin/security -w
        claude mcp add spbstu -s user -- #{opt_bin}/spbstu-mcp
      See https://github.com/kad-xyz/spbstu-mcp#quick-start
    EOS
  end

  test do
    assert_match "keychain-service", shell_output("#{bin}/spbstu-mcp -h 2>&1")
  end
end
