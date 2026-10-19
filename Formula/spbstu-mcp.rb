class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.3.0/spbstu-mcp_v0.3.0_darwin_arm64.tar.gz"
      sha256 "2e4fb1ef770f8bbe64d5b327f9a9dd66c7ddbb71375e8e9832ec4a034d58c01a"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.3.0/spbstu-mcp_v0.3.0_darwin_amd64.tar.gz"
      sha256 "8e25389ec01430ef63aa56faa1402ea40c173c1ae5ce4bc39f95de336df5c3b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.3.0/spbstu-mcp_v0.3.0_linux_arm64.tar.gz"
      sha256 "a57e6751d0dd3309b1ea7a9ab7eb5497b1c95e170b1b46f50e875ef20d06c886"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.3.0/spbstu-mcp_v0.3.0_linux_amd64.tar.gz"
      sha256 "ea8bab1f63171e03ae6071272ac2bcb3e921678fde46a6199489eb37db885c10"
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
