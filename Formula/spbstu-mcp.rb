class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.1/spbstu-mcp_v0.13.1_darwin_arm64.tar.gz"
      sha256 "098f81d3309e8795094bcd1a132ddae31ad0a538c7e29c0363e6f4bfc461a9d2"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.1/spbstu-mcp_v0.13.1_darwin_amd64.tar.gz"
      sha256 "b93aa4a04abefb6a1ce8c4f0af8884db444cdfbc3221ff062563d715e3fd886f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.1/spbstu-mcp_v0.13.1_linux_arm64.tar.gz"
      sha256 "97ebc6c6fc706015036b4062f52cb648312fc04ff957e003cb914ad1f6c6318f"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.1/spbstu-mcp_v0.13.1_linux_amd64.tar.gz"
      sha256 "b00712ac3e11e61fd0fc3fbc18b9a0490c8924c1fa11c078828dfa28ab51e6ed"
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
