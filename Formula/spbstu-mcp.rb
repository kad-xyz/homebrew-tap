class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.7.0/spbstu-mcp_v0.7.0_darwin_arm64.tar.gz"
      sha256 "8ed2b54c590da93ae95b1e10d34223c999f71cf000d6b595cc2d0b14b31952ac"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.7.0/spbstu-mcp_v0.7.0_darwin_amd64.tar.gz"
      sha256 "4e0f58d3e36865aeb725d4e8ca7b8984c4b2c8ce9cb825ae8fb826f9589f7ecf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.7.0/spbstu-mcp_v0.7.0_linux_arm64.tar.gz"
      sha256 "3908541848ed7ea07ca21f4438e145ffcf30d7629db23aaa44778ac331bd861d"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.7.0/spbstu-mcp_v0.7.0_linux_amd64.tar.gz"
      sha256 "a9642ae8343a1a3b8b28655a480c16bf86f80087a923fc3fff88d649c6319c88"
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
