class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.1/spbstu-mcp_v0.10.1_darwin_arm64.tar.gz"
      sha256 "267deab86eebb1414262424e5a4334599a256e3bd37a61fbd1edfe7df39de3cd"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.1/spbstu-mcp_v0.10.1_darwin_amd64.tar.gz"
      sha256 "8e05f6bd863b57b6be3ba302a98a84b24691defd39f822ea46ec1659f9cd8b66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.1/spbstu-mcp_v0.10.1_linux_arm64.tar.gz"
      sha256 "5eaf91a5a51946e9a687d9423739bfaf098348adc59be0bf7ea30b55354768b8"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.10.1/spbstu-mcp_v0.10.1_linux_amd64.tar.gz"
      sha256 "8fae05661026e2a6ef1932d65d489dbeab7c232fd669e99dd740c1e4b41f97f2"
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
