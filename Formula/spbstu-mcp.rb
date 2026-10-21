class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.9.0/spbstu-mcp_v0.9.0_darwin_arm64.tar.gz"
      sha256 "f5f7fa3ad28f239db2cce4cc6c60e6f4f4a13fa656550aac2ebd1cb4b162217e"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.9.0/spbstu-mcp_v0.9.0_darwin_amd64.tar.gz"
      sha256 "c41115db9317fc82cd7a52eea4d5fbf71f7f3c4ec876ef8eb4d8c0f9b6279ad1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.9.0/spbstu-mcp_v0.9.0_linux_arm64.tar.gz"
      sha256 "bf58116225341f7dcef768906e7829378b2fa4ff19f1aae5ce4da2dc92b21a3c"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.9.0/spbstu-mcp_v0.9.0_linux_amd64.tar.gz"
      sha256 "ffc8ec91d76d8c1e1f227575e43dee269aa5061ba73d03b1252f3ccc3815ea84"
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
